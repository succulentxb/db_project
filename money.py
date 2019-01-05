import db_conf
import flask
import pymysql
import datetime

host = db_conf.host
user = db_conf.user
password = db_conf.password
db_name = db_conf.db_name

def get_money():
    db = pymysql.connect(host, user, password, db_name)
    cursor = db.cursor()
    form = flask.request.form
    start_date = form['start_date']
    end_date = form['end_date']
    
    # get property fee
    sql = """
            SELECT comm_id, SUM(area)
            FROM (house NATURAL JOIN building) NATURAL JOIN community
            GROUP BY comm_id"""
    cursor.execute(sql)
    area_results = cursor.fetchall()
    house_property_fee = 0
    fee_list = [1, 1.5, 2]
    for area_row in area_results:
        house_property_fee += float(area_row[1]) * fee_list[area_row[0]-1]
    
    sql = """
            SELECT COUNT(carport_id)
            FROM carport
            WHERE carport_type='sold' OR carport_type='rental'"""
    cursor.execute(sql)
    carport_result = cursor.fetchall()
    carport_property_fee = carport_result[0][0] * 50

    # get carport fee
    # sold carport
    sql = """
            SELECT comm_id, COUNT(carport_id)
            FROM sold_carport NATURAL JOIN carport
            WHERE sold_date>='"""
    sql += start_date + "' AND sold_date<='" + end_date + "'"
    sql += "GROUP BY comm_id"
    cursor.execute(sql)
    sold_carport_results = cursor.fetchall()
    sold_carport_fee = 0
    carport_sold_fee_list = [200000, 220000, 240000]
    for sold_row in sold_carport_results:
        sold_carport_fee += int(sold_row[1]) * carport_sold_fee_list[sold_row[0]-1]
    
    # rental carport
    sql = """
            SELECT carport_id, comm_id, rent_start_date, rent_end_date
            FROM rental_carport NATURAL JOIN carport
            WHERE rent_start_date>='"""
    #sql += start_date + "' AND rent_start_date<='"
    sql += start_date + "' AND rent_start_date<='" + end_date + "'"
    cursor.execute(sql)
    rental_results = cursor.fetchall()
    rental_fee = 0
    rental_fee_list = [200, 250, 300]
    for rental_row in rental_results:
        rental_time = int(str(rental_row[3] - rental_row[2]).split(' ')[0])
        discount = 1.0
        if rental_time >= 365:
            discount = 0.8
        rental_fee += rental_time/30 * rental_fee_list[rental_row[1]-1] * discount
    
    # normal carport
    sql = """
            SELECT record_id, park_start_time, park_end_time
            FROM park_record
            WHERE park_start_time>='"""
    sql += start_date + "' AND park_end_time<='" + end_date + "'"
    cursor.execute(sql)
    record_results = cursor.fetchall()
    park_fee = 0
    for record_row in record_results:
        park_time = record_row[2] - record_row[1]
        if park_time < datetime.timedelta(hours=1):
            park_fee += 0
        elif park_time >= datetime.timedelta(hours=1) and park_time < datetime.timedelta(hours=8):
            park_fee += 5
        elif park_time >= datetime.timedelta(hours=8) and park_time <= datetime.timedelta(hours=24):
            park_fee += 10
        else:
            park_fee += park_time.days * 10

    # get repair fee
    sql = """
            SELECT SUM(repair_fee)
            FROM equipment NATURAL JOIN repair_record
            WHERE report_date>='"""
    sql += start_date + "' AND report_date<='" + end_date + "'"
    repair_result_num = cursor.execute(sql)
    
    repair_result = cursor.fetchall()
    repair_fee = repair_result[0][0]
    if repair_fee == None:
        repair_fee = 0

    response = {
        "status": "success",
        "content": {
            "house_property_fee": float(house_property_fee),
            "carport_property_fee": float(carport_property_fee),
            "sold_carport_fee": float(sold_carport_fee),
            "rental_fee": float(rental_fee),
            "park_fee": float(park_fee),
            "repair_fee": float(repair_fee)
        }
    }
    db.close()
    return flask.jsonify(response)