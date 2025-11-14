-- Create Database and Use It
CREATE DATABASE IF NOT EXISTS OperatorLab;
USE OperatorLab;

-- Create Tables
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Salary DECIMAL(10, 2),
    Department VARCHAR(50),
    HireDate DATE,
    Address VARCHAR(100)
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Insert Sample Data into Employees
INSERT INTO Employees (EmployeeID, Name, Age, Salary, Department, HireDate, Address) VALUES
(1001, 'Ashish', 28, 60000, 'IT', '2024-05-01', '123 Main St, New York'),
(1002, 'Binay', 45, 80000, 'HR', '2020-07-15', '456 Elm St, Chicago'),
(1003, 'Charlie', 32, 55000, 'Finance', '2022-01-10', '789 Oak St, Los Angeles'),
(1004, 'Dhruv', 38, 75000, 'HR', '2021-10-30', '101 Pine St, New York');

-- Insert Sample Data into Departments
INSERT INTO Departments (DepartmentID, DepartmentName, EmployeeID) VALUES
(1, 'IT', 1001),
(2, 'HR', 1002),
(3, 'Finance', 1003);

-- ========================
-- Practice Tasks
-- ========================

-- ========================
-- Exercise 1: Arithmetic Operators
-- ========================

-- a. Add a bonus (10% of Salary) to each employee's salary.
SELECT EmployeeID, Name, Salary, (Salary * 1.10) AS SalaryWithBonus FROM Employees;
-- output:
-- 1001	Ashish	60000.00	66000.0000
-- 1002	Binay	80000.00	88000.0000
-- 1003	Charlie	55000.00	60500.0000
-- 1004	Dhruv	75000.00	82500.0000
-- b. Subtract tax (15% of Salary) from each employee's salary.

SELECT EmployeeID, Name, Salary, (Salary * 0.85) AS SalaryAfterTax FROM Employees;
-- 1001	Ashish	60000.00	66000.0000
-- 1002	Binay	80000.00	88000.0000
-- 1003	Charlie	55000.00	60500.0000
-- 1004	Dhruv	75000.00	82500.0000

-- c. Calculate the yearly salary from the monthly salary.
SELECT EmployeeID, Name, Salary, (Salary * 12) AS YearlySalary FROM Employees;
-- 1001	Ashish	60000.00	66000.0000
-- 1002	Binay	80000.00	88000.0000
-- 1003	Charlie	55000.00	60500.0000
-- 1004	Dhruv	75000.00	82500.0000
-- d. Remainder when employees' ages are divided by 5.
SELECT EmployeeID, Name, Age, (Age % 5) AS RemainderAge FROM Employees;
-- 1001	Ashish	60000.00	66000.0000
-- 1002	Binay	80000.00	88000.0000
-- 1003	Charlie	55000.00	60500.0000
-- 1004	Dhruv	75000.00	82500.0000
-- ========================
-- Exercise 2: Logical Operators
-- ========================

-- a. Employees older than 30 and salary > 50000.
SELECT * FROM Employees WHERE Age > 30 AND Salary > 50000;
-- output:
-- 1002	Binay	45	80000.00	HR	2020-07-15	456 Elm St, Chicago
-- 1003	Charlie	32	55000.00	Finance	2022-01-10	789 Oak St, Los Angeles
-- 1004	Dhruv	38	75000.00	HR	2021-10-30	101 Pine St, New York
						
-- b. Employees either in 'HR' OR salary > 70000.
SELECT * FROM Employees WHERE Department = 'HR' OR Salary > 70000;
-- 1002	Binay	45	80000.00	HR	2020-07-15	456 Elm St, Chicago
-- 1003	Charlie	32	55000.00	Finance	2022-01-10	789 Oak St, Los Angeles
-- 1004	Dhruv	38	75000.00	HR	2021-10-30	101 Pine St, New York
						
-- c. Employees who do NOT live in 'New York'.
SELECT * FROM Employees WHERE Address NOT LIKE '%New York%';
-- output:
-- 1002	Binay	45	80000.00	HR	2020-07-15	456 Elm St, Chicago
-- 1003	Charlie	32	55000.00	Finance	2022-01-10	789 Oak St, Los Angeles
-- 1004	Dhruv	38	75000.00	HR	2021-10-30	101 Pine St, New York
						
-- ========================
-- Exercise 3: Comparison Operators
-- ========================

-- a. Employees with salary = 60000.
SELECT * FROM Employees WHERE Salary = 60000;
1001	Ashish	28	60000.00	IT	2024-05-01	123 Main St, New York
-- b. Employees not in 'IT' department.
SELECT * FROM Employees WHERE Department <> 'IT';

-- c. Employees younger than 25 with salary > 50000.
SELECT * FROM Employees WHERE Age < 25 AND Salary > 50000;

-- ========================
-- Exercise 4: Special Operators
-- ========================

-- a. Employees with age between 25 and 35.
SELECT * FROM Employees WHERE Age BETWEEN 25 AND 35;

-- b. Employees working in 'HR', 'IT', or 'Finance'.
SELECT * FROM Employees WHERE Department IN ('HR', 'IT', 'Finance');

-- c. Employees whose names start with 'A'.
SELECT * FROM Employees WHERE Name LIKE 'A%';

-- d. Employees whose address is NULL (if any).
SELECT * FROM Employees WHERE Address IS NULL;

-- ========================
-- Exercise 5: Set Operators
-- ========================

-- Note: The following are examples assuming tables Employees2022 and Employees2023 exist and are populated accordingly.

-- a. UNION → Employees from 'HR' in 2022 and 2023.
-- (Assuming these tables exist and have EmployeeID, Department columns)
-- SELECT EmployeeID FROM Employees2022 WHERE Department = 'HR'
-- UNION
-- SELECT EmployeeID FROM Employees2023 WHERE Department = 'HR';

-- b. INTERSECT → Employees in 'IT' across 2022 & 2023
-- (MySQL workaround using INNER JOIN)
-- SELECT e1.EmployeeID FROM Employees2022 e1
-- INNER JOIN Employees2023 e2 ON e1.EmployeeID = e2.EmployeeID
-- WHERE e1.Department = 'IT' AND e2.Department = 'IT';

-- c. EXCEPT → Employees in 2023 not in 2022
-- (MySQL workaround using LEFT JOIN)
-- SELECT e3.EmployeeID FROM Employees2023 e3
-- LEFT JOIN Employees2022 e2 ON e3.EmployeeID = e2.EmployeeID
-- WHERE e2.EmployeeID IS NULL;