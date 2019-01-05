import pymysql
import flask
import db_conf

host = db_conf.host
user = db_conf.user
password = db_conf.password
db_name = db_conf.db_name

def get_resident():
    db = pymysql.connect(host, user, password, db_name)
    cursor = db.cursor()
    sql = "SELECT * FROM resident"
    cursor.execute(sql)
    resident_results = cursor.fetchall()
    residents = []
    for resident_row in resident_results:
        if resident_row[4] == 0:
            gender = "male"
        else:
            gender = "female"
        residents.append({
            "resident_id": resident_row[0],
            "house_id": resident_row[1],
            "comm_id": resident_row[2],
            "resident_name": resident_row[3],
            "gender": gender,
            "live_start_date": str(resident_row[5])
        })
    response = {
        "status": "success",
        "content": residents
    }
    db.close()
    return flask.jsonify(response)

def add_resident():
    db = pymysql.connect(host, user, password, db_name)
    cursor = db.cursor()
    form = flask.request.form
    sql = """
            SELECT comm_id
            FROM house NATURAL JOIN building
            WHERE house_id="""
    sql += form['house_id']
    res_num = cursor.execute(sql)
    if res_num == 0:
        response = {
            "status": "error",
            "info": "House ID not found."
        }
        return flask.jsonify(response)
    comm_result = cursor.fetchall()
    comm_id = comm_result[0][0]
    if form['gender'] == 'male':
        gender = 0
    else:
        gender = 1
    sql = """
            INSERT INTO resident
            (house_id, comm_id, resident_name, gender, live_start_date)
            VALUES
            ("""
    sql += str(form['house_id']) + ", " + str(comm_id) + ", '" + form['resident_name'] + "', "
    sql += str(gender) + ", '" + form['live_start_date'] + "')"
    cursor.execute(sql)
    db.commit()
    db.close()
    return flask.jsonify({"status": "success"})