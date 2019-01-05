/* insert data to community */
INSERT INTO community 
(comm_id, comm_name, comm_address, comm_descrip)
VALUES
(1, "A", "High-Tech Park, Pudong, Shanghai", "High-Tech Park");
INSERT INTO community 
(comm_id, comm_name, comm_address, comm_descrip)
VALUES
(2, "B", "High-Tech Park, Pudong, Shanghai", "High-Tech Park");
INSERT INTO community 
(comm_id, comm_name, comm_address, comm_descrip)
VALUES
(3, "C", "High-Tech Park, Pudong, Shanghai", "High-Tech Park");

/* insert data to carport */
/* carports in A */
INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(1, 1, "A-port-1-1", "sold");
INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(2, 1, "A-port-1-2", "sold");
INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(3, 1, "A-port-1-3", "sold");
INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(4, 1, "A-port-1-4", "sold");

INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(5, 1, "A-port-1-5", "rental");
INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(6, 1, "A-port-1-6", "rental");
INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(7, 1, "A-port-1-7", "rental");
INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(8, 1, "A-port-1-8", "rental");

INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(9, 1, "A-port-1-9", "normal");
INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(10, 1, "A-port-1-10", "normal");
INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(11, 1, "A-port-1-11", "normal");
INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(12, 1, "A-port-1-12", "normal");

/* carports in B */
INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(13, 2, "B-port-1-1", "sold");
INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(14, 2, "B-port-1-2", "sold");
INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(15, 2, "B-port-1-3", "sold");
INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(16, 2, "B-port-1-4", "sold");

INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(17, 2, "B-port-1-5", "rental");
INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(18, 2, "B-port-1-6", "rental");
INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(19, 2, "B-port-1-7", "rental");
INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(20, 2, "B-port-1-8", "rental");

INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(21, 2, "B-port-1-9", "normal");
INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(22, 2, "B-port-1-10", "normal");
INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(23, 2, "B-port-1-11", "normal");
INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(24, 2, "B-port-1-12", "normal");

/* carports in C */
INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(25, 3, "C-port-1-1", "sold");
INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(26, 3, "C-port-1-2", "sold");
INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(27, 3, "C-port-1-3", "sold");
INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(28, 3, "C-port-1-4", "sold");

INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(29, 3, "C-port-1-5", "rental");
INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(30, 3, "C-port-1-6", "rental");
INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(31, 3, "C-port-1-7", "rental");
INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(32, 3, "C-port-1-8", "rental");

INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(33, 3, "C-port-1-9", "normal");
INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(34, 3, "C-port-1-10", "normal");
INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(35, 3, "C-port-1-11", "normal");
INSERT INTO carport
(carport_id, comm_id, location_code, carport_type)
VALUES
(36, 3, "C-port-1-12", "normal");

/* insert data to normal_carport */
INSERT INTO normal_carport
(carport_id, port_status)
VALUES
(9, 1);
INSERT INTO normal_carport
(carport_id, port_status)
VALUES
(10, 1);
INSERT INTO normal_carport
(carport_id, port_status)
VALUES
(11, 1);
INSERT INTO normal_carport
(carport_id, port_status)
VALUES
(12, 1);
INSERT INTO normal_carport
(carport_id, port_status)
VALUES
(21, 1);
INSERT INTO normal_carport
(carport_id, port_status)
VALUES
(22, 1);
INSERT INTO normal_carport
(carport_id, port_status)
VALUES
(23, 1);
INSERT INTO normal_carport
(carport_id, port_status)
VALUES
(24, 1);
INSERT INTO normal_carport
(carport_id, port_status)
VALUES
(33, 1);
INSERT INTO normal_carport
(carport_id, port_status)
VALUES
(34, 1);
INSERT INTO normal_carport
(carport_id, port_status)
VALUES
(35, 1);
INSERT INTO normal_carport
(carport_id, port_status)
VALUES
(36, 1);

