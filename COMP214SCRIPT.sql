-- DROP SEQUENCES
DROP SEQUENCE SEQUENCE_COMPANYID;
DROP SEQUENCE SEQUENCE_DEPARTMENTID;
DROP SEQUENCE SEQUENCE_EMPLOYEEID;
DROP SEQUENCE SEQUENCE_HELPDESKID;
DROP SEQUENCE SEQUENCE_LOANID;
DROP SEQUENCE SEQUENCE_LOANPAYMENTID;

-- DROP TABLES
DROP TABLE EMPLOYEE CASCADE CONSTRAINTS;
DROP TABLE LOAN CASCADE CONSTRAINTS;
DROP TABLE TAX CASCADE CONSTRAINTS;
DROP TABLE COMPANY CASCADE CONSTRAINTS;
DROP TABLE DEPARTMENT CASCADE CONSTRAINTS;
DROP TABLE HELPDESK CASCADE CONSTRAINTS;
DROP TABLE LOANPAYMENT CASCADE CONSTRAINTS;

-- DROP INDEXES
DROP INDEX INDEX_EMPLOYEE_FIRSTNAME;
DROP INDEX INDEX_EMPLOYEE_LASTNAME;
DROP INDEX INDEX_EMPLOYEE_USERNAME;
DROP INDEX INDEX_LOAN_LOANVALUE;
DROP INDEX INDEX_TAX_TAXVALUE;
DROP INDEX INDEX_TAX_YEAR;

-- CREATE TABLES, SEQUENCES FOR TABLES AND INSERT FIRST 10 ROWS INTO TABLES
CREATE TABLE COMPANY 
(
  COMPANYID NUMBER(38, 0) NOT NULL, 
  COMPANYNAME VARCHAR2(200) NOT NULL, 
  ADDRESS VARCHAR2(200) NOT NULL,
  PRIMARY KEY (COMPANYID) ENABLE 
);

CREATE SEQUENCE SEQUENCE_COMPANYID
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

INSERT INTO Company (Companyid,Companyname,address) VALUES (SEQUENCE_COMPANYID.NEXTVAL,'IBM','Frankfurt');
INSERT INTO Company (Companyid,Companyname,address) VALUES (SEQUENCE_COMPANYID.NEXTVAL,'Scott.CO','Jamaica');
INSERT INTO Company (Companyid,Companyname,address) VALUES (SEQUENCE_COMPANYID.NEXTVAL,'FOOD PANDA','Canada');
INSERT INTO Company (Companyid,Companyname,address) VALUES (SEQUENCE_COMPANYID.NEXTVAL,'Capgemini','Toronto');
INSERT INTO Company (Companyid,Companyname,address) VALUES (SEQUENCE_COMPANYID.NEXTVAL,'Oracle','Cuba');
INSERT INTO Company (Companyid,Companyname,address) VALUES (SEQUENCE_COMPANYID.NEXTVAL,'Apple.CO','Bahamas');
INSERT INTO Company (Companyid,Companyname,address) VALUES (SEQUENCE_COMPANYID.NEXTVAL,'Bartaha','Brazil');
INSERT INTO Company (Companyid,Companyname,address) VALUES (SEQUENCE_COMPANYID.NEXTVAL,'Cococola','India');
INSERT INTO Company (Companyid,Companyname,address) VALUES (SEQUENCE_COMPANYID.NEXTVAL,'North-face','China');
INSERT INTO Company (Companyid,Companyname,address) VALUES (SEQUENCE_COMPANYID.NEXTVAL,'JD and CO','Vietam');



CREATE TABLE DEPARTMENT 
(
  DEPARTMENTID NUMBER(38, 0) NOT NULL,
  DEPARTMENTNAME VARCHAR2(200) NOT NULL,
  COMPANYID NUMBER(38,0) NOT NULL,
  PRIMARY KEY (DEPARTMENTID )ENABLE,
  FOREIGN KEY(COMPANYID) REFERENCES COMPANY(COMPANYID) ENABLE
);

CREATE SEQUENCE SEQUENCE_DEPARTMENTID
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

