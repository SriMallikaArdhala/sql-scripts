CREATE DATABASE sql_assignment1 ;

USE cds_hyd_jfs_60; 
 
SHOW DATABASES;

SHOW TABLES;

SHOW CREATE TABLE CUSTOMERS;
 
DESCRIBE customers;

CREATE TABLE
 courses(
	course_id INT,
	course_code VARCHAR(15), 
	course_title 	VARCHAR(150),
    category VARCHAR(60),
    duration_hours INT,
    fee INT,
    delivery_mode VARCHAR(20),
    course_status VARCHAR(20),
    created_at VARCHAR(10)
    );
    
INSERT INTO courses(course_id,course_code,course_title,category,duration_hours,fee,delivery_mode,course_status,created_at)
VALUES(1,'CRS-JAVA-101','java Fundamentals','programming',50,6000,'CLASSROOM','ACTIVE','2000-08-30'); 
INSERT INTO courses(course_id,course_code,course_title,category,duration_hours,fee,delivery_mode,course_status,created_at) 
VALUES
(2,'CRS-SQL-102',	'MySQL Essentials',	'Database',	32,	4500 ,'ONLINE',	'ACTIVE','2012-18-01'),
(3,'CRS-TST-103', 'Software Testing Basics', 'Testing' ,	24,	3500, 'HYBRID', 'ACTIVE','2002-09-27');
INSERT INTO courses VALUES(4, 'CRS-OLD-104', 'Legacy Systems Overview',	'Technology',	12,	2000, 'ONLINE',	'ARCHIVED','2019-07-21');  
INSERT INTO courses VALUES(5, 'CRS-OLD-105', 'SprinBoot', 'Technology',	10,	2000, 'OFFLINE', 'ACTIVE','1995-05-18');   
 
UPDATE courses 
SET 
    fee = 6500
WHERE
    course_code = 'CRS-JAVA-101';
    
UPDATE courses 
SET 
    fee = ROUND(fee+(fee * 0.10))
WHERE
    course_status = 'ACTIVE';
    
UPDATE courses 
SET 
    fee = 2500,
    course_status = 'ACTIVE'
WHERE
    course_code = 'CRS-WEB-103';
    
UPDATE courses 
SET 
	duration_hours = duration_hours+4
WHERE
    category = 'Testing';   

UPDATE courses 
SET 
	duration_hours = 0;
    
-- SELECT course_code,duration_hours FROM courses;

SELECT * FROM courses;

-- SELECT course_code FROM courses;
DELETE 
FROM 
	courses 
WHERE
    course_code = 'CRS-OLD-105';
   
INSERT INTO courses(course_code) VALUES('CRS-TEMP-999');

DELETE FROM courses WHERE course_code = 'CRS-TEMP-999';

DELETE FROM courses WHERE category = 'Testing' AND FEE < 5000;
    

-- 2nd table

CREATE TABLE instructors(instructor_id	INT,
instructor_code	VARCHAR(12),
first_name	VARCHAR(60)	, 
last_name	VARCHAR(60)	 ,
email	VARCHAR(120)	 ,
specialization	VARCHAR(100),	 
years_experience	INT	 ,
hourly_rate	INT,
employment_type	VARCHAR(20)	, 
is_active	INT	,
joined_on	VARCHAR(10)	,
created_at	VARCHAR(10));

DESCRIBE instructors;

INSERT INTO instructors VALUES(1,'INS-JV-001',	'Kavya',	'Menon',	'kavya.menon@example.test',	'Java',	8	
,1500,	'FULL_TIME'	,1	,2021-06-14,2021-06-14);

INSERT 
INTO instructors
VALUES
(2,'INS-DB-002',	'Ritesh',	'Kumar',	'ritesh.kumar@example.test',	'Databases',12	,1800,	'CONTRACT'	,1	,2019-02-01,2021-06-14),
(3,'INS-WB-003',	'Farah',	'Ali',	'farah.ali@example.test',	'Web Development',5	,1200,	'PART_TIME'	,1	,2023-08-21,2021-06-14);

INSERT 
INTO 
instructors
(instructor_id,instructor_code,first_name, last_name	,email	,specialization,years_experience,hourly_rate,
employment_type, is_active,joined_on,created_at	) 
VALUES
(4,'INS-QA-004',	'Nitin',	'Bose',	'nitin.bose@example.tes',	'Software Testing', 7	,1350,	'PART_TIME'	,1	,2022-01-10,2021-06-14);

