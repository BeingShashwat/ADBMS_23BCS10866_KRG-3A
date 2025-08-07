--Medium Level--

-- Creating Employee Table with self-reference
CREATE TABLE STAFF (
    StaffID INTEGER PRIMARY KEY,
    StaffName TEXT NOT NULL,
    Division TEXT NOT NULL,
    SupervisorID INTEGER,
    FOREIGN KEY (SupervisorID) REFERENCES STAFF(StaffID)
);

-- Inserting data into STAFF table
INSERT INTO STAFF (StaffID, StaffName, Division, SupervisorID)
VALUES
(10, 'Riya', 'Operations', NULL),
(11, 'Kunal', 'Sales', 10),
(12, 'Meera', 'Tech', 10),
(13, 'Raghav', 'Sales', 11),
(14, 'Ishita', 'Tech', 12),
(15, 'Varun', 'Operations', 10);

-- Query to show employees and their respective managers
SELECT 
    S.StaffName AS EmployeeName, 
    S.Division AS EmployeeDivision, 
    M.StaffName AS ManagerName, 
    M.Division AS ManagerDivision
FROM 
    STAFF S
JOIN 
    STAFF M 
ON 
    S.SupervisorID = M.StaffID;


--Hard Level--

-- Creating Investment Data Table
CREATE TABLE YEARLY_INVESTMENT (
    InvestorID INT,
    InvYear INT,
    Profit INT
);

-- Creating Query Table
CREATE TABLE INVEST_QUERY (
    InvestorID INT,
    InvYear INT
);

-- Inserting data into YEARLY_INVESTMENT
INSERT INTO YEARLY_INVESTMENT (InvestorID, InvYear, Profit)
VALUES
(101, 2021, 500),
(107, 2023, 75),
(113, 2022, 90),
(101, 2022, 620),
(102, 2010, 310),
(103, 2011, 25),
(111, 2023, 88),
(107, 2022, 0);

-- Inserting queries
INSERT INTO INVEST_QUERY (InvestorID, InvYear)
VALUES
(101, 2022),
(102, 2010),
(103, 2011),
(107, 2021),
(107, 2022),
(107, 2023),
(113, 2022);

-- Query to return profit based on investor and year
SELECT 
    Q.InvestorID, 
    Q.InvYear, 
    IFNULL(Y.Profit, 0) AS ProfitEarned
FROM 
    INVEST_QUERY Q
LEFT JOIN 
    YEARLY_INVESTMENT Y
ON 
    Q.InvestorID = Y.InvestorID AND Q.InvYear = Y.InvYear;
