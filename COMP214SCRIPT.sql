DROP TABLE EMPLOYEE;
DROP TABLE LOAN;
DROP TABLE TAX;
DROP TABLE COMPANY;
DROP TABLE DEPARTMENT;
DROP TABLE HELPDESK;
DROP TABLE CATEGORIES;
DROP TABLE STATUS;
DROP TABLE SUBJECT;

CREATE TABLE COMPANY 
(
  COMPANYID VARCHAR2(100) NOT NULL, 
  COMPANYNAME VARCHAR2(100) NOT NULL, 
  ADDRESS VARCHAR2(100) NOT NULL,
  CONSTRAINT COMPANY_PK PRIMARY KEY (COMPANYID) ENABLE 
);

CREATE TABLE DEPARTMENT 
(
  DEPARTMENTID VARCHAR2(100) NOT NULL,
  DEPARTMENTNAME VARCHAR2(100) NOT NULL,
  CONSTRAINT DEPARTMENT_PK PRIMARY KEY (DEPARTMENTID )ENABLE 
);

CREATE TABLE EMPLOYEE 
(
  EMPLOYEEID VARCHAR2(100) NOT NULL, 
  FIRSTNAME VARCHAR2(100) NOT NULL,
  LASTNAME VARCHAR2(100) NOT NULL,
  STATUS VARCHAR2(100) NOT NULL,
  DEPARTMENTID VARCHAR2(100),
  LOANID VARCHAR2(100),
  TAXID VARCHAR2(100),
  COMPANYID VARCHAR2(100),
  HELPDESKID VARCHAR2(100),
  PHONENUMBER VARCHAR2(100) NOT NULL,
  ADDRESS VARCHAR2(100) NOT NULL,
  CONSTRAINT EMPLOYEE_PK PRIMARY KEY (EMPLOYEEID) ENABLE 
);

CREATE TABLE LOAN 
(
  LOANID VARCHAR2(100) NOT NULL,
  COMPANYID VARCHAR2(100),
  EMPLOYEEID VARCHAR2(100),
  VALUE NUMBER(38, 0) NOT NULL,
  CONSTRAINT LOAN_PK PRIMARY KEY (LOANID) ENABLE 
);

CREATE TABLE TAX 
(
  TAXID VARCHAR2(100) NOT NULL,
  TAXVALUE NUMBER(38, 0) NOT NULL,
  DOCUMENT VARCHAR2(100) NOT NULL,
  CONSTRAINT TAX_PK PRIMARY KEY (TAXID) ENABLE 
);

CREATE TABLE HELPDESK 
(
  HELPDESKID VARCHAR2(100) NOT NULL,
  HELPDESKNAME VARCHAR2(100) NOT NULL,
  EMPLOYEEID VARCHAR2(100) NOT NULL,
  CONSTRAINT HELPDESK_PK PRIMARY KEY (HELPDESKID) ENABLE 
);