INSERT 
INTO 
instructors
(instructor_id,instructor_code,first_name, last_name	,email	,specialization,years_experience,hourly_rate,
employment_type, is_active,joined_on,created_at	) 
VALUES
(5,'INS-OLD-005', 'Leela', 'Shah','leela.shah@example.test',	'Mainframe Systems',25,	2000,	'CONTRACT',	0,	2010-05-17,2021-06-14);


SELECT * FROM instructors;

UPDATE instructors set hourly_rate=1500 where instructor_code='INS-QA-004';

UPDATE instructors
SET hourly_rate = ROUND(hourly_rate * 1.08)
WHERE employment_type = 'CONTRACT'
AND is_active = 1;
UPDATE instructors 
SET 
    specialization = 'Full-Stack Web Development'
WHERE
    instructor_code = 'INS-WB-003';
    
UPDATE instructors
SET years_experience = years_experience + 1
WHERE is_active = 1;

SELECT *
FROM instructors
WHERE years_experience > 50;

UPDATE instructors
SET is_active = 0
WHERE instructor_code = 'INS-OLD-005'
AND is_active <> 0;

SELECT *
FROM instructors
WHERE instructor_code = 'INS-OLD-005'
AND is_active = 0;

DELETE FROM instructors
WHERE instructor_code = 'INS-OLD-005'
AND is_active = 0;

INSERT INTO instructors VALUES
(6, 'INS-TEMP-99', 'Arjun', 'Rao',
 'arjun.rao@example.test', 'Python',
 4, 1000, 'PART_TIME', 1,
 '2025-06-01', '2025-06-01');
 
 DELETE FROM instructors
WHERE instructor_code = 'INS-TEMP-99';

SELECT *
FROM instructors
WHERE is_active = 1
AND employment_type = 'PART_TIME'
AND years_experience < 6;

DELETE FROM instructors
WHERE is_active = 1
AND employment_type = 'PART_TIME'
AND years_experience < 6;



-- 3. WAREHOUSE CAPACITY REGISTER

CREATE TABLE warehouses (
    warehouse_id INT,
    warehouse_code VARCHAR(10),
    warehouse_name VARCHAR(100),
    city VARCHAR(80),
    state VARCHAR(80),
    capacity_units INT,
    occupied_units INT,
    manager_name VARCHAR(100),
    temperature_controlled INT,
    operational_status VARCHAR(20),
    created_at VARCHAR(10)
);

DESCRIBE warehouses;
SHOW CREATE TABLE warehouses;

-- INSERT

INSERT INTO warehouses VALUES
(1,'WH-BLR-01','Bengaluru Central','Bengaluru','Karnataka',10000,6400,'Ajay Nair',0,'ACTIVE','2026-09-20');

INSERT INTO warehouses VALUES
(2,'WH-HYD-02','Hyderabad North','Hyderabad','Telangana',8000,7900,'Sana Reddy',1,'ACTIVE','2026-09-20'),
(3,'WH-MUM-03','Mumbai Port Store','Mumbai','Maharashtra',15000,9000,'Rohit Shah',0,'MAINTENANCE','2026-09-20');

INSERT INTO warehouses VALUES
(4,'WH-KOC-04','Kochi Cold Hub','Kochi','Kerala',6000,3200,'Meera Varma',1,'ACTIVE','2026-09-20'),
(5,'WH-OLD-05','Training Closed Store','Pune','Maharashtra',2000,0,'Test Manager',0,'CLOSED','2026-09-20');

INSERT INTO warehouses VALUES
(6,'WH-CHN-06','Chennai Storage','Chennai','Tamil Nadu',9000,4500,'Arun Kumar',0,'ACTIVE','2026-09-20');

-- UPDATE

UPDATE warehouses
SET occupied_units = occupied_units + 500
WHERE warehouse_code = 'WH-BLR-01';

UPDATE warehouses
SET occupied_units = occupied_units - 1000
WHERE warehouse_code = 'WH-HYD-02';

UPDATE warehouses
SET operational_status = 'ACTIVE'
WHERE warehouse_code = 'WH-MUM-03';

