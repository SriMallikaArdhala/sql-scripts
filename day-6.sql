use cds_hyd_jfs_60;

drop table credentials;
drop table employees;
drop table departments;
-- parent
CREATE TABLE credentials (
    credentials_id INT primary key,
    username VARCHAR(20) unique,
    password VARCHAR(25)
);

-- child
CREATE TABLE employees (
    employee_id INT UNIQUE NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dept_id INT,
    cred_id int,
    FOREIGN KEY(dept_id) REFERENCES departments (department_id) ,
	FOREIGN KEY(cred_id) REFERENCES credentials(credentials_id) on delete cascade on update cascade
)
;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

select * from departments;
select * from employees ;
select * from credentials;

insert into credentials(credentials_id,username,password) values(301,'nehgup','12345');
insert into employees(employee_id,first_name,last_name,dept_id,cred_id) values(101,'Neha','Gupta',201,301);

insert into credentials(credentials_id,username,password) values(302,'bhasha','12345');
insert into employees(employee_id,first_name,last_name,dept_id,cred_id) values(102,'BHavna','Sharma',202,302);

insert into credentials(credentials_id,username,password) values(303,'gausha','12345');
insert into employees(employee_id,first_name,last_name,dept_id,cred_id) values(103,'gaurav','Sharma',203,303);

insert into credentials(credentials_id,username,password) values(304,'ravjan','12345');
insert into employees(employee_id,first_name,last_name,dept_id,cred_id) values(104,'Ravi','Jangara',204,304);

insert into credentials(credentials_id,username,password) values(305,'ashbak','12345');
insert into employees(employee_id,first_name,last_name,cred_id) values(105,'Ashish','Bakshi',305);

insert into credentials(credentials_id,username,password) values(306,'namjai','12345');
insert into employees(employee_id,first_name,last_name,cred_id) values(106,'Namrata','Jain',306);

delete from credentials where credentials_id=306;

update credentials set credentials_id=3001 where credentials_id=301;
update credentials set credentials_id=3002 where credentials_id=302;
update credentials set credentials_id=3003 where credentials_id=303;
update credentials set credentials_id=3004 where credentials_id=304;
update credentials set credentials_id=3005 where credentials_id=305;




