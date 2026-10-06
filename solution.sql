-- Create Department table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- Create Student table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- Create Course table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);

-- Create Enrollment table
CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- Insert values into Department
INSERT INTO Department (DepartmentID, DepartmentName)
VALUES
(1, 'Computer Science'),
(2, 'Information Technology'),
(3, 'Mathematics');

-- Insert values into Student
INSERT INTO Student (StudentID, StudentName, DepartmentID)
VALUES
(1001, 'Arun', 1),
(1002, 'Priya', 2),
(1003, 'Rahul', 1),
(1004, 'Anitha', 3);

-- Insert values into Course
INSERT INTO Course (CourseID, CourseName)
VALUES
(201, 'Database Systems'),
(202, 'Data Structures'),
(203, 'Mathematics');

-- Insert values into Enrollment
INSERT INTO Enrollment (EnrollmentID, StudentID, CourseID)
VALUES
(1, 1001, 201),
(2, 1001, 202),
(3, 1002, 201),
(4, 1003, 202),
(5, 1004, 203);

-- Create StudentDetails view
CREATE VIEW StudentDetails AS
SELECT
    Student.StudentName,
    Course.CourseName,
    Department.DepartmentName
FROM Student
JOIN Enrollment
    ON Student.StudentID = Enrollment.StudentID
JOIN Course
    ON Enrollment.CourseID = Course.CourseID
JOIN Department
    ON Student.DepartmentID = Department.DepartmentID;

-- Display the view
SELECT * FROM StudentDetails;