UPDATE warehouses
SET capacity_units = capacity_units + 1000
WHERE temperature_controlled = 1;

UPDATE warehouses
SET occupied_units = 11000
WHERE warehouse_code = 'WH-BLR-01';

SELECT * FROM warehouses WHERE warehouse_code = 'WH-BLR-01';

-- DELETE

SELECT * FROM warehouses WHERE warehouse_code = 'WH-OLD-05';

DELETE FROM warehouses WHERE warehouse_code = 'WH-OLD-05';

INSERT INTO warehouses VALUES
(7,'WH-TMP-99','Temporary Warehouse','Vijayawada','Andhra Pradesh',1000,0,'Test Manager',0,'ACTIVE','2026-09-20');

DELETE FROM warehouses WHERE warehouse_code = 'WH-TMP-99';

SELECT * FROM warehouses
WHERE operational_status = 'ACTIVE'
AND occupied_units < capacity_units / 2;

DELETE FROM warehouses
WHERE operational_status = 'ACTIVE'
AND occupied_units < capacity_units / 2;


-- 4. SHIPMENT TRACKING REGISTER


CREATE TABLE shipments (
    shipment_id INT,
    tracking_number VARCHAR(20),
    sender_name VARCHAR(120),
    recipient_name VARCHAR(120),
    destination_city VARCHAR(80),
    package_weight_grams INT,
    shipping_cost INT,
    shipped_date VARCHAR(10),
    expected_delivery_date VARCHAR(10),
    delivered_date VARCHAR(10),
    shipment_status VARCHAR(20),
    priority VARCHAR(10),
    created_at VARCHAR(10)
);

DESCRIBE shipments;
SHOW CREATE TABLE shipments;

-- INSERT

INSERT INTO shipments VALUES
(1,'TRK26000001','Asha Stores','Nitin Rao','Chennai',2500,180,'2026-09-20','2026-09-24',NULL,'IN_TRANSIT','NORMAL','2026-09-20');

INSERT INTO shipments VALUES
(2,'TRK26000002','Nova Tech','Isha Sen','Bengaluru',800,250,'2026-09-21','2026-09-23','2026-09-23','DELIVERED','EXPRESS','2026-09-21');

INSERT INTO shipments
(shipment_id,tracking_number,sender_name,recipient_name,destination_city,package_weight_grams,shipping_cost,shipped_date,expected_delivery_date,delivered_date,shipment_status,priority,created_at)
VALUES
(3,'TRK26000003','Book Nest','Omar Ali','Kochi',4200,220,'2026-09-22','2026-09-27',NULL,'CREATED','NORMAL','2026-09-22');

INSERT INTO shipments VALUES
(4,'TRK26000004','Green Foods','Meera Das','Hyderabad',12000,550,'2026-09-22','2026-09-25',NULL,'IN_TRANSIT','EXPRESS','2026-09-22'),
(5,'TRK26000005','Test Sender','Test Receiver','Pune',1000,100,'2026-09-23','2026-09-26',NULL,'CANCELLED','NORMAL','2026-09-23');

-- UPDATE

UPDATE shipments
SET shipment_status = 'DELIVERED',
    delivered_date = '2026-09-24'
WHERE tracking_number = 'TRK26000001';

UPDATE shipments
SET shipment_status = 'IN_TRANSIT'
WHERE tracking_number = 'TRK26000003';

UPDATE shipments
SET shipping_cost = shipping_cost + 50
WHERE priority = 'EXPRESS';

UPDATE shipments
SET expected_delivery_date = '2026-09-27'
WHERE tracking_number = 'TRK26000004';

UPDATE shipments
SET delivered_date = '2026-09-19'
WHERE tracking_number = 'TRK26000001';

SELECT * FROM shipments WHERE tracking_number = 'TRK26000001';

-- DELETE

SELECT * FROM shipments WHERE tracking_number = 'TRK26000005';

DELETE FROM shipments WHERE tracking_number = 'TRK26000005';

INSERT INTO shipments VALUES
(6,'TRK-TEMP-999','Temporary Sender','Temporary Receiver','Vijayawada',500,100,'2026-09-24','2026-09-26',NULL,'CREATED','NORMAL','2026-09-24');

DELETE FROM shipments WHERE tracking_number = 'TRK-TEMP-999';

