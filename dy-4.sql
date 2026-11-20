use cds_hyd_jfs_60;
drop table customers;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY, -- OR UNIQUE NOT NULL
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    gender CHAR(1) NOT NULL CHECK(gender IN ('M','F')),
    date_of_birth DATE NOT NULL,
    email_address VARCHAR(200) UNIQUE NULL,
    mobile_number VARCHAR(20) UNIQUE NOT NULL
);

INSERT INTO customers(customer_id,
    first_name,
    last_name,
    gender,
    date_of_birth,
    email_address,
    mobile_number) VALUES(101,'Neha','Gupta','M','1990-12-31','nehagupta@gmail.com','9988998899');
    
    INSERT INTO customers(customer_id,
    first_name,
    last_name,
    gender,
    date_of_birth,
    email_address,
    mobile_number) VALUES(102,'Akshat','Kumar','M','1991-12-31','akshatkumar@gmail.com','8899988990');
    
    SELECT customer_id,
    first_name,
    last_name,
    gender,
    date_of_birth,
    email_address,
    mobile_number FROM customers;

    INSERT INTO customers(customer_id,
    first_name,
    last_name,
    gender,
    date_of_birth,
    email_address,
    mobile_number) VALUES(103,'Varsha','Jain','F','1991-12-31','varshajain@gmail.com','9971788629')
    ;
    
	INSERT INTO customers(customer_id,
    first_name,
    last_name,
    gender,
    date_of_birth,
    email_address,
    mobile_number) VALUES(104,'Varsha','Jain','F','1991-11-30','varshajain@gmail.com','2356188687');-- EMIAL SHOULD BE UNIQUE
    
  	INSERT INTO customers(customer_id,
    first_name,
    last_name,
    gender,
    date_of_birth,
    mobile_number) VALUES(200,'Varsha','Jain','F','1991-11-30','1156188687');-- EMIAL CAN BE NULL  
    
      	INSERT INTO customers(customer_id,
    first_name,
    last_name,
    gender,
    date_of_birth,
    mobile_number) VALUES(201,'VarsHINI','Jain','F','1991-11-30','1150188687');-- EMIAL CAN BE NULL  
    
	INSERT INTO customers(customer_id,
    first_name,
    last_name,
    gender,
    date_of_birth,
    email_address,
    mobile_number) VALUES(105,'Ankit','Verma','M','1991-12-31','ankitverma@gmail.com','9971788629');
    
	INSERT INTO customers(customer_id,
    first_name,
    last_name,
    gender,
    date_of_birth,
    email_address) VALUES(106,'Bharat','Sharma','M','1990-09-17','bharatsharma@gmail.com');
    
	INSERT INTO customers(customer_id,
    gender,
    date_of_birth,
    mobile_number) VALUES(107,'M','1991-12-31','7718988629');
    
	INSERT INTO customers(customer_id,
    first_name,
    last_name,
    gender,
    date_of_birth,
    email_address,
    mobile_number) VALUES(108,'Ravi','Jangra','M','1990-12-31','ravijangra@gmail.com','9971706421');
    
	INSERT INTO customers(customer_id,
    first_name,
    last_name,
    gender,
    date_of_birth,
    email_address,
    mobile_number) VALUES(109,'Ashish','Bakshi','M','1971-02-09','ashishbakshi@gmail.com','9971706421');
    
  
    