INSERT INTO DEPARTMENT (DEPARTMENTID, DEPARTMENTNAME, COMPANYID) VALUES(SEQUENCE_DEPARTMENTID.NEXTVAL, 'IT', 1);
INSERT INTO DEPARTMENT (DEPARTMENTID, DEPARTMENTNAME, COMPANYID) VALUES(SEQUENCE_DEPARTMENTID.NEXTVAL, 'IT', 1);
INSERT INTO DEPARTMENT (DEPARTMENTID, DEPARTMENTNAME, COMPANYID) VALUES(SEQUENCE_DEPARTMENTID.NEXTVAL, 'Food', 1);
INSERT INTO DEPARTMENT (DEPARTMENTID, DEPARTMENTNAME, COMPANYID) VALUES(SEQUENCE_DEPARTMENTID.NEXTVAL, 'Consulting' ,1);
INSERT INTO DEPARTMENT (DEPARTMENTID, DEPARTMENTNAME, COMPANYID) VALUES(SEQUENCE_DEPARTMENTID.NEXTVAL, 'DBA' ,1);
INSERT INTO DEPARTMENT (DEPARTMENTID, DEPARTMENTNAME, COMPANYID) VALUES(SEQUENCE_DEPARTMENTID.NEXTVAL, 'Systems_analysis' ,1);
INSERT INTO DEPARTMENT (DEPARTMENTID, DEPARTMENTNAME, COMPANYID) VALUES(SEQUENCE_DEPARTMENTID.NEXTVAL, 'IT', 1);
INSERT INTO DEPARTMENT (DEPARTMENTID, DEPARTMENTNAME, COMPANYID) VALUES(SEQUENCE_DEPARTMENTID.NEXTVAL, 'Administration', 1);
INSERT INTO DEPARTMENT (DEPARTMENTID, DEPARTMENTNAME, COMPANYID) VALUES(SEQUENCE_DEPARTMENTID.NEXTVAL, 'Products-sale', 1);
INSERT INTO DEPARTMENT (DEPARTMENTID, DEPARTMENTNAME, COMPANYID) VALUES(SEQUENCE_DEPARTMENTID.NEXTVAL, 'Administration', 1);



CREATE TABLE EMPLOYEE 
(
  EMPLOYEEID NUMBER(38, 0) NOT NULL, 
  FIRSTNAME VARCHAR2(200) NOT NULL,
  LASTNAME VARCHAR2(200) NOT NULL,
  USERNAME VARCHAR2(200) NOT NULL,
  PASSWORD VARCHAR2(200) NOT NULL,
  ADDRESS VARCHAR2(200) NOT NULL,
  CITY VARCHAR2(200) NOT NULL,
  STATE VARCHAR2(200) NOT NULL,
  ZIP VARCHAR2(200) NOT NULL,
  PHONENUMBER VARCHAR2(200) NOT NULL,
  DEPARTMENTID NUMBER(38, 0),
  COMPANYID NUMBER(38,0) NOT NULL,
  PRIMARY KEY (EMPLOYEEID) ENABLE,
  FOREIGN KEY(COMPANYID) REFERENCES COMPANY(COMPANYID) ENABLE
);

CREATE SEQUENCE SEQUENCE_EMPLOYEEID
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

INSERT INTO EMPLOYEE (EMPLOYEEID, FIRSTNAME, LASTNAME, USERNAME, PASSWORD, ADDRESS, CITY, STATE, ZIP, PHONENUMBER, DEPARTMENTID, COMPANYID) 
VALUES (SEQUENCE_EMPLOYEEID.NEXTVAL, 'Alessio', 'Iannella', 'alexroma87', 'password', '123 College St', 'Toronto', 'ON', 'M5C3P4', '4167890987', 1, 1);

INSERT INTO EMPLOYEE (EMPLOYEEID, FIRSTNAME, LASTNAME, USERNAME, PASSWORD, ADDRESS, CITY, STATE, ZIP, PHONENUMBER, DEPARTMENTID, COMPANYID) 
VALUES (SEQUENCE_EMPLOYEEID.NEXTVAL, 'Joe', 'Rush', 'joerush', 'password', '123 Main St', 'Toronto', 'ON', 'M5C3P6', '4167890687', 2, 1);

