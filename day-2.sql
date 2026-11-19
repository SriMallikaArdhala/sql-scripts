USE cds_hyd_jfs_60; -- cmd for only mysql db
 
 SHOW DATABASES; -- for only mysql db
 
 SHOW TABLES; -- for only mysql db
 SHOW CREATE TABLE CUSTOMERS; -- for only mysql db
 
 DESCRIBE customers; -- cmd for only mysql db
 
SELECT 
    customer_id, 
    first_name, 
    last_name
FROM
    customers;
    
 -- 1st form   
INSERT INTO customers(customer_id, first_name, last_name) VALUES(101, 'Neha', 'Gupta');

INSERT INTO customers(first_name, customer_id,  last_name) VALUES('Bharat', '102', 'Sharma');

INSERT INTO customers(first_name, last_name) VALUES('Varsha', 'Gupta');

-- 2nd form
INSERT INTO customers values(104,'Akshat','Kumar');

-- 3rd form
INSERT INTO 
	customers(customer_id,first_name,last_name)
VALUES
(105,'Ankit','Varma'),
(106,'Chetan','Sarma'),
(107,'Ravi','Kumar');

 
 
 