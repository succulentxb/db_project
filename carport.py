import flask
import pymysql
import time
import db_conf

host = db_conf.host
user = db_conf.user
password = db_conf.password
db_name = db_conf.db_name

def add_park_record():
    form = flask.request.form
    db = pymysql.connect(host, user, password, db_name)
    cursor = db.cursor()
    sql = """
            SELECT port_status 
            FROM normal_carport
            WHERE carport_id="""
    sql += str(form['carport_id'])
    print(sql)
    cursor.execute(sql)
    result = cursor.fetchone()
    if result[0] == 0:
        db.close()
        return flask.jsonify({"status": "error"})
    sql = """
            INSERT INTO park_record
            (carport_id, park_start_time, park_end_time, car_id)
            VALUES
            ("""
    sql += str(form['carport_id']) + ", '" + form['start_time'] + "', '"
    sql += form['end_time'] + "', '" + form['car_id'] +"')"
    print(sql)
    '''sql.format(
        carport_id=form['carport_id'],
        park_start_time=form['start_time'],
        park_end_time=form['end_time'],
        car_id=form['car_id']
    )'''
    cursor.execute(sql)
    db.commit()
    curr_time = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())
    if curr_time > form['start_time'] and curr_time < form['end_time']:
        sql = """
                UPDATE normal_carport
                SET port_status=0
                WHERE carport_id="""
        sql += str(form['carport_id'])
        print(sql)
        # sql.format(carport_id=form['carport_id'])
        cursor.execute(sql)
        db.commit()
    db.close()
    return flask.jsonify({"status": "success"})

def get_carports():
    update_carport_status()
    db = pymysql.connect(host, user, password, db_name)
    cursor = db.cursor()
    carports = []
    comm_dict = {"1": "A", "2": "b", "3": "C"}

    sql = """
        SELECT carport_id, comm_id, location_code, port_status
        FROM carport NATURAL JOIN normal_carport
        """
    cursor.execute(sql)
    results = cursor.fetchall()
    for row in results:
        carports.append({
            "carport_id": row[0], 
            "comm": comm_dict[str(row[1])], 
            "location": row[2], 
            "type": "normal", 
            "status": row[3] == 1
            })

    sql = """
        SELECT * 
            FROM carport 
            WHERE carport_type='sold' OR carport_type='rental'
            """
    cursor.execute(sql)
    results = cursor.fetchall()
    for row in results:
        carports.append({
            "carport_id": row[0], 
            "comm": comm_dict[str(row[1])], 
            "location": row[2], 
            "type": row[3], 
            "status": False})
    
    db.close()
    response = {
        "status": "success",
        "content": carports
    }
    return flask.jsonify(response)

def update_carport_status():
    db = pymysql.connect(host, user, password, db_name)
    cursor = db.cursor()
    sql = """
            SELECT carport_id
            FROM normal_carport
            WHERE port_status=0"""
    cursor.execute(sql)
    results = cursor.fetchall()
    now_time = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime())
    for row in results:
        sql = """
                SELECT park_end_time
                FROM park_record
                WHERE carport_id="""
        sql += str(row[0])
        cursor.execute(sql)
        end_times = cursor.fetchall()
        is_usable = True
        for end_time_row in end_times:
            is_usable = is_usable and (str(end_time_row[0]) <= now_time)
        if is_usable:
            sql = """
                    UPDATE normal_carport
                    SET port_status=1
                    WHERE carport_id="""
            sql += str(row[0])
            cursor.execute(sql)
            db.commit()
    db.close()