/* insert data to park_record */
INSERT INTO park_record
(record_id, carport_id, park_start_time, park_end_time, car_id)
VALUES
(1, 9, '2019-01-01 00:00:00', '2019-01-01 01:00:00', 'A1234');
INSERT INTO park_record
(record_id, carport_id, park_start_time, park_end_time, car_id)
VALUES
(2, 10, '2019-01-01 00:00:00', '2019-01-01 01:00:00', 'A1235');
INSERT INTO park_record
(record_id, carport_id, park_start_time, park_end_time, car_id)
VALUES
(3, 11, '2019-01-01 00:00:00', '2019-01-01 01:00:00', 'A1236');
INSERT INTO park_record
(record_id, carport_id, park_start_time, park_end_time, car_id)
VALUES
(4, 12, '2019-01-01 00:00:00', '2019-01-01 01:00:00', 'A1237');

INSERT INTO park_record
(record_id, carport_id, park_start_time, park_end_time, car_id)
VALUES
(5, 21, '2019-01-01 00:00:00', '2019-01-01 01:00:00', 'A1214');
INSERT INTO park_record
(record_id, carport_id, park_start_time, park_end_time, car_id)
VALUES
(6, 22, '2019-01-01 00:00:00', '2019-01-01 01:00:00', 'A1225');
INSERT INTO park_record
(record_id, carport_id, park_start_time, park_end_time, car_id)
VALUES
(7, 23, '2019-01-01 00:00:00', '2019-01-01 01:00:00', 'A1246');
INSERT INTO park_record
(record_id, carport_id, park_start_time, park_end_time, car_id)
VALUES
(8, 24, '2019-01-01 00:00:00', '2019-01-01 01:00:00', 'A1257');

INSERT INTO park_record
(record_id, carport_id, park_start_time, park_end_time, car_id)
VALUES
(9, 33, '2019-01-01 00:00:00', '2019-01-01 01:00:00', 'A1334');
INSERT INTO park_record
(record_id, carport_id, park_start_time, park_end_time, car_id)
VALUES
(10, 34, '2019-01-01 00:00:00', '2019-01-01 01:00:00', 'A1435');
INSERT INTO park_record
(record_id, carport_id, park_start_time, park_end_time, car_id)
VALUES
(11, 35, '2019-01-01 00:00:00', '2019-01-01 01:00:00', 'A1536');
INSERT INTO park_record
(record_id, carport_id, park_start_time, park_end_time, car_id)
VALUES
(12, 36, '2019-01-01 00:00:00', '2019-01-01 01:00:00', 'A1637');

/* insert data to equipment */
INSERT INTO equipment
(equip_id, comm_id, location_code, equip_status, equip_item, repair_fee)
VALUES
(1, 1, "A-equip-1-1", 1, "light", 10);
INSERT INTO equipment
(equip_id, comm_id, location_code, equip_status, equip_item, repair_fee)
VALUES
(2, 1, "A-equip-1-2", 1, "light", 10);
INSERT INTO equipment
(equip_id, comm_id, location_code, equip_status, equip_item, repair_fee)
VALUES
(3, 1, "A-equip-1-3", 1, "light", 10);
INSERT INTO equipment
(equip_id, comm_id, location_code, equip_status, equip_item, repair_fee)
VALUES
(4, 1, "A-equip-1-4", 1, "light", 10);

INSERT INTO equipment
(equip_id, comm_id, location_code, equip_status, equip_item, repair_fee)
VALUES
(5, 2, "B-equip-1-1", 1, "light", 10);
INSERT INTO equipment
(equip_id, comm_id, location_code, equip_status, equip_item, repair_fee)
VALUES
(6, 2, "B-equip-1-2", 1, "light", 10);
INSERT INTO equipment
(equip_id, comm_id, location_code, equip_status, equip_item, repair_fee)
VALUES
(7, 2, "B-equip-1-3", 1, "light", 10);
INSERT INTO equipment
(equip_id, comm_id, location_code, equip_status, equip_item, repair_fee)
VALUES
(8, 2, "B-equip-1-4", 1, "light", 10);