SELECT * FROM shipments
WHERE shipment_status = 'DELIVERED'
AND priority = 'EXPRESS'
AND package_weight_grams < 1000;

DELETE FROM shipments
WHERE shipment_status = 'DELIVERED'
AND priority = 'EXPRESS'
AND package_weight_grams < 1000;



-- 5. SERVICE SUBSCRIPTION REGISTER


CREATE TABLE subscriptions (
    subscription_id INT,
    subscription_code VARCHAR(16),
    subscriber_name VARCHAR(120),
    subscriber_email VARCHAR(120),
    plan_name VARCHAR(60),
    billing_cycle VARCHAR(20),
    amount INT,
    start_date VARCHAR(10),
    end_date VARCHAR(10),
    auto_renew INT,
    subscription_status VARCHAR(20),
    created_at VARCHAR(10)
);

DESCRIBE subscriptions;
SHOW CREATE TABLE subscriptions;

-- INSERT

INSERT INTO subscriptions VALUES
(1,'SUB260001','Aarav Nair','aarav.nair@example.test','Standard','MONTHLY',499,'2026-09-01',NULL,1,'ACTIVE','2026-09-01'),
(2,'SUB260002','Diya Shah','diya.shah@example.test','Premium','YEARLY',4999,'2026-01-15','2027-01-14',1,'ACTIVE','2026-01-15');

INSERT INTO subscriptions
(subscription_id,subscription_code,subscriber_name,subscriber_email,plan_name,billing_cycle,amount,start_date,end_date,auto_renew,subscription_status,created_at)
VALUES
(3,'SUB260003','Kabir Rao','kabir.rao@example.test','Basic','MONTHLY',199,'2026-09-10',NULL,1,'ACTIVE','2026-09-10');

INSERT INTO subscriptions VALUES
(4,'SUB260004','Meera Bose','meera.bose@example.test','Premium','QUARTERLY',1399,'2026-07-01','2026-09-30',0,'PAUSED','2026-07-01'),
(5,'SUB260005','Test Subscriber','test.subscriber@example.test','Standard','MONTHLY',499,'2026-08-01','2026-08-31',0,'CANCELLED','2026-08-01');

INSERT INTO subscriptions VALUES
(6,'SUB260006','Ananya Rao','ananya.rao@example.test','Basic','YEARLY',1999,'2026-09-15','2027-09-14',1,'ACTIVE','2026-09-15');

-- UPDATE

UPDATE subscriptions
SET plan_name = 'Premium', amount = 799
WHERE subscription_code = 'SUB260001';

UPDATE subscriptions
SET subscription_status = 'ACTIVE', auto_renew = 1
WHERE subscription_code = 'SUB260004';

UPDATE subscriptions
SET amount = ROUND(amount * 1.05)
WHERE billing_cycle = 'MONTHLY'
AND subscription_status = 'ACTIVE';

UPDATE subscriptions
SET subscription_status = 'CANCELLED',
    auto_renew = 0,
    end_date = '2026-11-19'
WHERE subscription_code = 'SUB260003';

UPDATE subscriptions
SET end_date = '2026-01-01'
WHERE subscription_code = 'SUB260001';

SELECT * FROM subscriptions WHERE subscription_code = 'SUB260001';

-- DELETE

SELECT * FROM subscriptions WHERE subscription_code = 'SUB260005';

DELETE FROM subscriptions WHERE subscription_code = 'SUB260005';

INSERT INTO subscriptions VALUES
(7,'SUB-TEMP-999','Temporary User','temporary@example.test','Basic','MONTHLY',199,'2026-09-20',NULL,0,'ACTIVE','2026-09-20');

DELETE FROM subscriptions WHERE subscription_code = 'SUB-TEMP-999';

SELECT * FROM subscriptions
WHERE subscription_status = 'CANCELLED'
AND auto_renew = 0;

DELETE FROM subscriptions
WHERE subscription_status = 'CANCELLED'
AND auto_renew = 0;


-- 6. EVENT SCHEDULE


CREATE TABLE events (
    event_id INT,
    event_code VARCHAR(15),
    event_name VARCHAR(150),
    venue VARCHAR(150),
    city VARCHAR(80),
    start_date VARCHAR(10),
    end_date VARCHAR(10),
    capacity INT,
    registration_fee INT,
    event_type VARCHAR(20),
    event_status VARCHAR(20),
    created_at VARCHAR(10)
);

