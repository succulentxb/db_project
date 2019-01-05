import db_conf
import pymysql
import flask

host = db_conf.host
user = db_conf.user
password = db_conf.password
db_name = db_conf.db_name

def get_equips():
    update_equip_status()
    db = pymysql.connect(host, user, password, db_name)
    cursor = db.cursor()

    sql = """
            SELECT equip_id, location_code, equip_status, equip_item, indoor
            FROM equipment"""
    cursor.execute(sql)
    equip_results = cursor.fetchall()
    equips = []
    for equip_row in equip_results:
        equips.append({
            "equip_id": equip_row[0],
            "location": equip_row[1],
            "equip_status": equip_row[2] == 1,
            "equip_item": equip_row[3],
            "indoor": equip_row[4] == 1
        })
    response = {"status": "success", "content": equips}
    db.close()
    return flask.jsonify(response)

def add_repair_record():
    form = flask.request.form
    db = pymysql.connect(host, user, password, db_name)
    cursor = db.cursor()
    sql = """
            INSERT INTO repair_record
            (reporter_id, equip_id, report_date, repair_status)
            VALUES
            ("""
    sql += str(form['reporter_id']) + ", " + str(form['equip_id']) + ", '"
    sql += form['report_date'] + "', 0)"
    cursor.execute(sql)
    db.commit()
    sql = """
            UPDATE equipment
            SET equip_status=0
            WHERE equip_id="""
    sql += str(form['equip_id'])
    cursor.execute(sql)
    db.commit()
    db.close()
    return flask.jsonify({"status": "success"})

def update_equip_status():
    db = pymysql.connect(host, user, password, db_name)
    cursor = db.cursor()
    sql = """
            SELECT equip_id
            FROM equipment
            WHERE equip_status=0"""
    cursor.execute(sql)
    equip_results = cursor.fetchall()
    for equip_row in equip_results:
        sql = """
                SELECT repair_status
                FROM repair_record
                WHERE equip_id="""
        sql += str(equip_row[0])
        cursor.execute(sql)
        repair_results = cursor.fetchall()
        is_repaired = True
        for repair_row in repair_results:
            is_repaired = is_repaired and (repair_row[0] == 1)
        if is_repaired:
            sql = """
                    UPDATE equipment
                    SET equip_status=1
                    WHERE equip_id="""
            sql += str(equip_row[0])
            cursor.execute(sql)
            db.commit()
    db.close()