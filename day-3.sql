use cds_hyd_jfs_60;
DROP DATABASE cds_hyd_jfs_60;
CREATE TABLE products (
    product_id INT,
    name VARCHAR(100),
    price DECIMAL
);

CREATE TABLE products (
    product_id INT,
    name VARCHAR(100),
    price DECIMAL(6,2) -- 6 is total no of numbers and 2 is numbers after a decimal , 4 are before decimal
);

DROP TABLE products;
INSERT INTO products(product_id,name,price) VALUES(101,'Maggi Vegetable Noodles',15);
INSERT INTO products(product_id,name,price) VALUES(102,'Maggi Atta Noodles',25.50);
INSERT INTO products(product_id,name,price) VALUES(103,'Maggi Chicken Noodles', 9999.99);
INSERT INTO products(product_id,name,price) VALUES(104,'Real apple juice',9999.999);
INSERT INTO products(product_id,name,price) VALUES(105,'Real orange juice',99999.99);


SELECT 
    product_id, name, price
FROM
    products; 
    
 CREATE TABLE trains (
	booking_id INT,
    train_number INT,
    name VARCHAR(100),
    date_of_departure DATE, -- 
    time_of_departure TIME,
    date_time_of_booking DATETIME,
    ticket_amount DECIMAL(8,3)
);  
RENAME TABLE trains TO bookings;

INSERT INTO bookings(
    booking_id,
    train_number,
    name,
    date_of_departure,
    time_of_departure,
    date_time_of_booking,
    ticket_amount) VALUES(101,'12604','chenna SF Exp','2026-11-20','17:25','2026-11-19 10:55:23',1834.12);
    
INSERT INTO bookings(booking_id,train_number,name,date_of_departure,time_of_departure,date_time_of_booking,
ticket_amount) VALUES(102,'12079','chenna SF Exp','2026-11-21','05:25','2026-10-19 10:55:23',1834.12);  

INSERT INTO bookings(booking_id,train_number,name,date_of_departure,time_of_departure,date_time_of_booking,
ticket_amount) VALUES(103,'11079','chenna SF Exp','2021-11-24','07:15','2026-10-11 10:55:23',1834.12); 

INSERT INTO bookings(booking_id,train_number,name,date_of_departure,time_of_departure,date_time_of_booking,
ticket_amount) VALUES(104,'16079','chenna SF Exp','2021-11-24','07:15','2026-10-11',1834.12);  

INSERT INTO bookings(booking_id,train_number,name,date_of_departure,time_of_departure,date_time_of_booking,
ticket_amount) VALUES(105,'22056','YRP Vande Barath','2021-11-22','05:45',now(),1834.12);
    
 SELECT current_date(),current_time(),now(),curdate(),curtime();-- (these 2 are alias name s for current timeand date) predefined functions 

SELECT 
    booking_id,
    train_number,
    name,
    date_of_departure,
    time_of_departure,
    date_time_of_booking,
    ticket_amount
FROM
    bookings;
    
CREATE TABLE test (
    date_1 DATETIME,
    date_2 TIMESTAMP -- sets time according to the utcs 
);

DROP TABLE test;

INSERT INTO test VALUES(NOW(),NOW());

SET time_zone="+5:00";
SELECT date_1,date_2 FROM test;

SET time_zone="-5:00"; -- predifined varibale -> SET time_zone
SELECT date_1,date_2 FROM test;

SET time_zone="+8:00";
SELECT date_1,date_2 FROM test;