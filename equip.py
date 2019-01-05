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

def get_repair_records():
    db = pymysql.connect(host, user, password, db_name)
    cursor = db.cursor()
    form = flask.request.form
    start_date = form['start_date']
    end_date = form['end_date']
    sql = """
            SELECT record_id, reporter_id, equip_id, location_code, report_date, repair_status
            FROM repair_record NATURAL JOIN equipment
            WHERE report_date>='"""
    sql += start_date + "' AND report_date<='" + end_date + "'"
    cursor.execute(sql)
    record_results = cursor.fetchall()
    records = []
    for record_row in record_results:
        records.append({
            "record_id": record_row[0],
            "reporter_id": record_row[1],
            "equip_id": record_row[2],
            "location": record_row[3],
            "report_date": record_row[4],
            "repair_status": record_row[5]
        })
    response = {
        "status": "success",
        "content": records
    }
    db.close()
    return flask.jsonify(response)