-- 3.2 A set of SQL queries to implement the database schema
-- Bank branches
CREATE TABLE Branches
(Br_code NUMBER PRIMARY KEY,
Br_Name VARCHAR(50) NOT NULL,
Br_addr VARCHAR(100) NOT NULL,
Br_assets INTEGER NOT NULL);

desc Branches;

-- Suburbs
CREATE TABLE Suburbs
(Sub_ID NUMBER PRIMARY KEY,
Sub_name VARCHAR(50) NOT NULL,
Sub_price1 INTEGER NOT NULL,
Sub_price2 INTEGER NOT NULL,
Sub_price3 INTEGER NOT NULL);

desc Suburbs;

-- Employees
CREATE TABLE Employees
(Emp_ID NUMBER PRIMARY KEY,
Emp_Name VARCHAR(50) NOT NULL,
Emp_contact VARCHAR(50) NOT NULL,
Cust_list1 VARCHAR(50) NOT NULL,
Cust_list2 VARCHAR(50) NOT NULL,
Emp_addr VARCHAR(100) NOT NULL,
Emp_title VARCHAR(50) NOT NULL);

desc Employees;

-- Customers
CREATE TABLE Customers
(Cust_ID NUMBER PRIMARY KEY,
Cust_name VARCHAR(50) NOT NULL,
Cust_Addr VARCHAR(100) NOT NULL,
Cust_phone NUMBER(13) NOT NULL,
Salary INTEGER NOT NULL,
Property_suburbID NUMBER NOT NULL,
Property_Addr VARCHAR(100) NOT NULL,
Emp_ID NUMBER NOT NULL,
CONSTRAINT fk_Customers_Suburbs
FOREIGN KEY (Property_suburbID) REFERENCES Suburbs(sub_ID)
ON DELETE CASCADE,
CONSTRAINT fk_Customers_Employees
FOREIGN KEY (Emp_ID) REFERENCES Employees(Emp_ID)
ON DELETE CASCADE);

desc Customers;

-- Saving account
CREATE TABLE SavingAccount
(Acc_ID NUMBER PRIMARY KEY,
Cust_ID NUMBER NOT NULL,
Interest_rate INTEGER NOT NULL,
Balance INTEGER NOT NULL,
CONSTRAINT fk_SavingAccount_Customers
FOREIGN KEY (Cust_ID) REFERENCES customers(cust_ID)
ON DELETE CASCADE);

desc SavingAccount;

-- Home loan
CREATE TABLE HomeLoan
(Loan_ID NUMBER PRIMARY KEY,
Cust_ID NUMBER NOT NULL,
Loan_limit INTEGER NOT NULL,
Sub_ID NUMBER NOT NULL,
Property_value INTEGER NOT NULL,
FOREIGN KEY (Cust_ID) REFERENCES customers(cust_ID)
ON DELETE CASCADE,
CONSTRAINT fk_HomeLoan_Suburbs
FOREIGN KEY (Sub_ID) REFERENCES Suburbs(Sub_ID)
ON DELETE CASCADE);

desc HomeLoan;

-- Payment
CREATE TABLE Payment
(Payment_ID NUMBER PRIMARY KEY,
Cust_ID NUMBER NOT NULL,
Loan_ID NUMBER NOT NULL,
Payment_amount INTEGER NOT NULL,
Payment_date DATE NOT NULL,
CONSTRAINT fk_Payment_Customers
FOREIGN KEY (Cust_ID) REFERENCES customers(Cust_ID)
ON DELETE CASCADE,
CONSTRAINT fk_Payment_HomeLoan
FOREIGN KEY (Loan_ID) REFERENCES HomeLoan(Loan_ID)
ON DELETE CASCADE);

desc Payment;

-- 3.3 A set of SQL queries to add data into the database implemented in Task 3.2

REM INSERTING into Branches
SET DEFINE OFF;

Insert into Branches (Br_code,Br_name,Br_addr,Br_assets) values (0212,'Altona','Central square ave, Altona VIC3018',860000);

Insert into Branches (Br_code,Br_name,Br_addr,Br_assets) values (0213,'Alexandra','92 Grant street, Alexandra VIC3714',1020000);

Insert into Branches (Br_code,Br_name,Br_addr,Br_assets) values (0214,'Ballarat West','925 Sturt road, Ballarat VIC3350',920000);

