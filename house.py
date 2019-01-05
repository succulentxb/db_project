import db_conf
import flask
import pymysql

host = db_conf.host
user = db_conf.user
password = db_conf.password
db_name = db_conf.db_name

def get_empty_houses():
    db = pymysql.connect(host, user, password, db_name)
    cursor = db.cursor()
    sql = """
            SELECT house_id, building_id, comm_id, room_code, room_number, area
            FROM (house NATURAL JOIN building) NATURAL JOIN community
            WHERE house_id NOT IN (
                SELECT house_id
                FROM resident
            )"""
    cursor.execute(sql)
    empty_house_results = cursor.fetchall()
    empty_houses = []
    for house_row in empty_house_results:
        empty_houses.append({
            "house_id": house_row[0],
            "building_id": house_row[1],
            "comm_id": house_row[2],
            "room_code": house_row[3],
            "room_number": house_row[4],
            "area": house_row[5]
        })
    response = {
        "status": "success",
        "content": empty_houses
    }
    db.close()
    return flask.jsonify(response)

def get_bill():
    db = pymysql.connect(host, user, password, db_name)
    cursor = db.cursor()
    form = flask.request.form
    start_date = form['start_date']
    end_date = form['end_date']
    sql = """SELECT house_id, area, comm_id, bill_id, bill_status
            FROM (house NATURAL JOIN building) NATURAL JOIN community NATURAL JOIN house_bill
            WHERE house_id in (
                SELECT house_id FROM resident
            ) AND bill_date>='"""
    sql += start_date + "' AND bill_date<='" + end_date + "'"
    cursor.execute(sql)
    house_results = cursor.fetchall()
    houses = []
    for house_row in house_results:
        houses.append({
            "house_id": house_row[0], 
            "area": house_row[1], 
            "comm_id": house_row[2],
            "bill_id": house_row[3],
            "bill_status": house_row[4]
            })
    for i in range(len(houses)):
        sql = """SELECT COUNT(carport_id)
                FROM resident, sold_carport
                WHERE resident_id=owner_id AND house_id="""
        sql += str(houses[i]['house_id'])
        cursor.execute(sql)
        sold_results = cursor.fetchall()
        houses[i]["sold_num"] = sold_results[0][0]
        
        sql = """SELECT COUNT(carport_id)
                FROM resident, rental_carport
                WHERE resident_id=owner_id AND house_id="""
        sql += str(houses[i]['house_id'])
        cursor.execute(sql)
        rental_results = cursor.fetchall()
        houses[i]["rental_num"] = rental_results[0][0]
    house_bills = []
    property_fee_list = [1, 1.5, 2]
    for house in houses:
        bill_amount = house['area'] * property_fee_list[house['comm_id']-1]
        bill_amount += house['sold_num'] * 50
        bill_amount += house['rental_num'] * 50
        house_bills.append({
            "bill_id": house['bill_id'],
            "house_id": house['house_id'],
            "bill_amount": bill_amount,
            "bill_status": house['bill_status']
        })
    response = {
        "status": "success",
        "content": house_bills
    }
    db.close()
    return flask.jsonify(response)
    