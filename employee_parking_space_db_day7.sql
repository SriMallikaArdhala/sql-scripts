-- employee parking space USECASE
-- --------------------------------- 

use cds_hyd_jfs_60;

-- parent table
CREATE TABLE parking_spaces (
    parking_space_id INT PRIMARY KEY,
    slot_number INT NOT NULL,
    basement_level INT NOT NULL
);

-- child table
CREATE TABLE employeedetails (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    parking_space_id INT,
    FOREIGN KEY (parking_space_id) REFERENCES parking_spaces (parking_space_id)
);

insert into parking_spaces (parking_space_id,slot_number,basement_level) values
(201,1001,1),(202,1002,1),(203,1003,1),(204,1004,1),(205,1005,1),
(206,2001,2),(207,2002,2),(208,2003,2),(209,2004,2),(210,1005,2),
(211,1001,3),(212,1002,3),(213,1003,3),(214,1004,3),(215,1005,3);

insert into employeedetails(employee_id,first_name, last_name,parking_space_id) 
values
(101,'Akshat','Kumar',201),(103,'Akshat', 'Bakshi',202),(105,'Neha', 'Sharma',206),
(107,'Raksha', 'Kumari',207),(109,'Varsha', 'Gupta',211),(106,'Gaurav', 'Kapoor',212);

insert into employeedetails(employee_id,first_name, last_name,parking_space_id) 
values
(102,'Ravi','Jangra',null),(104,'Deepika', 'Bakshi',null),(108,'Neha', 'Kakkar',null),
(110,'Sheetal', 'Jain',null);

insert into employeedetails(employee_id,first_name, last_name,parking_space_id) 
values
(111,'Chetan','Shrama',202);

select * from employeedetails;
select * from parking_spaces;