Insert into Branches (Br_code,Br_name,Br_addr,Br_assets) values (0215,'Belgrave','65 Ford street, Belgrave VIC3160',970000);

--

REM INSERTING into Suburbs
SET DEFINE OFF;

Insert into Suburbs (Sub_ID,Sub_name,Sub_price1,Sub_price2,sub_price3) values (3004,'St Kilda',630000,570000,700000);

Insert into Suburbs (Sub_ID,Sub_name,Sub_price1,Sub_price2,sub_price3) values (3011,'Footscray',490000,550000,590000);

Insert into Suburbs (Sub_ID,Sub_name,Sub_price1,Sub_price2,sub_price3) values (3065,'Fitzroy',920000,1120000,960000);

Insert into Suburbs (Sub_ID,Sub_name,Sub_price1,Sub_price2,sub_price3) values (3101,'Kew',790000,830000,650000);

Insert into Suburbs (Sub_ID,Sub_name,Sub_price1,Sub_price2,sub_price3) values (3125,'Burwood',760000,680000,810000);

--

REM INSERTING into Employees
SET DEFINE OFF;

Insert into Employees (Emp_ID,Emp_name,Emp_contact,Cust_list1,Cust_list2,Emp_addr,Emp_title) values (30,'Austin Flores','austin.flores@example.com','Jamie Butler','Leon Powell','Box Hill','Executive');

Insert into Employees (Emp_ID,Emp_name,Emp_contact,Cust_list1,Cust_list2,Emp_addr,Emp_title) values (31,'Isla Graham','isla.graham@example.com','Caleb Diaz','Ronnie Perry','Sunshine','Senior Executive');

Insert into Employees (Emp_ID,Emp_name,Emp_contact,Cust_list1,Cust_list2,Emp_addr,Emp_title) values (32,'Seth Foster','seth.foster@example.com','Roman Hughes','Connor Hayes','Hawthorn','manager assistant');

--

REM INSERTING into Customers
SET DEFINE OFF;

Insert into Customers (Cust_ID,Cust_name,Cust_addr,Cust_phone,Salary,Property_suburbID,Property_addr,Emp_ID) values (0001,'Jamie Butler','Burwood', 0432176453,'75000',3004,'St Kilda',30);

Insert into Customers (Cust_ID,Cust_name,Cust_addr,Cust_phone,Salary,Property_suburbID,Property_addr,Emp_ID) values (0002,'Leon Powell','Springvale', 0432275832,'82000',3011,'Footscray',30);

Insert into Customers (Cust_ID,Cust_name,Cust_addr,Cust_phone,Salary,Property_suburbID,Property_addr,Emp_ID) values (0003,'Caleb Diaz','Noble Park', 0432466832,'68000',3011,'Footscray',31);

Insert into Customers (Cust_ID,Cust_name,Cust_addr,Cust_phone,Salary,Property_suburbID,Property_addr,Emp_ID) values (0004,'Ronnie Perry','Nunawading', 0432172635,'91000',3065,'Fitzroy',31);

Insert into Customers (Cust_ID,Cust_name,Cust_addr,Cust_phone,Salary,Property_suburbID,Property_addr,Emp_ID) values (0005,'Roman Hughes','Melbourne Port', 0432123874,'78000',3101,'Kew',32);

Insert into Customers (Cust_ID,Cust_name,Cust_addr,Cust_phone,Salary,Property_suburbID,Property_addr,Emp_ID) values (0006,'Connor Hayes','Black Burn', 0432666332,'75000',3125,'Burwood',32);

--

REM INSERTING into SavingAccount
SET DEFINE OFF;

Insert into SavingAccount (Acc_ID,Cust_ID,Interest_rate,Balance) values (1111,0001,3.0,250000);

Insert into SavingAccount (Acc_ID,Cust_ID,Interest_rate,Balance) values (1112,0002,2.5,150000);

Insert into SavingAccount (Acc_ID,Cust_ID,Interest_rate,Balance) values (1113,0003,2.6,170000);

Insert into SavingAccount (Acc_ID,Cust_ID,Interest_rate,Balance) values (1114,0004,2.78,190000);

Insert into SavingAccount (Acc_ID,Cust_ID,Interest_rate,Balance) values (1115,0005,3.15,285000);