DESCRIBE events;
SHOW CREATE TABLE events;

-- INSERT

INSERT INTO events VALUES
(1,'EVT-JAVA-01','Java Developer Meetup','Tech Hall','Bengaluru','2026-10-10','2026-10-10',250,500,'OFFLINE','OPEN','2026-09-20');

INSERT INTO events VALUES
(2,'EVT-CLOUD-02','Cloud Fundamentals Webinar','Online Platform','Online','2026-10-12','2026-10-12',1000,0,'ONLINE','OPEN','2026-09-21'),
(3,'EVT-DATA-03','Data Engineering Summit','Convention Centre','Hyderabad','2026-11-05','2026-11-06',600,2500,'HYBRID','PLANNED','2026-09-22');

INSERT INTO events
(event_id,event_code,event_name,venue,city,start_date,end_date,capacity,registration_fee,event_type,event_status,created_at)
VALUES
(4,'EVT-UI-04','UI Design Workshop','Creative Hub','Chennai','2026-10-20','2026-10-20',80,1200,'OFFLINE','PLANNED','2026-09-23');

INSERT INTO events VALUES
(5,'EVT-OLD-05','Cancelled Training Event','Test Venue','Pune','2026-10-01','2026-10-01',30,100,'OFFLINE','CANCELLED','2026-09-01');

-- UPDATE

UPDATE events
SET capacity = 750
WHERE event_code = 'EVT-DATA-03';

UPDATE events
SET event_status = 'OPEN'
WHERE event_code = 'EVT-UI-04';

UPDATE events
SET registration_fee = ROUND(registration_fee * 1.10)
WHERE event_type = 'OFFLINE'
AND registration_fee > 0;

UPDATE events
SET start_date = '2026-10-13',
    end_date = '2026-10-13'
WHERE event_code = 'EVT-CLOUD-02';

UPDATE events
SET end_date = start_date
WHERE event_code = 'EVT-DATA-03';

SELECT * FROM events WHERE event_code = 'EVT-DATA-03';

-- DELETE

SELECT * FROM events WHERE event_code = 'EVT-OLD-05';

DELETE FROM events WHERE event_code = 'EVT-OLD-05';

INSERT INTO events VALUES
(6,'EVT-TEMP-99','Temporary Event','Test Hall','Vijayawada','2026-11-20','2026-11-20',100,0,'ONLINE','OPEN','2026-11-19');

DELETE FROM events WHERE event_code = 'EVT-TEMP-99';

SELECT * FROM events
WHERE registration_fee = 0
AND event_type = 'ONLINE'
AND event_status = 'OPEN';

DELETE FROM events
WHERE registration_fee = 0
AND event_type = 'ONLINE'
AND event_status = 'OPEN';

-- 7. ORGANISATION DEVICE REGISTER


CREATE TABLE devices (
    device_id INT,
    asset_tag VARCHAR(20),
    serial_number VARCHAR(50),
    device_name VARCHAR(120),
    device_type VARCHAR(20),
    manufacturer VARCHAR(80),
    model VARCHAR(100),
    purchase_date VARCHAR(10),
    purchase_price INT,
    warranty_expiry VARCHAR(10),
    assigned_to VARCHAR(120),
    device_status VARCHAR(20),
    created_at VARCHAR(10)
);

DESCRIBE devices;
SHOW CREATE TABLE devices;

-- INSERT

INSERT INTO devices VALUES
(1,'AST-LAP-001','SN-LAP-260001','Developer Laptop','LAPTOP','Lenovo','ThinkPad E14','2026-01-15',78000,'2029-01-14','Kavya Menon','ASSIGNED','2026-01-15');

INSERT INTO devices VALUES
(2,'AST-DES-002','SN-DES-260002','Lab Desktop','DESKTOP','Dell','OptiPlex 7010','2025-08-10',62000,'2028-08-09',NULL,'AVAILABLE','2025-08-10'),
(3,'AST-TAB-003','SN-TAB-260003','Demo Tablet','TABLET','Samsung','Galaxy Tab S9','2026-03-05',68000,'2028-03-04',NULL,'AVAILABLE','2026-03-05');

