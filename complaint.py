import flask
import pymysql
import db_conf

host = db_conf.host
user = db_conf.user
password = db_conf.password
db_name = db_conf.db_name

def get_compl_record():
    db = pymysql.connect(host, user, password, db_name)
    cursor = db.cursor()
    form = flask.request.form
    start_date = form['start_date']
    end_date = form['end_date']
    sql = """
            SELECT *
            FROM compl_record
            WHERE complaint_date>='"""
    sql += start_date + "' AND complaint_date<='" + end_date + "'"
    cursor.execute(sql)
    record_results = cursor.fetchall()
    records = []
    for record_row in record_results:
        records.append({
            "record_id": record_row[0],
            "complainer_id": record_row[1],
            "complaint_type": record_row[3],
            "content": record_row[4],
            "complaint_status": record_row[5] == 1,
            "result": record_row[6]
        })
    response = {
        "status": "success",
        "content": records
    }
    db.close()
    return flask.jsonify(response)

def add_compi_record():
    db = pymysql.connect(host, user, password, db_name)
    cursor = db.cursor()
    form = flask.request.form 
    sql = """
            INSERT INTO compl_record
            (complainer_id, complaint_date, complaint_type, content, complaint_status)
            VALUES
            ("""
    sql += form['complainer_id'] + ", '"
    sql += form['complaint_date'] + "', '"
    sql += form['complaint_type'] + "', '"
    sql += form['content'] + "', 0)"
    try:
        cursor.execute(sql)
        db.commit()
        db.close()
        return flask.jsonify({"status": "success"})
    except:
        return flask.jsonify({"status": "success", "info": "Complainer ID not found."})