-- Create database for Student Records System
CREATE DATABASE IF NOT EXISTS StudentRecords;
USE StudentRecords;

-- Create Departments table
CREATE TABLE IF NOT EXISTS Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY, -- Primary key, auto-incremented
    department_name VARCHAR(255) NOT NULL, -- Department name cannot be null
    UNIQUE(department_name) -- Ensure no duplicate department names
);

-- Create Professors table
CREATE TABLE IF NOT EXISTS Professors (
    professor_id INT AUTO_INCREMENT PRIMARY KEY, -- Primary key, auto-incremented
    first_name VARCHAR(255) NOT NULL, -- First name of the professor
    last_name VARCHAR(255) NOT NULL, -- Last name of the professor
    department_id INT, -- Foreign key referencing Departments table
    FOREIGN KEY (department_id) REFERENCES Departments(department_id) -- Enforcing relationship with Departments
);

-- Create Courses table
CREATE TABLE IF NOT EXISTS Courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY, -- Primary key, auto-incremented
    course_name VARCHAR(255) NOT NULL, -- Course name cannot be null
    department_id INT, -- Foreign key referencing Departments table
    FOREIGN KEY (department_id) REFERENCES Departments(department_id) -- Enforcing relationship with Departments
);

-- Create Students table
CREATE TABLE IF NOT EXISTS Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY, -- Primary key, auto-incremented
    first_name VARCHAR(255) NOT NULL, -- First name of the student
    last_name VARCHAR(255) NOT NULL, -- Last name of the student
    date_of_birth DATE, -- Date of birth of the student
    email VARCHAR(255) UNIQUE NOT NULL -- Unique email for each student
);

-- Create Enrollments table (Many-to-Many relationship between Students and Courses)
CREATE TABLE IF NOT EXISTS Enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY, -- Primary key, auto-incremented
    student_id INT, -- Foreign key referencing Students table
    course_id INT, -- Foreign key referencing Courses table
    enrollment_date DATE, -- Date when the student enrolled in the course
    FOREIGN KEY (student_id) REFERENCES Students(student_id), -- Enforcing relationship with Students
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) -- Enforcing relationship with Courses
);

-- Create Assignments table (Many-to-Many relationship between Professors and Courses)
CREATE TABLE IF NOT EXISTS Assignments (
    assignment_id INT AUTO_INCREMENT PRIMARY KEY, -- Primary key, auto-incremented
    professor_id INT, -- Foreign key referencing Professors table
    course_id INT, -- Foreign key referencing Courses table
    assignment_date DATE, -- Date when the professor was assigned to the course
    FOREIGN KEY (professor_id) REFERENCES Professors(professor_id), -- Enforcing relationship with Professors
    FOREIGN KEY (course_id) REFERENCES Courses(course_id) -- Enforcing relationship with Courses
);

-- Example Insert Statements for Departments
INSERT INTO Departments (department_name) VALUES ('Computer Science');
INSERT INTO Departments (department_name) VALUES ('Mathematics');
INSERT INTO Departments (department_name) VALUES ('Physics');

-- Example Insert Statements for Professors
INSERT INTO Professors (first_name, last_name, department_id) VALUES ('John', 'Doe', 1);
INSERT INTO Professors (first_name, last_name, department_id) VALUES ('Jane', 'Smith', 2);

-- Example Insert Statements for Courses
INSERT INTO Courses (course_name, department_id) VALUES ('Database Systems', 1);
INSERT INTO Courses (course_name, department_id) VALUES ('Calculus I', 2);

-- Example Insert Statements for Students
INSERT INTO Students (first_name, last_name, date_of_birth, email) VALUES ('Alice', 'Johnson', '2000-01-01', 'alice.johnson@example.com');
INSERT INTO Students (first_name, last_name, date_of_birth, email) VALUES ('Bob', 'Williams', '2001-05-10', 'bob.williams@example.com');

-- Example Insert Statements for Enrollments
INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES (1, 1, '2023-09-01');
INSERT INTO Enrollments (student_id, course_id, enrollment_date) VALUES (2, 2, '2023-09-01');

-- Example Insert Statements for Assignments
INSERT INTO Assignments (professor_id, course_id, assignment_date) VALUES (1, 1, '2023-08-15');
INSERT INTO Assignments (professor_id, course_id, assignment_date) VALUES (2, 2, '2023-08-16');
