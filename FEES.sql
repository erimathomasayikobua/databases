-- Active: 1696422135849@@127.0.0.1@3306@world
use Fees_clearing_management_db;

create table STUDENTS(
    StudentID varchar(10) PRIMARY KEY,
    Fname varchar(10) NOT NULL,
    Lname varchar(10) NOT NULL,
    Class_name VARCHAR(4) NOT NULL,
    Residence VARCHAR(12) NOT NULL,
    Payment_specification varchar(12) NOT NULL,
    Payment_code varchar(6) NOT NULL,
    Academic_level varchar(10) NOT NULL
);

ALTER TABLE STUDENTS
ADD CONSTRAINT UNIQUE_ClassName UNIQUE (Class_name),
ADD CONSTRAINT UNIQUE_AcademicLevel UNIQUE (Academic_level);


create table CLASS(
    ClassID varchar(6) PRIMARY KEY,
    Class_name varchar(4) NOT NULL,
    Class_fee INT NOT NULL,
    ACADEMIC_LEVEL VARCHAR(10) NOT NULL,
    FOREIGN KEY(Class_name) REFERENCES STUDENTS(Class_name),
    FOREIGN KEY(Academic_level) REFERENCES STUDENTS(Academic_level)
);

create table PAYMENT(
    Payment_code varchar(6) PRIMARY KEY,
    StudentID varchar(10) NOT NULL,
    Amount_paid INT NOT NULL,
    Balance INT NULL,
    Payment_date varchar(12) NOT NULL,
    FOREIGN KEY(StudentID) REFERENCES STUDENTS(StudentID)
);

create table ADMINISTRATOR(
    AdminID varchar(6) PRIMARY KEY,
    Fname varchar(10) NOT NULL,
    Lname varchar(10) NOT NULL,
    Position varchar(6) NOT NULL,
    Contact varchar(12) NOT NULL,
    StudentID varchar(10) NOT NULL,
    FOREIGN KEY(StudentID) REFERENCES STUDENTS(StudentID)
);

create table ENROLLMENT(EnrollmentID varchar(6) PRIMARY KEY,
StudentID varchar(10) NOT NULL,
Class_name varchar(4) NOT NULL,
Enrollment_date varchar(12) NOT NULL,
FOREIGN KEY(StudentID) REFERENCES STUDENTS(StudentID),
FOREIGN KEY(Class_name) REFERENCES CLASS(Class_name)
);

INSERT INTO STUDENTS (StudentID, Fname, Lname, Class_name, Residence, Payment_specification, Payment_code, Academic_level)
VALUES
    ('S1001', 'John', 'Kasumba', 'S1', 'Kampala', 'Tuition', 'P1001', 'Senior 1'),
    ('S1002', 'Jane', 'Nalubega', 'S2', 'Entebbe', 'Tuition', 'P1002', 'Senior 2'),
    ('S1003', 'Michael', 'Otim', 'S3', 'Jinja', 'Tuition', 'P1003', 'Senior 3');


INSERT INTO CLASS (ClassID, Class_name, Class_fee, ACADEMIC_LEVEL)
VALUES
    ('C1001', 'S1', 1500, 'Senior 1'),
    ('C1002', 'S2', 1600, 'Senior 2'),
    ('C1003', 'S3', 1700, 'Senior 3');


INSERT INTO PAYMENT (Payment_code, StudentID, Amount_paid, Balance, Payment_date)
VALUES
    ('P1001', 'S1001', 1500000, 0, '2023-11-01'),
    ('P1002', 'S1002', 1000000, 0, '2023-11-01'),
    ('P1003', 'S1003', 1200000, 0, '2023-11-01');


INSERT INTO ADMINISTRATOR (AdminID, Fname, Lname, Position, Contact, StudentID)
VALUES
    ('A1001', 'Mary', 'Nakato', 'HM', '0703456781', 'S1001'),
    ('A1002', 'Robert', 'Kato', 'Bursar', '0786345123', 'S1002');


INSERT INTO ENROLLMENT (EnrollmentID, StudentID, Class_name, Enrollment_date)
VALUES
    ('E1001', 'S1001', 'S1', '2023-11-01'),
    ('E1002', 'S1002', 'S2', '2023-11-01'),
    ('E1003', 'S1003', 'S3', '2023-11-01');




SHOW TABLES;
SELECT * FROM CLASS;