INSERT INTO devices VALUES
(4,'AST-RTR-004','SN-RTR-260004','Office Router','ROUTER','Cisco','RV340','2024-06-20',28000,NULL,'Network Team','REPAIR','2024-06-20'),
(5,'AST-OLD-005','SN-OLD-260005','Retired Phone','PHONE','Nokia','Test Model','2020-01-10',8000,'2021-01-09',NULL,'RETIRED','2020-01-10');

INSERT INTO devices VALUES
(6,'AST-MON-006','SN-MON-260006','Office Monitor','MONITOR','HP','P24v G5','2026-02-10',15000,'2028-02-09',NULL,'AVAILABLE','2026-02-10');

-- UPDATE

UPDATE devices
SET assigned_to = 'Rohan Das', device_status = 'ASSIGNED'
WHERE asset_tag = 'AST-DES-002';

UPDATE devices
SET device_status = 'AVAILABLE', assigned_to = NULL
WHERE asset_tag = 'AST-RTR-004';

UPDATE devices
SET warranty_expiry = '2030-01-14'
WHERE asset_tag = 'AST-LAP-001';

UPDATE devices
SET purchase_price = ROUND(purchase_price * 1.03)
WHERE device_type = 'TABLET';

UPDATE devices
SET warranty_expiry = '2025-01-01'
WHERE asset_tag = 'AST-LAP-001';

SELECT * FROM devices WHERE asset_tag = 'AST-LAP-001';

-- DELETE

SELECT * FROM devices WHERE asset_tag = 'AST-OLD-005';

DELETE FROM devices WHERE asset_tag = 'AST-OLD-005';

INSERT INTO devices VALUES
(7,'AST-TEMP-999','SN-TEMP-999','Temporary Device','LAPTOP','HP','Test Model','2026-09-20',30000,'2028-09-20',NULL,'AVAILABLE','2026-09-20');

DELETE FROM devices WHERE asset_tag = 'AST-TEMP-999';

SELECT * FROM devices
WHERE device_status = 'AVAILABLE'
AND assigned_to IS NULL
AND warranty_expiry IS NOT NULL;

DELETE FROM devices
WHERE device_status = 'AVAILABLE'
AND assigned_to IS NULL
AND warranty_expiry IS NOT NULL;



-- 8. RESTAURANT DIRECTORY


CREATE TABLE restaurants (
    restaurant_id INT,
    restaurant_code VARCHAR(12),
    restaurant_name VARCHAR(120),
    cuisine_type VARCHAR(80),
    city VARCHAR(80),
    phone VARCHAR(15),
    seating_capacity INT,
    average_cost_for_two INT,
    rating_x10 INT,
    vegetarian_only INT,
    opening_status VARCHAR(25),
    opened_date VARCHAR(10),
    created_at VARCHAR(10)
);

DESCRIBE restaurants;
SHOW CREATE TABLE restaurants;

-- INSERT

INSERT INTO restaurants VALUES
(1,'RES-BLR-001','Spice Courtyard','Indian','Bengaluru','9876601001',80,1200,44,0,'OPEN','2018-06-15','2026-09-20');

INSERT INTO restaurants VALUES
(2,'RES-CHE-002','Green Banana Leaf','South Indian','Chennai','9876601002',60,700,46,1,'OPEN','2020-02-10','2026-09-20'),
(3,'RES-MUM-003','Coastal Plate','Seafood','Mumbai','9876601003',100,1800,42,0,'OPEN','2017-09-21','2026-09-20');

INSERT INTO restaurants
(restaurant_id,restaurant_code,restaurant_name,cuisine_type,city,phone,seating_capacity,average_cost_for_two,rating_x10,vegetarian_only,opening_status,opened_date,created_at)
VALUES
(4,'RES-HYD-004','Urban Bowl','Fusion','Hyderabad','9876601004',45,950,0,0,'OPEN','2026-01-12','2026-09-20');

INSERT INTO restaurants VALUES
(5,'RES-OLD-005','Training Cafe','Cafe','Pune','9876601005',20,400,20,0,'PERMANENTLY_CLOSED','2015-05-01','2026-09-20');

-- UPDATE

UPDATE restaurants
SET rating_x10 = 45
WHERE restaurant_code = 'RES-BLR-001';

UPDATE restaurants
SET average_cost_for_two = ROUND(average_cost_for_two * 1.10)
WHERE city = 'Mumbai';

