### login
#### request url: 
    /login
#### request paras: 
    {"acount": "xxxx", "password": "xxxx"}
#### respone:
    success: {"status": "success"}
    failed: {"status": "failed"}

### get carports information
#### request url:
    /carport/get_carports
#### request paras:

#### response
    success:
        {
            "status": "success",
            "content": 
            [
                {
                    "carport_id": 1, 
                    "comm": "A", 
                    "location": "A-port-1-1", 
                    "type": "sold", 
                    "status": false
                }
            ]
        }
    error: {"status": "error"}

### add park record
#### request url:
    /carport/add_record
#### request paras:
    {
        "carport_id: 1,
        "car_id": A1,
        "start_time": "2019-01-01 00:00:00",
        "end_time": "2019-01-01 00:10:00"
    }
#### response
    success: {"status": "success"}
    error: {"status": "error"}

### get equipments information
#### request url:
    /equip/get_equips
#### request paras

#### response
    success:
        {
            "status": "success",
            "content":
            [
                {
                    "equip_id": 1,
                    "location": "A-equip-1-1",
                    "equip_status": true,
                    "equip_item": "light",
                    "indoor": true
                }
            ]
        }
    error: {"status": "error"}

### add repair record
#### request url
    /equip/add_repair_record
#### request paras
    {
        "reporter_id": 1, 
        "equip_id": 1, 
        "report_date": "2019-01-01"
    }
#### response paras
    success: {"status": "success"}

### get repair records
#### request url
    /equip/get_record
#### request paras
    {"start_time": "2019-01-01", "end_time": "2019-01-31"}
#### response
    success: 
        {
            "status": "success",
            "content":
                [
                    {
                        "record_id": 1,
                        "reporter_id": 1,
                        "equip_id": 1,
                        "location": "A-equip-1-1",
                        "report_date": "2019-01-01",
                        "repair_status": false
                    }
                ]
        }

#### empty house information
### request url
    /house/get_empty_house
### request paras

### response
    {
        "status": "success",
        "content": 
        [
            {
                "house_id": 1,
                "building_id": 1,
                "comm_id": 1,
                "room_code": "101",
                "room_number": 2,
                "area": 50
            }
        ]
    }

#### get resident
### request url
    /resident/get_resident
### request paras

### response
    success:
        {
            "status": "success",
            "content": 
                [
                    {
                        "resident_id": 1,
                        "house_id": 1,
                        "comm_id": 1,
                        "resident_name": "Mike",
                        "gender": "male",
                        "live_start_time": "2018-12-01"
                    }
                ]
        }

### add resident
#### request url
    /resident/add_resident
#### request paras
    {
        "house_id": 1,
        "resident_name": Nana,
        "gender": "male",
        "live_start_date": "2019-01-01"
    }
#### response 
    success: {"status": "success"}
    error: {
        "status": "error",
        "info": "xxxx"
    }

### get bill
#### request url
    /house/get_bill
#### request paras
    {"start_date": "2019-01-01", "end_date": "2019-01-31"}
#### response
    success:
        {
            "status": "success",
            "content": 
                [
                    {
                        "bill_id": 1,
                        "house_id": 1,
                        "bill_amount": 150.0,
                        "bill_status": 0
                    }
                ]
        }

### get complaint record
#### request url
    /complaint/get_compl_record
#### request paras
    {"start_date": "2019-01-01", "end_date": "2019-01-31"}
#### response
    success:
        {
            "status": "success",
            "content": 
                [
                    "record_id": 1, 
                    "complainer_id": 1,
                    "complaint_type": "house",
                    "content": "too cold",
                    "complaint_status": false,
                    "result": null
                ]
        }

### add complaint record
#### request url
    /complaint/add_record
#### request paras
    {
        "complainer_id": 1,
        "complaint_date": "2019-01-01",
        "complaint_type": "house",
        "content": "too cold in house"
    }
#### response 
    success: {"status": "success"}
    error: {"status": "error", "info": "Complainer ID not found."}

### get money status
#### request url
    /money/get_money
#### request paras
    {"start_date": "2019-01-01", "end_time": "2019-01-01"}
#### response 
    success:
        {
            "status": "success",
            "content":
                {
                    "house_property_fee": 1000,
                    "carport_property_fee": 1000,
                    "sold_carport_fee": 200000,
                    "rental_fee": 1000,
                    "park_fee": 1000,
                    "repair_fee": 1000
                }
        }