INSERT INTO EMPLOYEE (EMPLOYEEID, FIRSTNAME, LASTNAME, USERNAME, PASSWORD, ADDRESS, CITY, STATE, ZIP, PHONENUMBER, DEPARTMENTID, COMPANYID)
VALUES (SEQUENCE_EMPLOYEEID.NEXTVAL, 'John', 'Hurt', 'johnhurt', 'password', '123 Bay St', 'Toronto', 'ON', 'M5T3P4', '4167690987', 3, 1);

INSERT INTO EMPLOYEE (EMPLOYEEID, FIRSTNAME, LASTNAME, USERNAME, PASSWORD, ADDRESS, CITY, STATE, ZIP, PHONENUMBER, DEPARTMENTID, COMPANYID)
VALUES (SEQUENCE_EMPLOYEEID.NEXTVAL, 'Sarah', 'Connor', 'sarahconnor', 'password', '123 Yonge St', 'Toronto', 'ON', 'M3C3P4', '4167390987', 4, 1);

INSERT INTO EMPLOYEE (EMPLOYEEID, FIRSTNAME, LASTNAME, USERNAME, PASSWORD, ADDRESS, CITY, STATE, ZIP, PHONENUMBER, DEPARTMENTID, COMPANYID)
VALUES(SEQUENCE_EMPLOYEEID.NEXTVAL, 'Huy', 'Nguyen', 'huynguyen', 'password', '123 Bay St', 'Toronto', 'ON', 'M5T3P4', '4167891987', 5, 1);

INSERT INTO EMPLOYEE (EMPLOYEEID, FIRSTNAME, LASTNAME, USERNAME, PASSWORD, ADDRESS, CITY, STATE, ZIP, PHONENUMBER, DEPARTMENTID, COMPANYID)
VALUES (SEQUENCE_EMPLOYEEID.NEXTVAL, 'Ted', 'Mosby', 'tedmosby', 'password', '123 Roseheath Ave', 'Toronto', 'ON', 'M5D3P4', '4167890587', 6, 1);

INSERT INTO EMPLOYEE (EMPLOYEEID, FIRSTNAME, LASTNAME, USERNAME, PASSWORD, ADDRESS, CITY, STATE, ZIP, PHONENUMBER, DEPARTMENTID, COMPANYID)
VALUES (SEQUENCE_EMPLOYEEID.NEXTVAL, 'Marshall', 'Eriksen', 'marshalleriksen', 'password', '123 Dufferin St', 'Toronto', 'ON', 'M5R3P4', '4167870987', 7, 1);

INSERT INTO EMPLOYEE (EMPLOYEEID, FIRSTNAME, LASTNAME, USERNAME, PASSWORD, ADDRESS, CITY, STATE, ZIP, PHONENUMBER, DEPARTMENTID, COMPANYID)
VALUES (SEQUENCE_EMPLOYEEID.NEXTVAL, 'Lily', 'Auldrin', 'lilyauldrin', 'password', '123 Danforth Ave', 'Toronto', 'ON', 'M3C3P4', '4167897987', 8, 1);

INSERT INTO EMPLOYEE (EMPLOYEEID, FIRSTNAME, LASTNAME, USERNAME, PASSWORD, ADDRESS, CITY, STATE, ZIP, PHONENUMBER, DEPARTMENTID, COMPANYID)
VALUES (SEQUENCE_EMPLOYEEID.NEXTVAL, 'Barney', 'Stinson', 'barneystinson', 'password', '123 Gerrard St', 'Toronto', 'ON', 'M5C3P7', '4157890987', 1, 1);

INSERT INTO EMPLOYEE (EMPLOYEEID, FIRSTNAME, LASTNAME, USERNAME, PASSWORD, ADDRESS, CITY, STATE, ZIP, PHONENUMBER, DEPARTMENTID, COMPANYID)
VALUES (SEQUENCE_EMPLOYEEID.NEXTVAL, 'Robin', 'Scherbastsky', 'robin', 'password', '123 Dandorth Ave', 'Toronto', 'ON', 'N5C3P4', '4167890387', 2, 1);


CREATE TABLE TAX 
(
  TOTALINCOME NUMBER(38,2) NOT NULL,
  TOTALTAXESPAID NUMBER(38,2) NOT NULL,
  CONTRIBUTIONS NUMBER (38,2) NOT NULL,
  REFUND NUMBER(38, 2) NOT NULL,
  TAXYEAR VARCHAR(200) NOT NULL,
  EMPLOYEEID NUMBER(38,0) NOT NULL,
  PRIMARY KEY (TAXYEAR, EMPLOYEEID) ENABLE,
  FOREIGN KEY (EMPLOYEEID) REFERENCES EMPLOYEE(EMPLOYEEID) ENABLE
);

