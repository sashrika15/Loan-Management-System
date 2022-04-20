REM   Script: Loan Management System
REM   Mini Project

CREATE TABLE borrower (   
address varchar(255),   
userid varchar(255),   
taxid varchar(255),   
loginpassword varchar(255),  
firstname varchar(255),  
lastname varchar(255),  
contact number(10),  
email varchar(255)  
);

CREATE TABLE loan (   
loan_number number(5) Primary key,   
loan_status varchar(255),   
duration number(5),  
purpose varchar(255),  
amount number(10),  
type varchar(255)  
);

CREATE TABLE bank_exec (    
user_id varchar(255) Primary key,    
login_password varchar(255) ,    
payee_details varchar(255),   
penalty varchar(255)   
);

CREATE TABLE payment (    
payment_number number(5),    
name varchar(255),    
balance_amount number(5),   
mode_of_payment varchar(255),   
due_date varchar(255)   
);

alter table borrower add primary key(userid);

alter table payment add foreign key (payment_number) REFERENCES loan(loan_number);

insert into loan values (1, 'Active', 3, 'Home', 4000000,'Home');

insert into loan values (2, 'Inactive', 5, 'Starting bakery', 900000,'Small Business');

insert into loan values (3, 'Active', 8, 'Abroad for education', 2000000,'Education');

insert into loan values (4, 'Active', 2, 'Need to rebuild due to earthquake', 300000,'Calamity');

insert into borrower values ('4 M Street, Delhi', 'U101', 'T1', 'garg', 'Anushka','Garg', 987654321, 'garg1@gmail.com');

insert into borrower values ('1 Elide Street, Delhi', 'U102', 'T2', 'saha', 'Rusali','Saha', 887658770, 'saha1@gmail.com');

insert into borrower values ('7/36B Jangpura, Mumbai', 'U201', 'T3', 'mitra', 'Joita','Mitra', 9988776655, 'jmitra@gmail.com');

insert into borrower values ('A115 PVH, Delhi', 'U103', 'T4', 'surya', 'Sashrika','Surya', 8844332211, 's.surya@gmail.com');

select * from borrower;

insert into bank_exec values ('B1', 'nsharma', 'surya', '0');

insert into bank_exec values ('B2', 'vindra', 'saha', '4000');

insert into bank_exec values ('B3', 'a_roy', 'mitra', '8000');

insert into bank_exec values ('B4', 'm_ghosal', 'garg', '0');

select * from bank_exec;

insert into payment values (1, 'Sashrika Surya', 40000, 'Cash', '2022-12-15');

insert into payment values (3, 'Rusali Saha', 90000, 'Bill Desk', '2023-08-27');

insert into payment values (4, 'Joita Mitra', 50000, 'Bill Desk', '2024-05-07') 
;

select * from borrower;

select * from loan;

select * from payment;

select * from bank_exec;

select * from borrower;

select b.userid, b.taxid, b.firstname from borrower b, bank_exec be where be.payee_details = b.loginpassword;

select b.userid, b.taxid, b.firstname, be.login_password from borrower b, bank_exec be where be.payee_details = b.loginpassword;

select lo.loan_status, lo.amount, lo.type, pa.name from loan lo, payment pa where lo.loan_number = pa.payment_number ;

select sum(amount) from loan where loan_status = 'Active';

SELECT count(user_id) AS Number_of_Employees FROM bank_exec;

select lo.loan_status, lo.amount, lo.type from loan lo, payment pa where lo.loan_number not in (select loan_number from loan lo, payment pa where lo.loan_number = pa.payment_number);

select loan_status, amount, type from loan where loan_number not in (select loan_number from loan lo, payment pa where lo.loan_number = pa.payment_number);

CREATE OR REPLACE TRIGGER print_new_borrower 
  BEFORE INSERT OR UPDATE ON borrower 
  FOR EACH ROW  
BEGIN  
  DBMS_OUTPUT.PUT(:NEW.userid || ': ');  
  DBMS_OUTPUT.PUT('First Name = ' || :NEW.firstname || ', ');  
  DBMS_OUTPUT.PUT('Last Name = ' || :NEW.lastname);  
END;  
/

insert into borrower values ('J1, Lodhi Road', 'U104', 'T5', 'kashyap', 'Shavy','Kashyap', 8970054762, 'shavykashyap@gmail.com') 
;

