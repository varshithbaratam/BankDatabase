CREATE DATABASE IF NOT EXISTS BankDB;

USE BankDB;

SHOW DATABASES;

CREATE TABLE Customer
(
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Gender VARCHAR(10),
    DOB DATE,
    Phone VARCHAR(15),
    Email VARCHAR(50),
    Address VARCHAR(100)
);

-- ===========================================
-- BRANCH TABLE
-- ===========================================

CREATE TABLE Branch
(
    Branch_ID INT PRIMARY KEY,
    Branch_Name VARCHAR(50),
    City VARCHAR(50),
    IFSC_Code VARCHAR(20)
);

-- ===========================================
-- ACCOUNT TABLE
-- ===========================================

CREATE TABLE Account
(
    Account_No INT PRIMARY KEY,
    Customer_ID INT,
    Branch_ID INT,
    Account_Type VARCHAR(20),
    Balance DECIMAL(12,2),
    Open_Date DATE,

    FOREIGN KEY(Customer_ID)
    REFERENCES Customer(Customer_ID),

    FOREIGN KEY(Branch_ID)
    REFERENCES Branch(Branch_ID)
);

-- ===========================================
-- CUSTOMER LOGIN TABLE
-- ===========================================

CREATE TABLE Customer_Login
(
    Account_No INT PRIMARY KEY,
    Password VARCHAR(50),

    FOREIGN KEY(Account_No)
    REFERENCES Account(Account_No)
);

-- ===========================================
-- EMPLOYEE TABLE
-- ===========================================

CREATE TABLE Employee
(
    Employee_ID INT PRIMARY KEY,
    Branch_ID INT,
    Employee_Name VARCHAR(50),
    Employee_Position VARCHAR(30),
    Phone VARCHAR(15),
    Email VARCHAR(50),
    Salary DECIMAL(10,2),

    FOREIGN KEY(Branch_ID)
    REFERENCES Branch(Branch_ID)
);

-- ===========================================
-- EMPLOYEE LOGIN TABLE
-- ===========================================

CREATE TABLE Employee_Login
(
    Employee_ID INT PRIMARY KEY,
    Password VARCHAR(50),

    FOREIGN KEY(Employee_ID)
    REFERENCES Employee(Employee_ID)
);

-- ===========================================
-- LOAN TABLE
-- ===========================================

CREATE TABLE Loan
(
    Loan_ID INT PRIMARY KEY,
    Customer_ID INT,
    Loan_Type VARCHAR(30),
    Loan_Amount DECIMAL(12,2),
    Interest_Rate DECIMAL(5,2),

    FOREIGN KEY(Customer_ID)
    REFERENCES Customer(Customer_ID)
);

-- ===========================================
-- TRANSACTION TABLE
-- ===========================================

CREATE TABLE Transaction_Details
(
    Transaction_ID INT AUTO_INCREMENT PRIMARY KEY,
    Account_No INT,
    Transaction_Type VARCHAR(20),
    Amount DECIMAL(12,2),
    Transaction_Date DATE,

    FOREIGN KEY(Account_No)
    REFERENCES Account(Account_No)
);
-- ===========================================
-- PART - 2
-- INSERT DATA
-- ===========================================

-- ===========================================
-- BRANCH DATA
-- ===========================================

INSERT INTO Branch VALUES
(1,'Main Branch','Hyderabad','SBIN0001'),
(2,'City Branch','Vijayawada','SBIN0002'),
(3,'Town Branch','Rajahmundry','SBIN0003');



-- ===========================================
-- CUSTOMER DATA
-- ===========================================

INSERT INTO Customer VALUES
(101,'Sivanjali','Female','2006-05-10','9876543210','sivanjali@gmail.com','Rajahmundry'),

(102,'Priya','Female','2003-08-12','9876543211','priya@gmail.com','Vijayawada'),

(103,'Kiran','Male','2001-04-20','9876543212','kiran@gmail.com','Rajahmundry'),

(104,'Sneha','Female','2002-11-15','9876543213','sneha@gmail.com','Visakhapatnam'),

(105,'Arjun','Male','2000-07-25','9876543214','arjun@gmail.com','Guntur');