INSERT INTO TAX (TOTALINCOME, TOTALTAXESPAID, CONTRIBUTIONS, REFUND, TAXYEAR, EMPLOYEEID) VALUES (50000, 10000, 2000, 2700, '2015', 1);
INSERT INTO TAX (TOTALINCOME, TOTALTAXESPAID, CONTRIBUTIONS, REFUND, TAXYEAR, EMPLOYEEID) VALUES (100000, 30000, 5000, 3000, '2014', 2);
INSERT INTO TAX (TOTALINCOME, TOTALTAXESPAID, CONTRIBUTIONS, REFUND, TAXYEAR, EMPLOYEEID) VALUES (30000, 2000, 1000, 500, '2013', 3);
INSERT INTO TAX (TOTALINCOME, TOTALTAXESPAID, CONTRIBUTIONS, REFUND, TAXYEAR, EMPLOYEEID) VALUES (24000, 7000, 500, 200, '2012', 4);
INSERT INTO TAX (TOTALINCOME, TOTALTAXESPAID, CONTRIBUTIONS, REFUND, TAXYEAR, EMPLOYEEID) VALUES (30000, 5000, 2000, 1000, '2013', 5);
INSERT INTO TAX (TOTALINCOME, TOTALTAXESPAID, CONTRIBUTIONS, REFUND, TAXYEAR, EMPLOYEEID) VALUES (40000, 6000, 1000, 800, '2014', 6);
INSERT INTO TAX (TOTALINCOME, TOTALTAXESPAID, CONTRIBUTIONS, REFUND, TAXYEAR, EMPLOYEEID) VALUES (30000, 5000, 2000, 1000, '2015', 7);
INSERT INTO TAX (TOTALINCOME, TOTALTAXESPAID, CONTRIBUTIONS, REFUND, TAXYEAR, EMPLOYEEID) VALUES (20000, 1000, 500, 1000, '2015', 8);
INSERT INTO TAX (TOTALINCOME, TOTALTAXESPAID, CONTRIBUTIONS, REFUND, TAXYEAR, EMPLOYEEID) VALUES (50000, 10000, 5000, 2700, '2013', 9);
INSERT INTO TAX (TOTALINCOME, TOTALTAXESPAID, CONTRIBUTIONS, REFUND, TAXYEAR, EMPLOYEEID) VALUES (30000, 3000, 1000, 200, '2014', 1);



CREATE TABLE HELPDESK 
(
  HELPDESKID NUMBER(38,0) NOT NULL,
  HELPDESKNAME VARCHAR2(200) NOT NULL,
  EMPLOYEEID NUMBER(38,0) NOT NULL,
  DESCRIPTION VARCHAR2(200) NOT NULL,
  PRIMARY KEY (HELPDESKID) ENABLE
);

CREATE SEQUENCE SEQUENCE_HELPDESKID
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

