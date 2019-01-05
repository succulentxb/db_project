import flask
import pymysql
import db_conf
import carport
import equip
import house
import resident
import complaint
import money

app = flask.Flask(__name__)
host = db_conf.host
user = db_conf.user
password = db_conf.password
db_name = db_conf.db_name

@app.route('/')
def login_html():
    return app.send_static_file('html/login.html')

@app.route('/login', methods=['POST'])
def login():
    #form = flask.request.form
    if True: #form['account'] == 'property' and form['password'] == 'property':
        return flask.jsonify({"status": "success"})
    else:
        return flask.jsonify({"status": "failed"})

@app.route('/manager')
def main_page():
    return app.send_static_file('html/main.html')

@app.route('/carport')
def carport_page():
    return app.send_static_file('html/carport.html')

@app.route('/carport/get_carports')
def get_carports():
    return carport.get_carports()

@app.route('/carport/add_record', methods=['POST'])
def add_park_record():
    return carport.add_park_record()  

@app.route('/equip')
def equip_page():
    return app.send_static_file('html/equip.html')

@app.route('/equip/get_equips')
def get_equips():
    return equip.get_equips()

@app.route('/equip/add_repair_record', methods=['POST'])
def add_repair_record():
    return equip.add_repair_record()

@app.route('/house')
def house_page():
    return app.send_static_file('html/house.html')

@app.route('/house/get_empty_house')
def get_empty_house():
    return house.get_empty_houses()

@app.route('/house/get_bill', methods=['POST'])
def get_bill():
    return house.get_bill()

@app.route('/resident')
def resident_page():
    return app.send_static_file('html/resident.html')

@app.route('/resident/get_resident')
def get_resident():
    return resident.get_resident()

@app.route('/resident/add_resident', methods=['POST'])
def add_resident():
    return resident.add_resident()

@app.route('/complaint')
def complaint_page():
    return app.send_static_file('html/complaint.html')

@app.route('/complaint/get_compl_record', methods=['POST'])
def get_compl_record():
    return complaint.get_compl_record()

@app.route('/complaint/add_record', methods=['POST'])
def add_compl_record():
    return complaint.add_compi_record()


@app.route('/money')
def money_page():
    return app.send_static_file('html/money.html')

@app.route('/money/get_money', methods=['POST'])
def get_money():
    return money.get_money()

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=9000, debug=True)