-- 2.2 A set of SQL queries to implement the database schema
-- Customers
Create table Customers
(Cust_ID VARCHAR(20) NOT NULL,
Cust_name VARCHAR(40) NOT NULL,
Cust_addr VARCHAR(100) NOT NULL,
Cust_phone NUMBER(13) NOT NULL,
PRIMARY KEY (Cust_ID) );

desc Customers;

-- Artists
Create table Artists
(Artist_code VARCHAR(20) NOT NULL,
Artist_name VARCHAR(40) NOT NULL,
PRIMARY KEY (Artist_code) );

desc Artists;

-- Art
Create table Art
(Art_code VARCHAR(20) NOT NULL,
Art_title VARCHAR(40) NOT NULL,
Artist_code VARCHAR(20) NOT NULL,
PRIMARY KEY (Art_code),
CONSTRAINT fk_art_artists
FOREIGN KEY (Artist_code) REFERENCES Artists(Artist_code)
ON DELETE CASCADE );

desc Art;

-- Purchase
Create table Purchase
(Cust_ID VARCHAR(20) NOT NULL,
Pur_ID VARCHAR(20) NOT NULL,
Pur_date DATE NOT NULL,
Price INTEGER NOT NULL,
Art_code VARCHAR(20) NOT NULL,
CONSTRAINT pk_purchase
PRIMARY KEY (Cust_ID,Pur_ID),
CONSTRAINT fk_purchase_art
FOREIGN KEY (Art_code) REFERENCES Art(Art_code)
ON DELETE CASCADE,
CONSTRAINT fk_purchase_customers
FOREIGN KEY (Cust_ID) REFERENCES Customers(Cust_ID)
ON DELETE CASCADE );

desc Purchase;

-- 2.3 A set of SQL queries to add data into the database implemented in Task 2.2

REM INSERTING into Customers
SET DEFINE OFF;

Insert into Customers (Cust_ID,Cust_name,Cust_addr,Cust_phone) values (0001,'Steve Smith','25 Derby street,Kew,Melbourne VIC3125',0432196888);

Insert into Customers (Cust_ID,Cust_name,Cust_addr,Cust_phone) values (0002,'James Brown','60 Glengarry avenue,Burwood,Melbourne VIC3101',0435534876);

Insert into Customers (Cust_ID,Cust_name,Cust_addr,Cust_phone) values (0003,'Micheal Jones','66 Melrose street,Mont Albert North,Melbourne VIC3128',0456765123);

Insert into Customers (Cust_ID,Cust_name,Cust_addr,Cust_phone) values (0004,'Winston Peters','24 Pheasant street,Burwood,Melbourne VIC3125',0453235874);

Insert into Customers (Cust_ID,Cust_name,Cust_addr,Cust_phone) values (0005,'George Watts','13 Vincent avenue,Geelong VIC3220',0473162865);

--

REM INSERTING into Artists
SET DEFINE OFF;

Insert into Artists (Artist_code,Artist_name) values ('J001','Johannes Vermeer');

Insert into Artists (Artist_code,Artist_name) values ('P002','Pablo Picasso');

Insert into Artists (Artist_code,Artist_name) values ('C003','Claude Monet');

Insert into Artists (Artist_code,Artist_name) values ('G004','Georges Seurat');

Insert into Artists (Artist_code,Artist_name) values ('V005','Vincent van Gogh');

Insert into Artists (Artist_code,Artist_name) values ('E006','Edvard Munch');

--

REM INSERTING into Art
SET DEFINE OFF;

Insert into Art (Art_code,Art_title,Artist_code) values ('J0101','Girl with a Pearl Earring','J001');

Insert into Art (Art_code,Art_title,Artist_code) values ('J0102','The Milkmaid','J001');

Insert into Art (Art_code,Art_title,Artist_code) values ('P0201','Woman with Fan','P002');

Insert into Art (Art_code,Art_title,Artist_code) values ('P0202','Guernica','P002');

Insert into Art (Art_code,Art_title,Artist_code) values ('C0301','Poppies','C003');

Insert into Art (Art_code,Art_title,Artist_code) values ('C0302','The Water Lily Pond','C003');

