#CREATE A NEW DATABASE

DROP DATABASE IF EXISTS customer_orders;

CREATE DATABASE IF NOT EXISTS customer_orders;

USE customer_orders;

#CREATE TABLES

CREATE TABLE customers(
customerID INT,
companyName VARCHAR (30) NOT NULL,
contactFirstName VARCHAR (20) NOT NULL,
contactLastName VARCHAR (20) NOT NULL,
addressLine1 VARCHAR (20) NOT NULL,
addressLine2 VARCHAR (20) NULL,
city VARCHAR (20) NOT NULL,
postCode VARCHAR (20) NOT NULL,
PRIMARY KEY (customerID),
UNIQUE (companyName)
);

#MODIFY FIELDNAMES
ALTER TABLE customers
MODIFY customerID INT NOT NULL;
EXPLAIN customers;

#ADD FIELDNAMES
ALTER TABLE customers
ADD COLUMN phone VARCHAR (20) NOT NULL;
EXPLAIN customers;

#ADD DATA TO TABLE
INSERT INTO customers (customerID, companyName, contactFirstName, contactLastName, addressLine1, addressLine2, city, postCode, phone)
VALUES ('101', 'LightSnacks&Bites', 'Harry', 'Smith', '172 Blakesley Road', 'NULL', 'Birmingham', 'B33 8TY', '0121 647832'),
('102', 'Clotted Ice-creams', 'Samira', 'Khan', '87 Church Lane', 'Bullwell', 'Nottingham', 'NG12 7YT', '0772780315'),
('103', 'Kakes and Bakes', 'Annete', 'Smyzki', '34 Carter Lane', 'NULL', 'Sheffield', 'SH 6HJ', '01142 369735'),
('104', 'Little Eats', 'Manik', 'Miah', '119 Goldsmith Lane', 'NULL', 'Birmingham', 'B2 9RG', '0121 966139'),
('105', 'Tiny Bites', 'Natasha', 'Cooper', '77 Ashton Grove', 'Enfield', 'London', 'N9 9TT', '0208 8093613'),
('106', 'Fairies and Wands', 'Carla', 'Smith', '52 Reginald Street', 'Kings Norton', 'Birmingham', 'B24 6GH', '0121 907354'),
('107', 'Floral Cakes', 'Kabeer', 'Khan', '87 Hyde Park Road', 'Alum Rock', 'Birmingham', 'B8 9BN', '0121 905771'),
('108', 'Sweet tooth Candy', 'Cara', 'Smith-King', '2 West Avenue', 'Rochdale', 'Manchester', 'MN6 7HR', '0789 654321'),
('109', 'Fairy Cakes by Beena', 'Beena', 'Bansali', '66 Soho Road East', 'Handsworth', 'Birmingham', 'B14 4GM', '0121 902415'),
('110', 'Cake it up', 'Harriet', 'Harper', '108 Blakesley Road', 'NULL', 'Birmingham', 'B33 6TY', '0789 0663129'),
('111', 'Ice and Gelato', 'Connie', 'Bell', '56 Forest Road', 'NULL', 'Leeds', 'LE3 5SF', '0765 3425991'),
('112', 'Creme De La Creme', 'Freida', 'Pinotto', '16 George Avenue', 'Shirley', 'Solihull', 'SO9 7JK', '0121 511672');

#VIEWING RECORDS
SELECT*FROM customers;

#UPDATE DATA
UPDATE customers
SET companyName = 'LightSnacks&Bites'
WHERE customerID = 101;

#DELETE RECORDS
DELETE FROM customers
WHERE customerID = '102';
SELECT * FROM customers;

#SELECT ONLY 1 COLUMN
SELECT companyName FROM customers;

#SELECT MULTIPLE COLUMNS
SELECT companyName, phone FROM customers;

#RETRIEVE SINGLE RECORD
SELECT * FROM customers WHERE customerID = 103;

#SORTING SELECTED COLUMNS OF DATA
SELECT * FROM customers ORDER BY city;

#SORTING BY MULTIPLE SELECTED COLUMNS
SELECT companyName, city, phone FROM customers
ORDER BY companyName, city, phone;

#CREATE ORDER TABLE
CREATE TABLE orders(
orderID INT NOT NULL,
customerID INT NOT NULL,
orderDate DATE NOT NULL
);

#ADD DATA TO ORDERTABLE
INSERT INTO orders(orderID, customerID, orderDate)
VALUES ('1', '102', '2021-01-18'),
('2', '108', '2021-01-18'),
('3', '109', '2021-01-19'),
('4', '103', '2021-01-21'),
('5', '111', '2021-01-22'),
('6', '104', '2021-01-24');

#JOIN CUSTOMER AND ORDERS TABLES
SELECT customers.customerID, orders.customerID
FROM customers
INNER JOIN orders
ON customers.customerID = orders.customerID;

#CREATE ORDER DETAILS TABLE
CREATE TABLE order_Details(
orderID INT NOT NULL PRIMARY KEY,
customerID INT NOT NULL,
productID VARCHAR(10) NOT NULL,
unitPrice DECIMAL(9,2) NOT NULL,
quantity INT
);

#ADD DATA TO ORDERDETAILS TABLE
INSERT INTO order_Details(orderID, customerID, productID, unitPrice, quantity)
VALUES ('1', '102', 'CK001', '1.99', '100'),
('2', '108', 'CK0005', '2.00', '500'),
('3', '109', 'CK002', '1.55', '120'),
('4', '103', 'FL001', '1.89', '250'),
('5', '111', 'FL004', '0.44', '1000'),
('6', '104', 'SU002', '1.45', '200'
);

#JOIN ORDERS AND ORDERDETAILS TABLES
SELECT orders.orderID, order_Details.orderID
FROM orders
INNER JOIN order_Details
ON orders.orderID = order_Details.orderID;

#RUN A SIMPLE QUERY SEARCHING 1 TABLE
SELECT * FROM orders
WHERE orderDate BETWEEN '2020-12-20' AND '2021-01-20'; 

#RUN A COMPLEX QUERY (MULTIPLE FIELDS/COLUMNS)
SELECT * FROM customers, orders
WHERE customers.customerID = orders.customerID AND orders.orderID = '2';

#RETRIEVE ALL ORDERS IN ASCENDING ORDER FROM ORDER TABLE
SELECT * FROM orders
ORDER BY customerID ASC;

#FILTER DATA USING COMPARISON OPERATORS ON 
SELECT * FROM customers WHERE customerID>108;
