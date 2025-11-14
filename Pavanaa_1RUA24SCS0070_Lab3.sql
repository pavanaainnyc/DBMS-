SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command
-- 06:54:29	SELECT USER(),         @@hostname AS Host_Name,         VERSION() AS MySQL_Version,         NOW() AS Current_Date_Time LIMIT 0, 1000	1 row(s) returned	0.000 sec / 0.000 sec

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2),
    BirthDate DATE,
    HireDate DATE
);

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
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Print the Information of the Employee and Order Table. [ Hint: SELECT * FROM TABLENAME ]
-- Write the SQL Query below this line.
SELECT * FROM Employees;
-- output 
-- 1	John	Doe	55000.30	1985-06-15	2010-01-20
-- 2	Jane	Smith	65000.50	1990-08-22	2012-07-10
-- 3	Alice	Johnson	72000.10	1982-11-30	2015-05-25
-- 4	Bob	Brown	48000.90	1978-03-12	2018-09-15
					
SELECT * FROM Orders;
-- Output: 
-- 1	2024-07-15	250.00	1
-- 2	2024-08-10	175.50	2
-- 3	2024-09-01	300.00	3
-- 4	2024-09-10	450.75	1
-- 5	2024-08-25	123.40	4
			


-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Number Functions Section
-- ------------------------------------------------------------
/* a. Round Salaries: Round employee salaries to nearest integer */
SELECT EmployeeID, FirstName, LastName, ROUND(Salary) AS RoundedSalary FROM Employees;
-- Output:
-- 1	John	Doe	55000
-- 2	Jane	Smith	65001
-- 3	Alice	Johnson	72000
-- 4	Bob	Brown	48001 

/* b. Absolute Values: Show absolute values of salaries */
SELECT EmployeeID, FirstName, LastName, ABS(Salary) AS AbsoluteSalary FROM Employees;
-- Output: 
-- 1	John	Doe	55000.30
-- 2	Jane	Smith	65000.50
-- 3	Alice	Johnson	72000.10
-- 4	Bob	Brown	48000.90

/* c. Ceiling Values: Get ceiling values of order amounts */
SELECT OrderID, OrderDate, TotalAmount, CEIL(TotalAmount) AS CeilingOrderAmount FROM Orders;
-- Output: 
-- 1	2024-07-15	250.00	250
-- 2	2024-08-10	175.50	176
-- 3	2024-09-01	300.00	300
-- 4	2024-09-10	450.75	451
-- 5	2024-08-25	123.40	124
-- ------------------------------------------------------------
-- Aggregate Functions Section
-- ------------------------------------------------------------
/* a. Count of Employees: Find total number of employees */
SELECT COUNT(*) AS TotalEmployees FROM Employees;
-- Output: 4

/* b. Sum of Salaries: Calculate total salary expense */
SELECT SUM(Salary) AS TotalSalaryExpense FROM Employees;
-- Output: 240001.80

/* c. Average Order Amount: Find average order value */
SELECT AVG(TotalAmount) AS AverageOrderValue FROM Orders;
-- Output: 259.930000

/* d. Max/Min Salary: Find highest and lowest salaries */
SELECT MAX(Salary) AS HighestSalary, MIN(Salary) AS LowestSalary FROM Employees;
-- Output: 72000.10	48000.90

-- ------------------------------------------------------------
-- Character Functions Section
-- ------------------------------------------------------------
/* a. Case Conversion: Show names in uppercase and lowercase */
SELECT EmployeeID, UPPER(FirstName) AS FirstNameUpper, LOWER(LastName) AS LastNameLower FROM Employees;
-- Output: 
-- 1	JOHN	doe
-- 2	JANE	smith
-- 3	ALICE	johnson
-- 4	BOB	brown
/* b. Concatenate Names: Create full names */
SELECT EmployeeID, CONCAT(FirstName, ' ', LastName) AS FullName FROM Employees;
-- Output: 
-- 1	John Doe
-- 2	Jane Smith
-- 3	Alice Johnson
-- 4	Bob Brown


/* c. Extract Substring: Get first 3 characters of first names */
SELECT EmployeeID, SUBSTRING(FirstName, 1, 3) AS First3Chars FROM Employees;
-- Output: 
-- 1	Joh
-- 2	Jan
-- 3	Ali
-- 4	Bob
-- ------------------------------------------------------------
-- Conversion Functions Section
-- ------------------------------------------------------------
/* Convert String to Date: Convert text to DATE type */
SELECT STR_TO_DATE('2024-12-31', '%Y-%m-%d') AS ConvertedDate;
-- Output: 
-- 2024-12-31

-- Date Functions Section
/* a. Current Date/Time: Get current timestamp */
SELECT NOW() AS CurrentTimestamp;
-- Output: 2025-10-16 07:20:22

/* b. Extract Year: Get year from order dates */
SELECT OrderID, YEAR(OrderDate) AS OrderYear FROM Orders;
-- Output: 
-- 1	2024
-- 2	2024
-- 3	2024
-- 4	2024
-- 5	2024
/* c. Add Months: Add 3 months to order dates */
SELECT OrderID, DATE_ADD(OrderDate, INTERVAL 3 MONTH) AS NewOrderDate FROM Orders;
-- Output: 
-- 1	2024-10-15
-- 2	2024-11-10
-- 3	2024-12-01
-- 4	2024-12-10
-- 5	2024-11-25

/* d. Days Since Order: Calculate days between order date and now */
SELECT OrderID, DATEDIFF(NOW(), OrderDate) AS DaysSinceOrder FROM Orders;
-- Output: 
-- 1	458
-- 2	432
-- 3	410
-- 4	401
-- 5	417
-- END of the Task -- 