Insert into SavingAccount (Acc_ID,Cust_ID,Interest_rate,Balance) values (1116,0006,3.2,310000);

--

-- Calculate Loan_limit
Select cust_ID,property_suburbID,7*salary as Loan_limit from customers;

-- Calculate property_value
Select c.cust_ID,sum(s.sub_price1+s.sub_price2+s.sub_price3)/3 as Property_value from customers c,suburbs s where s.sub_ID = c.property_suburbID
group by c.cust_ID;

REM INSERTING into HomeLoan
SET DEFINE OFF;

Insert into HomeLoan(Loan_ID,Cust_ID,Loan_limit,Sub_ID,Property_value) values (101,0001,525000,3004,633333.333);

Insert into HomeLoan(Loan_ID,Cust_ID,Loan_limit,Sub_ID,Property_value) values (102,0002,574000,3011,543333.333);

Insert into HomeLoan(Loan_ID,Cust_ID,Loan_limit,Sub_ID,Property_value) values (103,0003,476000,3011,543333.333);

Insert into HomeLoan(Loan_ID,Cust_ID,Loan_limit,Sub_ID,Property_value) values (104,0004,637000,3065,1000000);

Insert into HomeLoan(Loan_ID,Cust_ID,Loan_limit,Sub_ID,Property_value) values (105,0005,546000,3101,756666.667);

Insert into HomeLoan(Loan_ID,Cust_ID,Loan_limit,Sub_ID,Property_value) values (106,0006,525000,3125,750000);

--

REM INSERTING into Payment
SET DEFINE OFF;

Insert into Payment (Payment_ID,Cust_ID,Loan_ID,Payment_amount,Payment_date) values (0101,0001,101,100000,to_date('01-JUN-19','DD-MM-RR'));

Insert into Payment (Payment_ID,Cust_ID,Loan_ID,Payment_amount,Payment_date) values (0102,0001,101,100000,to_date('01-SEP-19','DD-MM-RR'));

Insert into Payment (Payment_ID,Cust_ID,Loan_ID,Payment_amount,Payment_date) values (0103,0001,101,100000,to_date('01-DEC-19','DD-MM-RR'));

Insert into Payment (Payment_ID,Cust_ID,Loan_ID,Payment_amount,Payment_date) values (0104,0002,102,120000,to_date('15-JUN-19','DD-MM-RR'));

Insert into Payment (Payment_ID,Cust_ID,Loan_ID,Payment_amount,Payment_date) values (0105,0002,102,120000,to_date('15-SEP-19','DD-MM-RR'));

Insert into Payment (Payment_ID,Cust_ID,Loan_ID,Payment_amount,Payment_date) values (0106,0003,103,50000,to_date('10-JUL-19','DD-MM-RR'));

Insert into Payment (Payment_ID,Cust_ID,Loan_ID,Payment_amount,Payment_date) values (0107,0003,103,50000,to_date('10-OCT-19','DD-MM-RR'));

Insert into Payment (Payment_ID,Cust_ID,Loan_ID,Payment_amount,Payment_date) values (0108,0004,104,150000,to_date('23-AUG-19','DD-MM-RR'));

Insert into Payment (Payment_ID,Cust_ID,Loan_ID,Payment_amount,Payment_date) values (0109,0004,104,150000,to_date('23-NOV-19','DD-MM-RR'));

Insert into Payment (Payment_ID,Cust_ID,Loan_ID,Payment_amount,Payment_date) values (0110,0005,105,90000,to_date('15-AUG-19','DD-MM-RR'));

Insert into Payment (Payment_ID,Cust_ID,Loan_ID,Payment_amount,Payment_date) values (0111,0005,105,90050,to_date('20-NOV-19','DD-MM-RR'));

Insert into Payment (Payment_ID,Cust_ID,Loan_ID,Payment_amount,Payment_date) values (0112,0006,106,85000,to_date('10-SEP-19','DD-MM-RR'));

Insert into Payment (Payment_ID,Cust_ID,Loan_ID,Payment_amount,Payment_date) values (0113,0006,106,85000,to_date('10-DEC-19','DD-MM-RR'));

-- Drop tables 
Drop table Payment;
Drop table HomeLoan;
Drop table SavingAccount;
Drop table Customers;
Drop table Employees;
Drop table Suburbs;
Drop table Branches;