-- ===========================================
-- ACCOUNT DATA
-- ===========================================

INSERT INTO Account VALUES

(5001,101,1,'Savings',25000,'2024-01-01'),

(5002,102,2,'Current',50000,'2024-01-05'),

(5003,103,3,'Savings',18000,'2024-01-10'),

(5004,104,1,'Savings',35000,'2024-01-15'),

(5005,105,2,'Current',75000,'2024-01-20');



-- ===========================================
-- CUSTOMER LOGIN
-- ===========================================

INSERT INTO Customer_Login VALUES

(5001,'1234'),

(5002,'5678'),

(5003,'abcd'),

(5004,'bank123'),

(5005,'pass5005');



-- ===========================================
-- EMPLOYEE DATA
-- ===========================================

INSERT INTO Employee VALUES

(201,1,'Ramesh','Manager',
'9876500001',
'ramesh@bank.com',
70000),

(202,1,'Suresh','Clerk',
'9876500002',
'suresh@bank.com',
35000),

(203,2,'Lakshmi','Manager',
'9876500003',
'lakshmi@bank.com',
68000),

(204,2,'Kavya','Cashier',
'9876500004',
'kavya@bank.com',
32000),

(205,3,'Vijay','Manager',
'9876500005',
'vijay@bank.com',
72000);



-- ===========================================
-- EMPLOYEE LOGIN
-- ===========================================

INSERT INTO Employee_Login VALUES

(201,'emp201'),

(202,'emp202'),

(203,'emp203'),

(204,'emp204'),

(205,'emp205');



-- ===========================================
-- LOAN DATA
-- ===========================================

INSERT INTO Loan VALUES

(301,101,'Home Loan',500000,8.50),

(302,102,'Education Loan',300000,7.50),

(303,103,'Vehicle Loan',200000,9.00),

(304,104,'Personal Loan',150000,10.50),

(305,105,'Home Loan',700000,8.00);



-- ===========================================
-- TRANSACTION DATA
-- ===========================================

INSERT INTO Transaction_Details
(Account_No,Transaction_Type,Amount,Transaction_Date)
VALUES

(5001,'Deposit',5000,'2025-01-01'),

(5001,'Withdrawal',1000,'2025-01-02'),

(5002,'Deposit',3000,'2025-01-03'),

(5002,'Withdrawal',2000,'2025-01-04'),

(5003,'Deposit',7000,'2025-01-05'),

(5003,'Withdrawal',1500,'2025-01-06'),

(5004,'Deposit',10000,'2025-01-07'),

(5004,'Withdrawal',2500,'2025-01-08'),

(5005,'Deposit',15000,'2025-01-09'),

(5005,'Withdrawal',5000,'2025-01-10');



-- ===========================================
-- CHECK DATA
-- ===========================================

SELECT * FROM Customer;

SELECT * FROM Branch;

SELECT * FROM Account;

SELECT * FROM Customer_Login;

SELECT * FROM Employee;

SELECT * FROM Employee_Login;

SELECT * FROM Loan;

SELECT * FROM Transaction_Details;

-- ===========================================
-- PART - 3
-- SQL OPERATIONS & QUERIES
-- ===========================================

-- ===========================================
-- 1. DISPLAY ALL CUSTOMERS
-- ===========================================

SELECT * FROM Customer;


-- ===========================================
-- 2. DISPLAY ALL ACCOUNTS
-- ===========================================

SELECT * FROM Account;


-- ===========================================
-- 3. DISPLAY ALL EMPLOYEES
-- ===========================================

SELECT * FROM Employee;


-- ===========================================
-- 4. CUSTOMER ACCOUNT DETAILS (JOIN)
-- ===========================================

SELECT
Customer.Name,
Account.Account_No,
Account.Account_Type,
Account.Balance
FROM Customer
JOIN Account
ON Customer.Customer_ID = Account.Customer_ID;


-- ===========================================
-- 5. EMPLOYEE BRANCH DETAILS (JOIN)
-- ===========================================

SELECT
Employee.Employee_Name,
Employee.Employee_Position,
Branch.Branch_Name,
Branch.City
FROM Employee
JOIN Branch
ON Employee.Branch_ID = Branch.Branch_ID;


