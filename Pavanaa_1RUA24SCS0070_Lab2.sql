show databases;
create database Techsol;
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2),
    BirthDate DATE,
    HireDate DATE
);
use  Techsol;
INSERT INTO Employees (FirstName, LastName, Salary, BirthDate, HireDate) VALUES
('John', 'Doe', 55000.30, '1985-06-15', '2010-01-20'),
('Jane', 'Smith', 65000.50, '1990-08-22', '2012-07-10'),
('Alice', 'Johnson', 72000.10, '1982-11-30', '2015-05-25'),
('Bob', 'Brown', 48000.90, '1978-03-12', '2018-09-15');
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    EmployeeID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);
INSERT INTO Orders (OrderDate, TotalAmount, EmployeeID) VALUES
('2024-07-15', 250.00, 1),
('2024-08-10', 175.50, 2),
('2024-09-01', 300.00, 3),
('2024-09-10', 450.75, 1),
('2024-08-25', 123.40, 4);
desc table Orders;
-- output 
-- # id, select_type, table, partitions, type, possible_keys, key, key_len, ref, rows, filtered, Extra
-- '1', 'SIMPLE', 'Orders', NULL, 'ALL', NULL, NULL, NULL, NULL, '5', '100.00', NULL

SELECT EmployeeID, FirstName, LastName, ABS(Salary) AS AbsoluteSalary FROM Employees;
-- output:
-- 1	John	Doe	55000.30
-- 2	Jane	Smith	65000.50
-- 3	Alice	Johnson	72000.10
-- 4	Bob	Brown	48000.90

SELECT OrderID, CEIL(TotalAmount) AS CeilAmount FROM Orders;
-- output:
-- 1	John	Doe	55000.30
-- 2	Jane	Smith	65000.50
-- 3	Alice	Johnson	72000.10
-- 4	Bob	Brown	48000.90

SELECT COUNT(*) AS TotalEmployees FROM Employees;
SELECT SUM(Salary) AS TotalSalaryExpense FROM Employees;
-- output: 
-- 240001.80

SELECT AVG(TotalAmount) AS AverageOrderAmount FROM Orders;
-- output: 
-- 259.930000

SELECT MAX(Salary) AS HighestSalary, MIN(Salary) AS LowestSalary FROM Employees;
-- output:
-- 72000.10	48000.90