Insert into Art (Art_code,Art_title,Artist_code) values ('G0401','The Circus','G004');

Insert into Art (Art_code,Art_title,Artist_code) values ('G0402','The Eiffel Tower','G004');

Insert into Art (Art_code,Art_title,Artist_code) values ('V0501','Self Portrait','V005');

Insert into Art (Art_code,Art_title,Artist_code) values ('V0502','The Starry Night','V005');

Insert into Art (Art_code,Art_title,Artist_code) values ('E0601','The Scream','E006');

Insert into Art (Art_code,Art_title,Artist_code) values ('E0602','Vampire','E006');

--

REM INSERTING into Purchase
SET DEFINE OFF;

Insert into Purchase (Cust_ID,Pur_ID,Pur_date,Price,Art_code) values (0001,1120,to_date('04-NOV-04','DD-MM-RR'),8400,'J0101');

Insert into Purchase (Cust_ID,Pur_ID,Pur_date,Price,Art_code) values (0002,1121,to_date('12-DEC-04','DD-MM-RR'),5600,'P0201');

Insert into Purchase (Cust_ID,Pur_ID,Pur_date,Price,Art_code) values (0003,1122,to_date('26-DEC-04','DD-MM-RR'),5900,'V0501');

Insert into Purchase (Cust_ID,Pur_ID,Pur_date,Price,Art_code) values (0004,1123,to_date('01-JAN-05','DD-MM-RR'),6700,'E0601');

Insert into Purchase (Cust_ID,Pur_ID,Pur_date,Price,Art_code) values (0005,1124,to_date('23-JAN-05','DD-MM-RR'),7500,'P0202');

Insert into Purchase (Cust_ID,Pur_ID,Pur_date,Price,Art_code) values (0003,1125,to_date('15-FEB-05','DD-MM-RR'),9100,'J0101');

Insert into Purchase (Cust_ID,Pur_ID,Pur_date,Price,Art_code) values (0001,1126,to_date('27-FEB-05','DD-MM-RR'),9300,'C0301');

Insert into Purchase (Cust_ID,Pur_ID,Pur_date,Price,Art_code) values (0004,1127,to_date('07-MAR-05','DD-MM-RR'),6200,'G0401');

Insert into Purchase (Cust_ID,Pur_ID,Pur_date,Price,Art_code) values (0005,1128,to_date('16-MAR-05','DD-MM-RR'),7000,'J0102');

Insert into Purchase (Cust_ID,Pur_ID,Pur_date,Price,Art_code) values (0002,1129,to_date('26-MAR-05','DD-MM-RR'),8200,'V0502');

Insert into Purchase (Cust_ID,Pur_ID,Pur_date,Price,Art_code) values (0005,1130,to_date('04-APR-05','DD-MM-RR'),8000,'C0302');

Insert into Purchase (Cust_ID,Pur_ID,Pur_date,Price,Art_code) values (0003,1131,to_date('12-APR-05','DD-MM-RR'),7200,'E0602');

Insert into Purchase (Cust_ID,Pur_ID,Pur_date,Price,Art_code) values (0004,1132,to_date('28-APR-05','DD-MM-RR'),6900,'G0402');

Insert into Purchase (Cust_ID,Pur_ID,Pur_date,Price,Art_code) values (0001,1133,to_date('05-MAY-05','DD-MM-RR'),8400,'P0202');

Insert into Purchase (Cust_ID,Pur_ID,Pur_date,Price,Art_code) values (0003,1134,to_date('01-JUN-05','DD-MM-RR'),9500,'C0301');

-- 2.4 A SQL query to list every customer and their purchased paintings

select c.cust_name, a.art_title
from customers c, art a, purchase p
where c.cust_ID = p.cust_ID and p.art_code = a.art_code;

-- 2.5 A SQL query to list the TOP-Three customers whose expenditure are the top-3 most in the database

select c.cust_name, sum(p.price) as Total_Expenditure
from customers c, purchase p
where c.cust_ID = p.cust_ID
group by c.cust_name
order by Total_Expenditure desc
fetch first 3 rows only;

-- Drop tables to prepare for question 3

DROP TABLE Purchase;
DROP TABLE Art;
DROP TABLE Artists;
DROP TABLE Customers;