INSERT INTO equipment
(equip_id, comm_id, location_code, equip_status, equip_item, repair_fee)
VALUES
(9, 3, "C-equip-1-1", 1, "light", 10);
INSERT INTO equipment
(equip_id, comm_id, location_code, equip_status, equip_item, repair_fee)
VALUES
(10, 3, "C-equip-1-2", 1, "light", 10);
INSERT INTO equipment
(equip_id, comm_id, location_code, equip_status, equip_item, repair_fee)
VALUES
(11, 3, "C-equip-1-3", 1, "light", 10);
INSERT INTO equipment
(equip_id, comm_id, location_code, equip_status, equip_item, repair_fee)
VALUES
(12, 3, "C-equip-1-4", 1, "light", 10);

/* insert data to building */
INSERT INTO building
(building_id, comm_id, building_name, location_code)
VALUES
(1, 1, "A1", "A-building-1-1");
INSERT INTO building
(building_id, comm_id, building_name, location_code)
VALUES
(2, 1, "A2", "A-building-1-2");
INSERT INTO building
(building_id, comm_id, building_name, location_code)
VALUES
(3, 1, "A3", "A-building-1-3");
INSERT INTO building
(building_id, comm_id, building_name, location_code)
VALUES
(4, 1, "A4", "A-building-1-4");

INSERT INTO building
(building_id, comm_id, building_name, location_code)
VALUES
(5, 2, "B1", "B-building-1-1");
INSERT INTO building
(building_id, comm_id, building_name, location_code)
VALUES
(6, 2, "B2", "B-building-1-2");
INSERT INTO building
(building_id, comm_id, building_name, location_code)
VALUES
(7, 2, "B3", "B-building-1-3");
INSERT INTO building
(building_id, comm_id, building_name, location_code)
VALUES
(8, 2, "B4", "B-building-1-4");

INSERT INTO building
(building_id, comm_id, building_name, location_code)
VALUES
(9, 3, "C1", "C-building-1-1");
INSERT INTO building
(building_id, comm_id, building_name, location_code)
VALUES
(10, 3, "C2", "C-building-1-2");
INSERT INTO building
(building_id, comm_id, building_name, location_code)
VALUES
(11, 3, "C3", "C-building-1-3");
INSERT INTO building
(building_id, comm_id, building_name, location_code)
VALUES
(12, 3, "C4", "C-building-1-4");

/* insert data to house */
INSERT INTO house
(house_id, building_id, unit, room_code, room_number, area)
VALUES
(1, 1, '1', '101', 2, 50);
INSERT INTO house
(house_id, building_id, unit, room_code, room_number, area)
VALUES
(2, 2, '1', '101', 2, 50);
INSERT INTO house
(house_id, building_id, unit, room_code, room_number, area)
VALUES
(3, 3, '1', '101', 2, 50);
INSERT INTO house
(house_id, building_id, unit, room_code, room_number, area)
VALUES
(4, 4, '1', '101', 2, 50);
INSERT INTO house
(house_id, building_id, unit, room_code, room_number, area)
VALUES
(5, 5, '1', '101', 2, 50);
INSERT INTO house
(house_id, building_id, unit, room_code, room_number, area)
VALUES
(6, 6, '1', '101', 2, 50);
INSERT INTO house
(house_id, building_id, unit, room_code, room_number, area)
VALUES
(7, 7, '1', '101', 2, 50);
INSERT INTO house
(house_id, building_id, unit, room_code, room_number, area)
VALUES
(8, 8, '1', '101', 2, 50);
INSERT INTO house
(house_id, building_id, unit, room_code, room_number, area)
VALUES
(9, 9, '1', '101', 2, 50);
INSERT INTO house
(house_id, building_id, unit, room_code, room_number, area)
VALUES
(10, 10, '1', '101', 2, 50);
INSERT INTO house
(house_id, building_id, unit, room_code, room_number, area)
VALUES
(11, 11, '1', '101', 2, 50);
INSERT INTO house
(house_id, building_id, unit, room_code, room_number, area)
VALUES
(12, 12, '1', '101', 2, 50);

