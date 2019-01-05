CREATE TABLE community(
    comm_id INT NOT NULL AUTO_INCREMENT,
    comm_name VARCHAR(100),
    comm_address VARCHAR(100),
    comm_descrip VARCHAR(100),
    PRIMARY KEY (comm_id)
);
CREATE TABLE carport(
    carport_id INT NOT NULL AUTO_INCREMENT,
    comm_id INT NOT NULL,
    location_code VARCHAR(50),
    carport_type VARCHAR(50),
    PRIMARY KEY (carport_id),
    FOREIGN KEY (comm_id) REFERENCES community(comm_id)
);

CREATE TABLE normal_carport(
    carport_id INT NOT NULL,
    port_status BOOLEAN NOT NULL,
    PRIMARY KEY (carport_id),
    FOREIGN KEY (carport_id) REFERENCES carport(carport_id)
);
CREATE TABLE park_record(
    record_id INT NOT NULL AUTO_INCREMENT,
    carport_id INT NOT NULL,
    park_start_time DATETIME NOT NULL,
    park_end_time DATETIME,
    car_id VARCHAR(50),
    PRIMARY KEY (record_id),
    FOREIGN KEY (carport_id) REFERENCES normal_carport(carport_id)
);
CREATE TABLE equipment(
    equip_id INT NOT NULL AUTO_INCREMENT,
    comm_id INT NOT NULL,
    location_code VARCHAR(50),
    equip_status BOOLEAN NOT NULL,
    equip_item VARCHAR(50),
    repair_fee INT,
    indoor BOOLEAN,
    PRIMARY KEY (equip_id),
    FOREIGN KEY (comm_id) REFERENCES community(comm_id)
);
CREATE TABLE building(
    building_id INT NOT NULL AUTO_INCREMENT,
    comm_id INT NOT NULL,
    building_name VARCHAR(50),
    location_code VARCHAR(50),
    PRIMARY KEY (building_id),
    FOREIGN KEY (comm_id) REFERENCES community(comm_id)
);
CREATE TABLE house(
    house_id INT NOT NULL AUTO_INCREMENT,
    building_id INT NOT NULL,
    unit VARCHAR(50),
    room_code VARCHAR(50),
    room_number INT,
    area INT NOT NULL,
    PRIMARY KEY (house_id),
    FOREIGN KEY (building_id) REFERENCES building(building_id)
);
CREATE TABLE house_bill(
    bill_id INT NOT NULL AUTO_INCREMENT,
    house_id INT NOT NULL,
    bill_date DATE,
    bill_amount INT NOT NULL,
    bill_status BOOLEAN NOT NULL,
    PRIMARY KEY (bill_id),
    FOREIGN KEY (house_id) REFERENCES house(house_id)
);
CREATE TABLE resident(
    resident_id INT NOT NULL AUTO_INCREMENT,
    house_id INT NOT NULL,
    comm_id INT NOT NULL,
    resident_name VARCHAR(50),
    gender BOOLEAN,
    live_start_date DATE,
    PRIMARY KEY (resident_id),
    FOREIGN KEY (house_id) REFERENCES house(house_id),
    FOREIGN KEY (comm_id) REFERENCES community(comm_id)
);
CREATE TABLE repair_record(
    record_id INT NOT NULL AUTO_INCREMENT,
    reporter_id INT,
    equip_id INT NOT NULL,
    report_date DATE,
    repair_status BOOLEAN,
    PRIMARY KEY (record_id),
    FOREIGN KEY (reporter_id) REFERENCES resident(resident_id),
    FOREIGN KEY (equip_id) REFERENCES equipment(equip_id)
);
CREATE TABLE compl_record(
    record_id INT NOT NULL AUTO_INCREMENT,
    complainer_id INT,
    complaint_date DATE,
    complaint_type VARCHAR(50),
    content VARCHAR(100),
    complaint_status BOOLEAN,
    result VARCHAR(100),
    PRIMARY KEY (record_id),
    FOREIGN KEY (complainer_id) REFERENCES resident(resident_id)
);

CREATE TABLE sold_carport(
    carport_id INT NOT NULL,
    owner_id INT,
    sold_date DATE NOT NULL,
    PRIMARY KEY (carport_id),
    FOREIGN KEY (carport_id) REFERENCES carport(carport_id),
    FOREIGN KEY (owner_id) REFERENCES resident(resident_id)
);
CREATE TABLE rental_carport(
    carport_id INT NOT NULL,
    owner_id INT,
    rent_start_date DATE NOT NULL,
    rent_end_date DATE,
    PRIMARY KEY (carport_id),
    FOREIGN KEY (carport_id) REFERENCES carport(carport_id),
    FOREIGN KEY (owner_id) REFERENCES resident(resident_id)
);