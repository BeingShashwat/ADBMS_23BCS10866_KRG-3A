-- Creating AUTHOR table
CREATE TABLE AUTHOR_INFO (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Nation VARCHAR(50)
);

-- Creating BOOK table
CREATE TABLE BOOK_INFO (
    BookCode INT PRIMARY KEY,
    BookTitle VARCHAR(100),
    WrittenBy INT,
    FOREIGN KEY (WrittenBy) REFERENCES AUTHOR_INFO(ID)
);

-- Inserting authors
INSERT INTO AUTHOR_INFO (ID, Name, Nation) VALUES
(1, 'Shashwat', 'India'),
(2, 'Chetna', 'Nepal'),
(3, 'Akshat', 'Bhutan'),
(4, 'Sweety', 'India'),
(5, 'Sachet', 'Nigeria');

-- Inserting books
INSERT INTO BOOK_INFO (BookCode, BookTitle, WrittenBy) VALUES
(201, 'DBMS Unlocked', 1),
(202, 'DAA Simplified', 2),
(203, 'Code Like a Pro', 3),
(204, 'Easy Algorithms', 4),
(205, 'Crack C++', 5);

-- Query to get book details with author info
SELECT B.BookTitle, A.Name AS AuthorName, A.Nation
FROM BOOK_INFO B
JOIN AUTHOR_INFO A ON B.WrittenBy = A.ID;


-- Creating DEPARTMENT table
CREATE TABLE DEPT_MASTER (
    DeptCode INT PRIMARY KEY,
    Department VARCHAR(50)
);

-- Creating COURSE table
CREATE TABLE COURSE_LIST (
    CID INT PRIMARY KEY,
    CourseTitle VARCHAR(100),
    DCode INT,
    FOREIGN KEY (DCode) REFERENCES DEPT_MASTER(DeptCode)
);

-- Inserting departments
INSERT INTO DEPT_MASTER (DeptCode, Department) VALUES
(10, 'CSE'),
(20, 'IT'),
(30, 'ECE'),
(40, 'ME'),
(50, 'CE');

-- Inserting courses
INSERT INTO COURSE_LIST (CID, CourseTitle, DCode) VALUES
(301, 'Intro to DBMS', 10),
(302, 'Design & Analysis', 10),
(303, 'Coding Bootcamp', 10),
(304, 'Frontend Essentials', 20),
(305, 'Security Basics', 20),
(306, 'DS in Depth', 20),
(307, 'Logic Circuits', 30),
(308, 'Microcontrollers', 30),
(309, 'Heat Transfer', 40),
(310, 'Civil Engineering Basics', 50);

-- Query to get departments with more than 2 courses
SELECT Department
FROM DEPT_MASTER
WHERE DeptCode IN (
    SELECT DCode
    FROM COURSE_LIST
    GROUP BY DCode
    HAVING COUNT(*) > 2
);