/* insert data to house_bill */
INSERT INTO house_bill
(bill_id, house_id, bill_date, bill_amount, bill_status)
VALUES
(1, 1, '2019-01-01', 50, 0);
INSERT INTO house_bill
(bill_id, house_id, bill_date, bill_amount, bill_status)
VALUES
(2, 2, '2019-01-01', 50, 0);
INSERT INTO house_bill
(bill_id, house_id, bill_date, bill_amount, bill_status)
VALUES
(3, 3, '2019-01-01', 50, 0);
INSERT INTO house_bill
(bill_id, house_id, bill_date, bill_amount, bill_status)
VALUES
(4, 4, '2019-01-01', 50, 0);

INSERT INTO house_bill
(bill_id, house_id, bill_date, bill_amount, bill_status)
VALUES
(5, 5, '2019-01-01', 75, 0);
INSERT INTO house_bill
(bill_id, house_id, bill_date, bill_amount, bill_status)
VALUES
(6, 6, '2019-01-01', 75, 0);
INSERT INTO house_bill
(bill_id, house_id, bill_date, bill_amount, bill_status)
VALUES
(7, 7, '2019-01-01', 75, 0);
INSERT INTO house_bill
(bill_id, house_id, bill_date, bill_amount, bill_status)
VALUES
(8, 8, '2019-01-01', 75, 0);

INSERT INTO house_bill
(bill_id, house_id, bill_date, bill_amount, bill_status)
VALUES
(9, 9, '2019-01-01', 100, 0);
INSERT INTO house_bill
(bill_id, house_id, bill_date, bill_amount, bill_status)
VALUES
(10, 10, '2019-01-01', 100, 0);
INSERT INTO house_bill
(bill_id, house_id, bill_date, bill_amount, bill_status)
VALUES
(11, 11, '2019-01-01', 100, 0);
INSERT INTO house_bill
(bill_id, house_id, bill_date, bill_amount, bill_status)
VALUES
(12, 12, '2019-01-01', 100, 0);

/* insert data to resident */
INSERT INTO resident
(resident_id, house_id, comm_id, resident_name, gender, live_start_date)
VALUES
(1, 1, 1, "Mike", 0, '2018-12-01');
INSERT INTO resident
(resident_id, house_id, comm_id, resident_name, gender, live_start_date)
VALUES
(2, 2, 1, "Mike", 0, '2018-12-01');
INSERT INTO resident
(resident_id, house_id, comm_id, resident_name, gender, live_start_date)
VALUES
(3, 3, 1, "Mike", 0, '2018-12-01');
INSERT INTO resident
(resident_id, house_id, comm_id, resident_name, gender, live_start_date)
VALUES
(4, 4, 1, "Mike", 0, '2018-12-01');
INSERT INTO resident
(resident_id, house_id, comm_id, resident_name, gender, live_start_date)
VALUES
(5, 5, 2, "Mike", 0, '2018-12-01');
INSERT INTO resident
(resident_id, house_id, comm_id, resident_name, gender, live_start_date)
VALUES
(6, 6, 2, "Mike", 0, '2018-12-01');
INSERT INTO resident
(resident_id, house_id, comm_id, resident_name, gender, live_start_date)
VALUES
(7, 7, 2, "Mike", 0, '2018-12-01');
INSERT INTO resident
(resident_id, house_id, comm_id, resident_name, gender, live_start_date)
VALUES
(8, 8, 2, "Mike", 0, '2018-12-01');
INSERT INTO resident
(resident_id, house_id, comm_id, resident_name, gender, live_start_date)
VALUES
(9, 9, 3, "Mike", 0, '2018-12-01');
INSERT INTO resident
(resident_id, house_id, comm_id, resident_name, gender, live_start_date)
VALUES
(10, 10, 3, "Mike", 0, '2018-12-01');
INSERT INTO resident
(resident_id, house_id, comm_id, resident_name, gender, live_start_date)
VALUES
(11, 11, 3, "Mike", 0, '2018-12-01');
INSERT INTO resident
(resident_id, house_id, comm_id, resident_name, gender, live_start_date)
VALUES
(12, 12, 3, "Mike", 0, '2018-12-01');