UPDATE restaurants
SET rating_x10 = 40, vegetarian_only = 1
WHERE restaurant_code = 'RES-HYD-004';

UPDATE restaurants
SET seating_capacity = seating_capacity + 10
WHERE opening_status = 'OPEN'
AND seating_capacity < 60;

UPDATE restaurants
SET rating_x10 = 55
WHERE restaurant_code = 'RES-BLR-001';

SELECT * FROM restaurants WHERE restaurant_code = 'RES-BLR-001';

-- DELETE

SELECT * FROM restaurants WHERE restaurant_code = 'RES-OLD-005';

DELETE FROM restaurants WHERE restaurant_code = 'RES-OLD-005';

INSERT INTO restaurants VALUES
(6,'RES-TEMP-999','Temporary Restaurant','Indian','Vijayawada','9876601099',30,500,40,0,'OPEN','2026-09-20','2026-09-20');

DELETE FROM restaurants WHERE restaurant_code = 'RES-TEMP-999';

SELECT * FROM restaurants
WHERE opening_status = 'OPEN'
AND rating_x10 < 41;

DELETE FROM restaurants
WHERE opening_status = 'OPEN'
AND rating_x10 < 41;


-- 9. INSURANCE POLICY REGISTER


CREATE TABLE insurance_policies (
    policy_id INT,
    policy_number VARCHAR(14),
    policyholder_name VARCHAR(120),
    policy_type VARCHAR(20),
    coverage_amount INT,
    premium_amount INT,
    start_date VARCHAR(10),
    end_date VARCHAR(10),
    payment_frequency VARCHAR(20),
    nominee_name VARCHAR(120),
    policy_status VARCHAR(20),
    created_at VARCHAR(10)
);

DESCRIBE insurance_policies;
SHOW CREATE TABLE insurance_policies;

-- INSERT

INSERT INTO insurance_policies VALUES
(1,'POL00000000001','Aditi Rao','HEALTH',1000000,18000,'2026-01-01','2026-12-31','ANNUAL','Rohan Rao','ACTIVE','2026-01-01'),
(2,'POL00000000002','Dev Kapoor','VEHICLE',800000,22000,'2026-04-15','2027-04-14','QUARTERLY',NULL,'ACTIVE','2026-04-15');

INSERT INTO insurance_policies VALUES
(3,'POL00000000003','Meera Nair','LIFE',5000000,36000,'2026-06-01','2046-05-31','ANNUAL','Arun Nair','ACTIVE','2026-06-01');

INSERT INTO insurance_policies VALUES
(4,'POL00000000004','Kabir Shah','TRAVEL',500000,4500,'2026-10-01','2026-10-31','MONTHLY',NULL,'ACTIVE','2026-10-01'),
(5,'POL00000000005','Test Policyholder','HOME',2000000,15000,'2025-01-01','2025-12-31','ANNUAL',NULL,'CANCELLED','2025-01-01');

INSERT INTO insurance_policies VALUES
(6,'POL00000000006','Ananya Das','HEALTH',1500000,20000,'2026-09-01','2027-08-31','ANNUAL','Riya Das','ACTIVE','2026-09-01');

-- UPDATE

UPDATE insurance_policies
SET coverage_amount = 1250000
WHERE policy_number = 'POL00000000001';

UPDATE insurance_policies
SET nominee_name = 'Sara Kapoor'
WHERE policy_number = 'POL00000000002';

UPDATE insurance_policies
SET premium_amount = ROUND(premium_amount * 1.05)
WHERE policy_type = 'VEHICLE'
AND policy_status = 'ACTIVE';

UPDATE insurance_policies
SET payment_frequency = 'ANNUAL'
WHERE policy_number = 'POL00000000004';

UPDATE insurance_policies
SET premium_amount = 600000
WHERE policy_number = 'POL00000000001';

SELECT * FROM insurance_policies WHERE policy_number = 'POL00000000001';

-- DELETE

SELECT * FROM insurance_policies WHERE policy_number = 'POL00000000005';

DELETE FROM insurance_policies WHERE policy_number = 'POL00000000005';

INSERT INTO insurance_policies VALUES
(7,'POL99999999999','Temporary Policyholder','HEALTH',500000,5000,'2026-09-20','2027-09-19','ANNUAL',NULL,'ACTIVE','2026-09-20');