-- ===========================================
-- 6. CUSTOMER LOAN DETAILS
-- ===========================================

SELECT
Customer.Name,
Loan.Loan_Type,
Loan.Loan_Amount,
Loan.Interest_Rate
FROM Customer
JOIN Loan
ON Customer.Customer_ID = Loan.Customer_ID;


-- ===========================================
-- 7. TRANSACTION HISTORY
-- ===========================================

SELECT
Transaction_ID,
Account_No,
Transaction_Type,
Amount,
Transaction_Date
FROM Transaction_Details;


-- ===========================================
-- 8. MINI STATEMENT
-- ===========================================

SELECT *
FROM Transaction_Details
WHERE Account_No = 5001;


-- ===========================================
-- 9. DEPOSIT (UPDATE)
-- ===========================================

UPDATE Account
SET Balance = Balance + 5000
WHERE Account_No = 5001;

SELECT * FROM Account
WHERE Account_No = 5001;


-- ===========================================
-- 10. WITHDRAW (UPDATE)
-- ===========================================

UPDATE Account
SET Balance = Balance - 2000
WHERE Account_No = 5001;

SELECT * FROM Account
WHERE Account_No = 5001;


-- ===========================================
-- 11. CHECK BALANCE
-- ===========================================

SELECT Balance
FROM Account
WHERE Account_No = 5001;


-- ===========================================
-- 12. TOTAL NUMBER OF ACCOUNTS
-- ===========================================

SELECT COUNT(*) AS Total_Accounts
FROM Account;


-- ===========================================
-- 13. TOTAL BALANCE OF ALL ACCOUNTS
-- ===========================================

SELECT SUM(Balance) AS Total_Balance
FROM Account;


-- ===========================================
-- 14. MAXIMUM BALANCE
-- ===========================================

SELECT MAX(Balance) AS Highest_Balance
FROM Account;


-- ===========================================
-- 15. MINIMUM BALANCE
-- ===========================================

SELECT MIN(Balance) AS Lowest_Balance
FROM Account;


-- ===========================================
-- 16. AVERAGE BALANCE
-- ===========================================

SELECT AVG(Balance) AS Average_Balance
FROM Account;


-- ===========================================
-- 17. GROUP BY ACCOUNT TYPE
-- ===========================================

SELECT
Account_Type,
COUNT(*) AS Total_Accounts
FROM Account
GROUP BY Account_Type;


-- ===========================================
-- 18. ORDER BY BALANCE
-- ===========================================

SELECT *
FROM Account
ORDER BY Balance DESC;


-- ===========================================
-- 19. CREATE VIEW
-- ===========================================

CREATE VIEW Customer_Account_View AS

SELECT
Customer.Name,
Account.Account_No,
Account.Account_Type,
Account.Balance
FROM Customer
JOIN Account
ON Customer.Customer_ID = Account.Customer_ID;


-- VIEW OUTPUT

SELECT * FROM Customer_Account_View;


-- ===========================================
-- 20. CREATE INDEX
-- ===========================================

CREATE INDEX idx_customer_name
ON Customer(Name);


-- ===========================================
-- 21. DELETE A LOAN RECORD
-- ===========================================

DELETE FROM Loan
WHERE Loan_ID = 305;

SELECT * FROM Loan;


-- ===========================================
-- 22. SEARCH CUSTOMER
-- ===========================================

SELECT *
FROM Customer
WHERE Name='Sivanjali';


-- ===========================================
-- 23. SEARCH ACCOUNT
-- ===========================================

SELECT *
FROM Account
WHERE Account_No=5001;


-- ===========================================
-- 24. LOGIN CHECK (CUSTOMER)
-- ===========================================

SELECT *
FROM Customer_Login
WHERE Account_No=5001
AND Password='1234';


-- ===========================================
-- 25. LOGIN CHECK (EMPLOYEE)
-- ===========================================

SELECT *
FROM Employee_Login
WHERE Employee_ID=201
AND Password='emp201';


-- ===========================================
-- 26. SHOW ALL TABLES
-- ===========================================

SHOW TABLES;