/* insert data to sold_carport */
INSERT INTO sold_carport
(carport_id, owner_id, sold_date)
VALUES
(1, 1 '2019-01-01');
INSERT INTO sold_carport
(carport_id, owner_id, sold_date)
VALUES
(2, 2, '2019-01-01');
INSERT INTO sold_carport
(carport_id, owner_id, sold_date)
VALUES
(3, 3, '2019-01-01');
INSERT INTO sold_carport
(carport_id, owner_id, sold_date)
VALUES
(4, 4, '2019-01-01');
INSERT INTO sold_carport
(carport_id, owner_id, sold_date)
VALUES
(13, 5, '2019-01-01');
INSERT INTO sold_carport
(carport_id, owner_id, sold_date)
VALUES
(14, 6, '2019-01-01');
INSERT INTO sold_carport
(carport_id, owner_id, sold_date)
VALUES
(15, 7, '2019-01-01');
INSERT INTO sold_carport
(carport_id, owner_id, sold_date)
VALUES
(16, 8, '2019-01-01');INSERT INTO sold_carport
(carport_id, owner_id, sold_date)
VALUES
(25, 9, '2019-01-01');
INSERT INTO sold_carport
(carport_id, owner_id, sold_date)
VALUES
(26, 10, '2019-01-01');
INSERT INTO sold_carport
(carport_id, owner_id, sold_date)
VALUES
(27, 11, '2019-01-01');
INSERT INTO sold_carport
(carport_id, owner_id, sold_date)
VALUES
(28, 12, '2019-01-01');

/* insert data to rental_carport */
INSERT INTO rental_carport
(carport_id, owner_id, rent_start_date, rent_end_date)
VALUES
(5, 1, '2019-01-01', '2019-01-31');
INSERT INTO rental_carport
(carport_id, owner_id, rent_start_date, rent_end_date)
VALUES
(6, 2, '2019-01-01', '2019-01-31');
INSERT INTO rental_carport
(carport_id, owner_id, rent_start_date, rent_end_date)
VALUES
(7, 3, '2019-01-01', '2019-01-31');
INSERT INTO rental_carport
(carport_id, owner_id, rent_start_date, rent_end_date)
VALUES
(8, 4, '2019-01-01', '2019-01-31');
INSERT INTO rental_carport
(carport_id, owner_id, rent_start_date, rent_end_date)
VALUES
(17, 5, '2019-01-01', '2019-01-31');
INSERT INTO rental_carport
(carport_id, owner_id, rent_start_date, rent_end_date)
VALUES
(18, 6, '2019-01-01', '2019-01-31');
INSERT INTO rental_carport
(carport_id, owner_id, rent_start_date, rent_end_date)
VALUES
(19, 7, '2019-01-01', '2019-01-31');
INSERT INTO rental_carport
(carport_id, owner_id, rent_start_date, rent_end_date)
VALUES
(20, 8, '2019-01-01', '2019-01-31');
INSERT INTO rental_carport
(carport_id, owner_id, rent_start_date, rent_end_date)
VALUES
(29, 9, '2019-01-01', '2019-01-31');
INSERT INTO rental_carport
(carport_id, owner_id, rent_start_date, rent_end_date)
VALUES
(30, 10, '2019-01-01', '2019-01-31');
INSERT INTO rental_carport
(carport_id, owner_id, rent_start_date, rent_end_date)
VALUES
(31, 11, '2019-01-01', '2019-01-31');
INSERT INTO rental_carport
(carport_id, owner_id, rent_start_date, rent_end_date)
VALUES
(32, 12, '2019-01-01', '2019-01-31');