INSERT INTO HELPDESK (HELPDESKID, HELPDESKNAME, EMPLOYEEID, DESCRIPTION) VALUES (SEQUENCE_HELPDESKID.NEXTVAL, 'HD_ROOM_1', 1, 'Help desk 1 for IT room');
INSERT INTO HELPDESK (HELPDESKID, HELPDESKNAME, EMPLOYEEID, DESCRIPTION) VALUES (SEQUENCE_HELPDESKID.NEXTVAL, 'HD_ROOM_2', 2, 'Help desk 2 for IT room');
INSERT INTO HELPDESK (HELPDESKID, HELPDESKNAME, EMPLOYEEID, DESCRIPTION) VALUES (SEQUENCE_HELPDESKID.NEXTVAL, 'HD_ROOM_3', 3, 'Help desk 3 for IT room');
INSERT INTO HELPDESK (HELPDESKID, HELPDESKNAME, EMPLOYEEID, DESCRIPTION) VALUES (SEQUENCE_HELPDESKID.NEXTVAL, 'HD_ROOM_4', 4, 'Help desk 4 for IT room');
INSERT INTO HELPDESK (HELPDESKID, HELPDESKNAME, EMPLOYEEID, DESCRIPTION) VALUES (SEQUENCE_HELPDESKID.NEXTVAL, 'HD_ROOM_5', 5, 'Help desk 5 for IT room');
INSERT INTO HELPDESK (HELPDESKID, HELPDESKNAME, EMPLOYEEID, DESCRIPTION) VALUES (SEQUENCE_HELPDESKID.NEXTVAL, 'HD_ROOM_6', 6, 'Help desk 6 for IT room');
INSERT INTO HELPDESK (HELPDESKID, HELPDESKNAME, EMPLOYEEID, DESCRIPTION) VALUES (SEQUENCE_HELPDESKID.NEXTVAL, 'HD_ROOM_7', 7, 'Help desk 7 for IT room');
INSERT INTO HELPDESK (HELPDESKID, HELPDESKNAME, EMPLOYEEID, DESCRIPTION) VALUES (SEQUENCE_HELPDESKID.NEXTVAL, 'HD_ROOM_9', 9, 'Help desk 9 for IT room');
INSERT INTO HELPDESK (HELPDESKID, HELPDESKNAME, EMPLOYEEID, DESCRIPTION) VALUES (SEQUENCE_HELPDESKID.NEXTVAL, 'HD_ROOM_10', 10, 'Help desk 10 for IT room');



CREATE TABLE LOAN 
(
  LOANID NUMBER(38,0) NOT NULL,
  LOANVALUE NUMBER(38,2) NOT NULL,
  YEARS NUMBER(38,0) NOT NULL,
  INTERESTRATE NUMBER(3, 2) NOT NULL,
  COMPANYID NUMBER(38,0) NOT NULL,
  EMPLOYEEID NUMBER(38,0) NOT NULL,
  PRIMARY KEY (LOANID) ENABLE,
  FOREIGN KEY (COMPANYID) REFERENCES COMPANY(COMPANYID) ENABLE,
  FOREIGN KEY (EMPLOYEEID) REFERENCES EMPLOYEE(EMPLOYEEID) ENABLE
);

CREATE SEQUENCE SEQUENCE_LOANID
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

INSERT INTO LOAN (LOANID, LOANVALUE, YEARS, INTERESTRATE, COMPANYID, EMPLOYEEID) VALUES (SEQUENCE_LOANID.NEXTVAL, 3000.00, 2, 0.02, 1, 1);
INSERT INTO LOAN (LOANID, LOANVALUE, YEARS, INTERESTRATE, COMPANYID, EMPLOYEEID) VALUES (SEQUENCE_LOANID.NEXTVAL, 1000.00, 3, 0.10, 1, 2);
INSERT INTO LOAN (LOANID, LOANVALUE, YEARS, INTERESTRATE, COMPANYID, EMPLOYEEID) VALUES (SEQUENCE_LOANID.NEXTVAL, 1000.00, 4, 0.30, 1, 2);
INSERT INTO LOAN (LOANID, LOANVALUE, YEARS, INTERESTRATE, COMPANYID, EMPLOYEEID) VALUES (SEQUENCE_LOANID.NEXTVAL, 1000.00, 2, 0.04, 1, 2);
INSERT INTO LOAN (LOANID, LOANVALUE, YEARS, INTERESTRATE, COMPANYID, EMPLOYEEID) VALUES (SEQUENCE_LOANID.NEXTVAL, 2500.00, 4, 0.02, 1, 3);
INSERT INTO LOAN (LOANID, LOANVALUE, YEARS, INTERESTRATE, COMPANYID, EMPLOYEEID) VALUES (SEQUENCE_LOANID.NEXTVAL, 200.00, 3, 0.08, 1, 4);
INSERT INTO LOAN (LOANID, LOANVALUE, YEARS, INTERESTRATE, COMPANYID, EMPLOYEEID) VALUES (SEQUENCE_LOANID.NEXTVAL, 10000.00, 0.07, 1, 1, 4);
INSERT INTO LOAN (LOANID, LOANVALUE, YEARS, INTERESTRATE, COMPANYID, EMPLOYEEID) VALUES (SEQUENCE_LOANID.NEXTVAL, 2000.00, 1, 0.02, 1, 6);
INSERT INTO LOAN (LOANID, LOANVALUE, YEARS, INTERESTRATE, COMPANYID, EMPLOYEEID) VALUES (SEQUENCE_LOANID.NEXTVAL, 2000.00, 1, 0.02, 1, 6);
INSERT INTO LOAN (LOANID, LOANVALUE, YEARS, INTERESTRATE, COMPANYID, EMPLOYEEID) VALUES (SEQUENCE_LOANID.NEXTVAL, 5000.00, 1, 0.10, 1, 7);


