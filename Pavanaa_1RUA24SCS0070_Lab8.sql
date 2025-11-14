-- ======================================================================
-- Lab Experiment – GROUP BY, HAVING, ORDER BY and INDEXING
-- ======================================================================

-- Objective:
-- 1. To understand and apply the SQL GROUP BY clause to group rows based on column values and perform aggregate operations.
-- 2. To explore the HAVING clause for filtering grouped data post aggregation.
-- 3. To use the ORDER BY clause to sort query results in ascending or descending order.
-- 4. To implement Indexing in SQL for improving query performance.

-- ======================================================================
-- Step 1: Create Database
DROP DATABASE IF EXISTS HospitalDB;
CREATE DATABASE HospitalDB;
USE HospitalDB;

-- ======================================================================
-- Step 2: Create Tables
-- Create the relational schema for Patients and Visits.

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_name VARCHAR(50),
    age INT,
    gender VARCHAR(10)
);

CREATE TABLE Visits (
    visit_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    visit_date DATE,
    doctor_id INT,
    diagnosis VARCHAR(100),
    treatment_cost DECIMAL(10,2),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- OUTPUT:
-- (After creating tables, run DESC Patients; and DESC Visits; to verify structure.)
-- WRITE YOUR OUTPUT BELOW
DESC PATIENTS;
/* OUTPUT:
patient_id	int	NO	PRI		auto_increment
patient_name	varchar(50)	YES			
age	int	YES			
gender	varchar(10)	YES			
*/

DESC VISITS;
/* OUTPUT:
visit_id	int	NO	PRI		auto_increment
patient_id	int	YES	MUL		
visit_date	date	YES			
doctor_id	int	YES			
diagnosis	varchar(100)	YES			
treatment_cost	decimal(10,2)	YES			
*/

-- ======================================================================
-- Step 3: Insert Sample Data
-- Insert sample records into both tables.
-- Add at least 5 patients and 8–10 visit records with varying diagnoses and treatment costs.
-- WRITE YOUR QUERIES BELOW

INSERT INTO Patients (patient_name, age, gender) VALUES
('Ravi', 45, 'Male'),
('Sneha', 30, 'Female'),
('Arjun', 55, 'Male'),
('Meena', 40, 'Female'),
('Kiran', 28, 'Male');


INSERT INTO Visits (patient_id, visit_date, doctor_id, diagnosis, treatment_cost) VALUES
(1, '2025-10-01', 101, 'Flu', 150.00),
(2, '2025-10-02', 102, 'Diabetes', 300.00),
(3, '2025-10-03', 103, 'Hypertension', 250.00),
(1, '2025-10-04', 101, 'Flu', 180.00),
(4, '2025-10-05', 104, 'Fracture', 800.00),
(5, '2025-10-06', 105, 'Flu', 120.00),
(2, '2025-10-07', 102, 'Diabetes', 320.00),
(3, '2025-10-08', 103, 'Hypertension', 270.00),
(4, '2025-10-09', 104, 'Fracture', 750.00),
(5, '2025-10-10', 105, 'Allergy', 180.00);


-- OUTPUT:
-- (Run SELECT * FROM Patients; and SELECT * FROM Visits; to verify inserted data.)
-- WRITE YOUR OUTPUT BELOW
SELECT * FROM PATIENTS;
/* OUTPUT:
1	Ravi	45	Male
2	Sneha	30	Female
3	Arjun	55	Male
4	Meena	40	Female
5	Kiran	28	Male
*/

SELECT * FROM VISITS;
/* OUTPUT:
1	1	2025-10-01	101	Flu	150.00
2	2	2025-10-02	102	Diabetes	300.00
3	3	2025-10-03	103	Hypertension	250.00
4	1	2025-10-04	101	Flu	180.00
5	4	2025-10-05	104	Fracture	800.00
6	5	2025-10-06	105	Flu	120.00
7	2	2025-10-07	102	Diabetes	320.00
8	3	2025-10-08	103	Hypertension	270.00
9	4	2025-10-09	104	Fracture	750.00
10	5	2025-10-10	105	Allergy	180.00
*/

-- ======================================================================
-- QUICK INTRODUCTION (for notes)
-- GROUP BY: Groups rows sharing a value and performs aggregate functions like SUM(), COUNT(), AVG().
-- HAVING: Filters grouped data after aggregation.
-- ORDER BY: Sorts query results (ASC by default, DESC for descending order).
-- INDEXING: Improves query performance by creating a quick lookup on key columns.

-- ======================================================================
-- STUDENT ACTIVITY TASKS
-- ======================================================================

-- Task 1: Grouping Data by Diagnosis
-- Group the data based on diagnosis and calculate the average treatment cost for each diagnosis.
-- WRITE YOUR QUERY BELOW
SELECT diagnosis, AVG(treatment_cost) AS avg_cost
FROM Visits
GROUP BY diagnosis;


-- OUTPUT:
-- WRITE YOUR OUTPUT BELOW
/*
Flu	150.000000
Diabetes	310.000000
Hypertension	260.000000
Fracture	775.000000
Allergy	180.000000
*/


-- ======================================================================
-- Task 2: Filtering with HAVING Clause
-- Filter the grouped data to show only diagnoses where the average treatment cost is greater than 200.
-- WRITE YOUR QUERY BELOW
SELECT diagnosis, AVG(treatment_cost) AS avg_cost
FROM Visits
GROUP BY diagnosis
HAVING AVG(treatment_cost) > 200;


-- OUTPUT:
-- WRITE YOUR OUTPUT BELOW
/*
Diabetes	310.000000
Hypertension	260.000000
Fracture	775.000000
*/


-- ======================================================================
-- Task 3: Sorting the Results
-- Sort the results from Task 1 in descending order of average treatment cost.
-- WRITE YOUR QUERY BELOW
SELECT diagnosis, AVG(treatment_cost) AS avg_cost
FROM Visits
GROUP BY diagnosis
ORDER BY avg_cost DESC;


-- OUTPUT:
-- WRITE YOUR OUTPUT BELOW
/*
Fracture	775.000000
Diabetes	310.000000
Hypertension	260.000000
Allergy	180.000000
Flu	150.000000
*/

-- ======================================================================
-- Task 4: Optimizing with Indexes
-- Create an index on the patient_id column in the Visits table to improve performance.
-- Then run a query that retrieves all visits for a particular patient.
-- WRITE YOUR QUERIES BELOW
CREATE INDEX idx_patient_id ON Visits(patient_id);

SHOW INDEX FROM Visits;

-- OUTPUT:
-- (Verify index creation using SHOW INDEX FROM Visits;)
-- WRITE YOUR OUTPUT BELOW
/*
visits	0	PRIMARY	1	visit_id	A	10				BTREE			YES	
visits	1	idx_patient_id	1	patient_id	A	5			YES	BTREE			YES	
*/

SELECT * FROM Visits WHERE patient_id = 2;
/* OUTPUT:
2	2	2025-10-02	102	Diabetes	300.00
7	2	2025-10-07	102	Diabetes	320.00
*/

-- ======================================================================
-- END OF EXPERIMENT