-- PERSONS PASSPORT STORE DETAILS DATABASE USECASE
-- --------------------------------- 

use cds_hyd_jfs_60;
-- parent
CREATE TABLE persons (
    person_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
    gender CHAR(1) NOT NULL CHECK (gender IN ('M' , 'F')),
    date_of_birth DATE NOT NULL
);
-- child
CREATE TABLE passports (
    passport_id INT PRIMARY KEY,
    passport_number CHAR(6) UNIQUE NOT NULL,
    date_of_issue DATE NOT NULL,
    date_of_expiry DATE NOT NULL,
    person_id int UNIQUE NOT NULL,
    foreign key(person_id) references persons(person_id) 
);

-- WHILE 1STV DROP CHILD AND THEN PARENT TABLE
DROP TABLE PASSPORTS;
DROP TABLE PERSONS;

-- applicant 1
insert into persons(person_id,first_name,middle_name,last_name,gender,date_of_birth) 
values(101,'Akash','Singh','Chauhan','M','1989-06-25');
insert into passports(passport_id,passport_number,date_of_issue,date_of_expiry,person_id) 
values(201,'JH1234','2026-11-25','2036-11-25',101);

-- applicatnt 2
insert into persons(person_id,first_name,middle_name,last_name,gender,date_of_birth)
 values(102,'Neha',null,'Sharma','F','1992-12-05');
insert into passports(passport_id,passport_number,date_of_issue,date_of_expiry,person_id) 
values(202,'PQ5432','2026-11-25','2036-11-25',102);

-- applicant 3 no passport details in kendra
insert into persons(person_id,first_name,middle_name,last_name,gender,date_of_birth)
 values(103,'Gaurav',null,'Gupta','M','1992-01-14');

-- applicant4 no passport details in kendra
insert into persons(person_id,first_name,middle_name,last_name,gender,date_of_birth)
 values(104,'Namrata',null,'Jain','F','1990-10-15');

-- a new passport for an existing applicant
insert into passports(passport_id,passport_number,date_of_issue,date_of_expiry,person_id) 
values(203,'MS9959','2026-11-25','2036-11-25',102);

-- new passport
insert into passports(passport_id,passport_number,date_of_issue,date_of_expiry,person_id) 
values(204,'OT1762','2026-11-25','2036-11-25',NULL);
 
 select * from persons;
 select * from passports;