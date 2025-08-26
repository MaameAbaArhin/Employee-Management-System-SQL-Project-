/* EMPLOYEE MANAGEMENT SYSTEM
Objectives
Design and create a relational database to manage employee data.
Perform CRUD operations (Create, Read, Update, Delete).
Execute SQL queries for HR and admin insights (e.g. payroll, hierarchy, attendance).
Use joins, subqueries, aggregate functions, and date/time operations.*/

-- Step 1: Database Schema
-- Creating Database. 
CREATE DATABASE EmployeeMgt
USE EmployeeMgt

-- Creating Tables
-- Department Table
CREATE TABLE Departments
(
	deptid INT PRIMARY KEY IDENTITY (1,1),
	deptname VARCHAR(90) NOT NULL,
	loca_tion VARCHAR(50) NOT NULL,
);

-- Employees Table
CREATE TABLE EMPLOYEES
(
	empid INT PRIMARY KEY IDENTITY(1,2),
	firstname VARCHAR(100),
	lastname VARCHAR(100),
	gender VARCHAR(10),
	date_of_birth DATE, 
	jobtitle VARCHAR(50),
	salary DECIMAL(10,2),
	deptid INT FOREIGN KEY(deptid) REFERENCES Departments(deptid),
	managerid INT
);

-- Attendance Table 
CREATE TABLE Attendance
(
	attendanceid INT PRIMARY KEY IDENTITY(1,3),
	empid INT FOREIGN KEY(empid) REFERENCES Employees(empid),
	date_ DATE,
	emp_status VARCHAR(10), CHECK (emp_status IN ('Present', 'Absent', 'Leave'))
);

-- Payroll Table
CREATE TABLE Payroll
(
	payrollid INT PRIMARY KEY IDENTITY(1,4),
	empid INT FOREIGN KEY(empid) REFERENCES Employees(empid),
	paydate DATE,
	basesalary DECIMAL(10,2),
	bonus DECIMAL(10,2),
	deductions DECIMAL(10,2),
	netpay DECIMAL(10,2)
);


--Step 2: Insert Sample Data
-- Inserting sample data into the departments table.
-- Departments
INSERT INTO Departments( deptname, loca_tion)VALUES
('HR', 'Accra'),
('Finance', 'Kumasi'),
('IT', 'Accra'),
('Marketing', 'Takoradi'),
('Sales', 'Capecoast');

-- Employees
INSERT INTO Employees(firstname,lastname, gender, date_of_birth, deptid, jobtitle, salary, managerid) VALUES
('Kwame', 'Mensah', 'Male', '1990-06-15', 1, 'HR Manager', 5000.00, 1001),
('Ama', 'Owusu', 'Female', '1992-04-23', 1, 'HR Assistant', 3000.00, NULL),
('Yaw', 'Boakye', 'Male', '1988-09-11', 3, 'Software Engineer', 6000.00, 1003),
('Akua', 'Asante', 'Female', '1995-12-05', 3, 'Data Analyst', 4500.00, NULL),
('Akosua','Aseidu', 'Female', '1994-12-03', 5, 'Sales Manager', 5000.00, 1005),
('Yaa', 'Yeboah', 'Female', '1999-09-12', 5, 'Sales Assistant', 3000.00, NULL),
('Kwame', 'Twumasi', 'Male', '1990-08-11', 2, 'Finance Manager', 7000.00, 1002),
('Nana', 'Owusu', 'Male', '1995-12-09', 2, 'Finance Assistant', 3000.00, NULL),
('Adjoa', 'Frimpong','Female', '1990-04-23', 4, 'Marketing Manager', 5000.00, 1004),
('Kwesi', 'Ofori', 'Male', '1999-05-24', 4, 'Marketing Assistant', 3000.00, NULL);

-- Attendance
INSERT INTO Attendance (empid,date_, emp_status) VALUES
(1,'2025-06-20', 'Present'),
(3,'2025-06-21', 'Absent'),
(5,'2025-06-20', 'Present'),
(7,'2025-06-21', 'Present'),
(9, '2025-06-20', 'Leave'),
(11, '2025-06-21', 'Absent'),
(13, '2025-06-20', 'Leave'),
(15, '2025-06-21', 'Present'),
(17, '2025-06-20', 'Absent'),
(19, '2025-06-21', 'Leave');


-- Payroll
INSERT INTO Payroll (empid,paydate,basesalary,bonus,deductions,netpay) VALUES
(1,'2025-06-15', 5000.00, 200.00, 100.00, 5100.00),
(3,'2025-06-15', 3000.00, 500.00, 300.00, 3200.00),
(5, '2025-06-15', 6000.00, 400.00, 100.00, 6300.00),
(7, '2025-06-15', 4500.00, 500.00, 200.00, 4800.00),
(9, '2025-06-15', 5000.00, 800.00, 400.00, 5400.00),
(11, '2025-06-15', 3000.00, 1000.00, 200.00, 3800.00),
(13, '2025-06-15', 7000.00, 600.00, 100.00, 7500.00),
(15, '2025-06-15', 3000.00, 400.00, 200.00, 3200.00),
(17, '2025-06-15', 5000.00, 500.00, 100.00, 5400.00),
(19, '2025-06-15', 3000.00, 1000.00, 200.00, 3800.00);
select*from Payroll

-- Step 3: Sample Queries
--Executing SQL Queries for HR and Admin insights.

--1. List all employees with their department names.
SELECT e.firstname, e.lastname, d.deptname
FROM employees e
JOIN Departments d ON e.deptid = d.deptid;

--2. Find employees earning above 5000.
SELECT firstname, lastname, salary
FROM EMPLOYEES
WHERE salary > 5000;

--3. Count employees per department 
SELECT d.deptname, COUNT(e.empid) AS TotalEmployees
FROM Departments d
JOIN EMPLOYEES e ON e.deptid = d.deptid
GROUP BY d.deptname;

-- Monthly attendance report for a specific employee.
SELECT empid, COUNT(*) AS DaysPresent
FROM Attendance
WHERE emp_status = 'Present' AND MONTH(date_) = 6 AND YEAR(date_) = 2025
GROUP BY empid;

--Calculate total salary cost for June 2025
SELECT SUM(netpay) AS TotalPayroll
FROM Payroll
WHERE MONTH(paydate) = 6 AND YEAR(paydate) = 2025;

-- View: Employee Monthly Payroll
SELECT * FROM MonthlyPayroll WHERE MONTH(PayDate) = 6 AND YEAR(PayDate) = 2025;

