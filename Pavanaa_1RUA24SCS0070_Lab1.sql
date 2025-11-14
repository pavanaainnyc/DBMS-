
CREATE DATABASE db_lab;

-- Step 2: Use the newly created database
USE db_lab;

-- Step 3: Create the Students table
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,             -- Unique identifier for each student
    FirstName VARCHAR(50),                 -- First name of the student
    LastName VARCHAR(50),                  -- Last name of the student
    Email VARCHAR(100) UNIQUE,             -- Email of the student, must be unique
    DateOfBirth DATE                       -- Date of birth of the student
);

-- Step 4: Create the Courses table
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,              -- Unique identifier for each course
    CourseName VARCHAR(100),               -- Name of the course
    Credits INT                            -- Number of credits for the course
);

-- Step 5: Create the Enrollments table
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,          -- Unique identifier for each enrollment
    StudentID INT,                         -- Foreign key referencing Students(StudentID)
    CourseID INT,                          -- Foreign key referencing Courses(CourseID)
    EnrollmentDate DATE,                   -- Date when the student enrolled in the course
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Step 6: Select all records from the Enrollments table
SELECT * FROM Enrollments;
-- output: 03:53:16	SELECT * FROM Enrollments LIMIT 0, 1000	0 row(s) returned	0.000 sec / 0.000 sec

-- Step 7: Select all records from the Students table
SELECT * FROM Students;
-- output: 03:53:58	SELECT * FROM Students LIMIT 0, 1000	0 row(s) returned	0.000 sec / 0.000 sec

-- Step 8: Select all records from the Courses table
SELECT * FROM Courses;
-- output: 03:54:26	SELECT * FROM Courses LIMIT 0, 1000	0 row(s) returned	0.000 sec / 0.000 sec

-- Step 9: Alter the Students table to add a PhoneNumber column
ALTER TABLE Students
ADD PhoneNumber VARCHAR(15);               -- Add a new column for storing phone numbers
-- output: ALTER TABLE Students ADD PhoneNumber VARCHAR(15)	0 row(s) affected Records: 0  Duplicates: 0  Warnings: 0	0.063 sec

-- Step 10: Alter the Courses table to modify the Credits column
ALTER TABLE Courses
MODIFY Credits DECIMAL(3, 1);              -- Modify the Credits column to allow decimal values
-- output: 	ALTER TABLE Courses MODIFY Credits DECIMAL(3, 1)	0 row(s) affected Records: 0  Duplicates: 0  Warnings: 0	0.047 sec

-- Step 11: Alter the Enrollments table to add a unique constraint
ALTER TABLE Enrollments
ADD CONSTRAINT UC_StudentCourse UNIQUE (StudentID, CourseID);  -- Ensure unique student-course combinations
-- output: 	ALTER TABLE Enrollments ADD CONSTRAINT UC_StudentCourse UNIQUE (StudentID, CourseID)	0 row(s) affected Records: 0  Duplicates: 0  Warnings: 0	0.047 sec
 
-- Step 12: Drop the Enrollments table
DROP TABLE Enrollments;                    -- Delete the Enrollments table
-- output: DROP TABLE Enrollments	0 row(s) affected	0.016 sec

-- Step 13: Drop the Courses table
DROP TABLE Courses;                        -- Delete the Courses table
-- output: DROP TABLE Courses	0 row(s) affected	0.016 sec