-- PAYMENT ARE PAID YEARLY
CREATE TABLE LOANPAYMENT
(
  LOANPAYMENTID NUMBER(38,0) NOT NULL,
  PAYMENTVALUE NUMBER(38,2) NOT NULL,
  PAYMENTYEAR NUMBER(38,0) NOT NULL,
  PAID NUMBER(1) NOT NULL CHECK(PAID IN (0,1)), 
  LOANID NUMBER(38,0) NOT NULL,
  PRIMARY KEY (LOANPAYMENTID) ENABLE,
  FOREIGN KEY (LOANID) REFERENCES LOAN(LOANID) ENABLE
);

CREATE SEQUENCE SEQUENCE_LOANPAYMENTID
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;

INSERT INTO LOANPAYMENT (LOANPAYMENTID, PAYMENTVALUE, PAYMENTYEAR, PAID, LOANID) VALUES (SEQUENCE_LOANPAYMENTID.NEXTVAL, 1530.0, 1, 1, 1);
INSERT INTO LOANPAYMENT (LOANPAYMENTID, PAYMENTVALUE, PAYMENTYEAR, PAID, LOANID) VALUES (SEQUENCE_LOANPAYMENTID.NEXTVAL, 1530.0, 2, 1, 1);
INSERT INTO LOANPAYMENT (LOANPAYMENTID, PAYMENTVALUE, PAYMENTYEAR, PAID, LOANID) VALUES (SEQUENCE_LOANPAYMENTID.NEXTVAL, 367.0, 1, 0, 2);
INSERT INTO LOANPAYMENT (LOANPAYMENTID, PAYMENTVALUE, PAYMENTYEAR, PAID, LOANID) VALUES (SEQUENCE_LOANPAYMENTID.NEXTVAL, 367.0, 2, 0, 2);
INSERT INTO LOANPAYMENT (LOANPAYMENTID, PAYMENTVALUE, PAYMENTYEAR, PAID, LOANID) VALUES (SEQUENCE_LOANPAYMENTID.NEXTVAL, 367.0, 3, 0, 2);
INSERT INTO LOANPAYMENT (LOANPAYMENTID, PAYMENTVALUE, PAYMENTYEAR, PAID, LOANID) VALUES (SEQUENCE_LOANPAYMENTID.NEXTVAL, 325.0, 1, 0, 3);
INSERT INTO LOANPAYMENT (LOANPAYMENTID, PAYMENTVALUE, PAYMENTYEAR, PAID, LOANID) VALUES (SEQUENCE_LOANPAYMENTID.NEXTVAL, 325.0, 2, 0, 3);
INSERT INTO LOANPAYMENT (LOANPAYMENTID, PAYMENTVALUE, PAYMENTYEAR, PAID, LOANID) VALUES (SEQUENCE_LOANPAYMENTID.NEXTVAL, 325.0, 3, 0, 3);
INSERT INTO LOANPAYMENT (LOANPAYMENTID, PAYMENTVALUE, PAYMENTYEAR, PAID, LOANID) VALUES (SEQUENCE_LOANPAYMENTID.NEXTVAL, 325.0, 4, 0, 3);
INSERT INTO LOANPAYMENT (LOANPAYMENTID, PAYMENTVALUE, PAYMENTYEAR, PAID, LOANID) VALUES (SEQUENCE_LOANPAYMENTID.NEXTVAL, 72.0, 1, 1, 6);
INSERT INTO LOANPAYMENT (LOANPAYMENTID, PAYMENTVALUE, PAYMENTYEAR, PAID, LOANID) VALUES (SEQUENCE_LOANPAYMENTID.NEXTVAL, 72.0, 2, 0, 6);
INSERT INTO LOANPAYMENT (LOANPAYMENTID, PAYMENTVALUE, PAYMENTYEAR, PAID, LOANID) VALUES (SEQUENCE_LOANPAYMENTID.NEXTVAL, 72.0, 3, 0, 6);