DELETE FROM insurance_policies WHERE policy_number = 'POL99999999999';

SELECT * FROM insurance_policies
WHERE policy_type = 'TRAVEL'
AND nominee_name IS NULL
AND premium_amount < 5000;

DELETE FROM insurance_policies
WHERE policy_type = 'TRAVEL'
AND nominee_name IS NULL
AND premium_amount < 5000;


-- 10. JOB POSTING BOARD


CREATE TABLE job_postings (
    job_id INT,
    job_code VARCHAR(15),
    job_title VARCHAR(150),
    department VARCHAR(100),
    location VARCHAR(100),
    employment_type VARCHAR(20),
    minimum_salary INT,
    maximum_salary INT,
    vacancies INT,
    posted_date VARCHAR(10),
    closing_date VARCHAR(10),
    job_status VARCHAR(20),
    created_at VARCHAR(10)
);

DESCRIBE job_postings;
SHOW CREATE TABLE job_postings;

-- INSERT

INSERT INTO job_postings VALUES
(1,'JOB-JAVA-001','Java Developer','Engineering','Bengaluru','FULL_TIME',700000,1200000,3,'2026-09-20','2026-10-20','OPEN','2026-09-20'),
(2,'JOB-QA-002','QA Automation Engineer','Quality Assurance','Hyderabad','CONTRACT',600000,900000,2,'2026-09-21','2026-10-15','OPEN','2026-09-21');

INSERT INTO job_postings
(job_id,job_code,job_title,department,location,employment_type,minimum_salary,maximum_salary,vacancies,posted_date,closing_date,job_status,created_at)
VALUES
(3,'JOB-INT-003','Software Intern','Engineering','Chennai','INTERNSHIP',180000,240000,1,'2026-09-22','2026-10-10','OPEN','2026-09-22');

INSERT INTO job_postings VALUES
(4,'JOB-HR-004','HR Coordinator','Human Resources','Mumbai','PART_TIME',300000,450000,1,'2026-09-23','2026-10-18','DRAFT','2026-09-23'),
(5,'JOB-OLD-005','Cancelled Test Role','Training','Pune','FULL_TIME',250000,350000,1,'2026-09-01','2026-09-15','CANCELLED','2026-09-01');

INSERT INTO job_postings VALUES
(6,'JOB-PY-006','Python Developer','Engineering','Hyderabad','FULL_TIME',500000,800000,2,'2026-09-25','2026-10-25','OPEN','2026-09-25');

-- UPDATE

UPDATE job_postings
SET maximum_salary = 1300000
WHERE job_code = 'JOB-JAVA-001';

UPDATE job_postings
SET vacancies = 4
WHERE job_code = 'JOB-QA-002';

UPDATE job_postings
SET job_status = 'OPEN'
WHERE job_code = 'JOB-HR-004';

UPDATE job_postings
SET minimum_salary = ROUND(minimum_salary * 1.08),
    maximum_salary = ROUND(maximum_salary * 1.08)
WHERE job_status = 'OPEN'
AND department = 'Engineering';

UPDATE job_postings
SET maximum_salary = 400000
WHERE job_code = 'JOB-JAVA-001';

SELECT * FROM job_postings WHERE job_code = 'JOB-JAVA-001';

-- DELETE

SELECT * FROM job_postings WHERE job_code = 'JOB-OLD-005';

DELETE FROM job_postings WHERE job_code = 'JOB-OLD-005';

INSERT INTO job_postings VALUES
(7,'JOB-TEMP-999','Temporary Developer','Engineering','Vijayawada','FULL_TIME',300000,500000,1,'2026-09-25','2026-10-25','OPEN','2026-09-25');

DELETE FROM job_postings WHERE job_code = 'JOB-TEMP-999';

SELECT * FROM job_postings
WHERE employment_type = 'INTERNSHIP'
AND maximum_salary <= 250000;

DELETE FROM job_postings
WHERE employment_type = 'INTERNSHIP'
AND maximum_salary <= 250000;



SELECT * FROM warehouses;
SELECT * FROM shipments;
SELECT * FROM subscriptions;
SELECT * FROM events;
SELECT * FROM devices;
SELECT * FROM restaurants;
SELECT * FROM insurance_policies;
SELECT * FROM job_postings;





 
    
    