-- CREATE INDEXES

CREATE INDEX INDEX_EMPLOYEE_FIRSTNAME
ON EMPLOYEE (FIRSTNAME);

CREATE INDEX INDEX_EMPLOYEE_LASTTNAME
ON EMPLOYEE (LASTNAME);

CREATE INDEX INDEX_EMPLOYEE_USERNAME
ON EMPLOYEE (USERNAME);

CREATE INDEX INDEX_LOAN_LOANVALUE
ON LOAN (LOANVALUE);

CREATE INDEX INDEX_TAX_TAXVALUE
ON TAX (REFUND);

CREATE INDEX INDEX_TAX_YEAR
ON TAX (TAXYEAR);

COMMIT;


-- CREATE FUNCTIONS

-- RETURN VALUE OF A PAYMENT GIVEN CAPITAL, INTEREST RATE AND YEARS
-- AS THE PAYMENT ARE PAID YEARLY, THE COMPOUND INTEREST RATE FORMULA IS : (CAPITAL * (1 + INTERESTRATE)) ^ YEARS 
CREATE OR REPLACE FUNCTION FN_PAYMENT_CALCULATOR
  (CAPITAL IN NUMBER,
   RATE IN NUMBER,
   YEARS IN NUMBER)
   RETURN NUMBER
AS
  RES NUMBER(38,2);
  BASE NUMBER(38,2);
BEGIN
  RES := (CAPITAL / YEARS) * (1 + RATE);
  RETURN RES;
END FN_PAYMENT_CALCULATOR;

-- GENERATE TAX REFUND FOR EMPLOYEE.
-- THIS FUNCTION USES A SIMPLE FORMULA : (INCOME - TAXESPAID - CONTRIBUTIONS) * RATE BASE ON INCOME BRACKETS

CREATE OR REPLACE FUNCTION FN_GENERATE_REFUND
  (INCOME IN NUMBER,
   TAXESPAID IN NUMBER,
   CONTRIBUTIONS IN NUMBER)
   RETURN NUMBER
AS
  RES TAX.REFUND%TYPE;
  RATE NUMBER(3,2);
BEGIN 
  IF (INCOME < 20000) THEN
    RATE := 0.1;
  ELSIF (INCOME >= 20000 AND INCOME < 40000) THEN
    RATE := 0.08;
  ELSIF (INCOME >= 40000) THEN
    RATE := 0.06;
  END IF;
  RES := (INCOME - TAXESPAID - CONTRIBUTIONS) * RATE;
RETURN RES;
END FN_GENERATE_REFUND;


-- CREATE PROCEDURES

-- INSERT NEW EMPLOYEE
CREATE OR REPLACE PROCEDURE SP_INSERT_EMPLOYEE
(FIRSTNAME IN EMPLOYEE.FIRSTNAME%TYPE,
 LASTNAME IN EMPLOYEE.LASTNAME%TYPE,
 USERNAME IN EMPLOYEE.USERNAME%TYPE,
 PASSWORD IN EMPLOYEE.PASSWORD%TYPE,
 ADDRESS IN EMPLOYEE.ADDRESS%TYPE,
 CITY IN EMPLOYEE.CITY%TYPE,
 STATE IN EMPLOYEE.STATE%TYPE,
 ZIP EMPLOYEE.ZIP%TYPE,
 PHONENUMBER IN EMPLOYEE.PHONENUMBER%TYPE,
 DEPARTMENTID IN EMPLOYEE.DEPARTMENTID%TYPE,
 COMPANYID IN EMPLOYEE.COMPANYID%TYPE)
AS
BEGIN
  INSERT INTO EMPLOYEE(EMPLOYEEID, FIRSTNAME, LASTNAME, USERNAME, PASSWORD, ADDRESS, CITY, STATE, ZIP, PHONENUMBER, DEPARTMENTID, COMPANYID) 
  VALUES(SEQUENCE_EMPLOYEEID.NEXTVAL, FIRSTNAME, LASTNAME, USERNAME, PASSWORD, ADDRESS, CITY, STATE, ZIP, PHONENUMBER, DEPARTMENTID, COMPANYID);
  COMMIT;
END SP_INSERT_EMPLOYEE;

-- INSERT NEW LOAN
CREATE OR REPLACE PROCEDURE SP_INSERT_LOAN
(LOANVALUE IN LOAN.LOANVALUE%TYPE,
 YEARS IN LOAN.YEARS%TYPE,
 INTERESTRATE IN LOAN.INTERESTRATE%TYPE,
 EMPLOYEE_ID IN LOAN.EMPLOYEEID%TYPE)
AS
  COMPANY_ID LOAN.COMPANYID%TYPE;
BEGIN
  -- SELECT COMPANY ID FOR EMPLOYEE ID
  SELECT COMPANYID
  INTO COMPANY_ID
  FROM EMPLOYEE
  WHERE EMPLOYEEID = EMPLOYEE_ID;
  DBMS_OUTPUT.PUT_LINE(COMPANY_ID);
  -- INSERT NEW LOAN 
  INSERT INTO LOAN (LOANID, LOANVALUE, YEARS, INTERESTRATE, COMPANYID, EMPLOYEEID)
  VALUES (SEQUENCE_LOANID.NEXTVAL, LOANVALUE, YEARS, INTERESTRATE, COMPANY_ID, EMPLOYEE_ID);
  COMMIT;
END SP_INSERT_LOAN;


CREATE OR REPLACE PROCEDURE SP_INSERT_TAX
(EMPLOYEEID IN EMPLOYEE.EMPLOYEEID%TYPE,
 INCOME IN TAX.TOTALINCOME%TYPE,
 TAXESPAID IN TAX.TOTALTAXESPAID%TYPE,
 CONTR IN TAX.CONTRIBUTIONS%TYPE,
 TAXYEAR IN TAX.TAXYEAR%TYPE,
 REFUND OUT TAX.REFUND%TYPE)
AS
BEGIN
  REFUND := FN_GENERATE_REFUND(INCOME, TAXESPAID, CONTR);
  INSERT INTO TAX (TOTALINCOME, TOTALTAXESPAID, CONTRIBUTIONS, REFUND, TAXYEAR, EMPLOYEEID) 
  VALUES (INCOME, TAXESPAID, CONTR, REFUND, TAXYEAR, EMPLOYEEID);
  COMMIT;
END SP_INSERT_TAX;


CREATE OR REPLACE PROCEDURE SP_DELETE_EMPLOYEE
(EMPLOYEEID IN EMPLOYEE.EMPLOYEEID%TYPE)
AS
BEGIN
  DELETE 
  FROM EMPLOYEE
  WHERE EMPLOYEE.EMPLOYEEID = EMPLOYEEID;
  COMMIT;
END SP_DELETE_EMPLOYEE;


-- TRIGGER
-- WHEN A LOAN IS CREATED, THE TRIGGER CREATES ALL THE PAYMENT RECORDS
-- FOR SOME REASON, THE GROUP COULD NOT CREATE THE TRIGGER ANY MORE (ORACLE ERROR 00603)
-- LOOKING ON STACKOVERFLOW, THE SOLUTION WAS ALTERING SESSION SETTING THE PL SCOPE TO NONE, CREATING TRIGGER THEN RESETTING SESSION TO DEFAULT VALUE

ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:NONE';

CREATE OR REPLACE TRIGGER INSERT_PAYMENTS
AFTER INSERT ON LOAN FOR EACH ROW
DECLARE 
  PVALUE NUMBER(38,2);
BEGIN
  PVALUE := FN_PAYMENT_CALCULATOR(:NEW.LOANVALUE, :NEW.INTERESTRATE, :NEW.YEARS);
  FOR I IN 1..:NEW.YEARS LOOP
    INSERT INTO LOANPAYMENT (LOANPAYMENTID, PAYMENTVALUE, PAYMENTYEAR, PAID, LOANID) 
    VALUES (SEQUENCE_LOANPAYMENTID.NEXTVAL, PVALUE, I, 0, :NEW.LOANID);
  END LOOP;
END INSERT_PAYMENTS;

ALTER SESSION SET PLSCOPE_SETTINGS = 'IDENTIFIERS:ALL'; 

