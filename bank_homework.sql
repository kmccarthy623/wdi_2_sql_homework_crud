-- In case there is already a bank_homework database, drop it
DROP DATABASE bank_homework; 

-- Create a bank_homework database
CREATE DATABASE bank_homework; 

-- Connect to the bank_homework database
\c bank_homework
-- Create a payments table
--  The table should have columns of id, created_at, amount, payer_name,
--  recipient_name, and description with the appropriate datatypes

CREATE TABLE payments(
    id SERIAL PRIMARY KEY,
    created_at DATE, 
    amount MONEY, 
    payer_name TEXT, 
    recipient_name TEXT, 
    description TEXT
); 

-- Alter the payments table, add the column of `zipcode`
-- to specify where the transaction was made
ALTER TABLE payments ADD COLUMN zipcode TEXT; 

-- Insert 20 rows into the payments table

-- The first of these payments should be deposits
-- try to keep the accounts positive and have at least three different payers.

INSERT INTO payments(created_at, zipcode, amount, payer_name, recipient_name, description)
  VALUES( '2014-04-25', '02116', '35', 'Jim Daley', 'Soul Cycle', 'Survivor Ride');
INSERT INTO payments(created_at, zipcode, amount, payer_name, recipient_name, description)
  VALUES( '2014-04-99', '02116', '5', 'Lauren Frits', 'Soul Cycle', 'Water & Shoes');
INSERT INTO payments(created_at, zipcode, amount, payer_name, recipient_name, description)
  VALUES( '2014-04-11', '10023', '3', 'Eleanor Tapia', 'Soul Cycle', 'Shoes');
INSERT INTO payments(created_at, zipcode, amount, payer_name, recipient_name)
  VALUES( '2014-04-01', '10023', '35', 'Eleanor Tapia', 'Soul Cycle');
INSERT INTO payments(created_at, zipcode, amount, payer_name, recipient_name, description)
  VALUES( '2014-03-01', '94116', '600', 'Meredith Regan', 'Soul Cycle', 'Monthly Pass ');
INSERT INTO payments(created_at, zipcode, amount, payer_name, recipient_name, description)
  VALUES( '2013-04-01', '94116', '350', 'Meredith Regan', 'Soul Cycle', 'Ten Rides Package');  
INSERT INTO payments(created_at, zipcode, amount, payer_name, recipient_name, description)
  VALUES( '2014-04-08', '94115', '35', 'Michelle Brown', 'Soul Cycle', 'Single Ride');
INSERT INTO payments(created_at, zipcode, amount, payer_name, recipient_name, description)
  VALUES( '2014-04-09', '02116', '5', 'Allison Marticcu', 'Soul Cycle', 'Water & Shoes');
INSERT INTO payments(created_at, zipcode, amount, payer_name, recipient_name, description)
  VALUES( '2014-04-12', '02116', '350', 'Caitlin Meloski', 'Soul Cycle', 'Ten Rides Package');
INSERT INTO payments(created_at, zipcode, amount, payer_name, recipient_name, description)
  VALUES( '2014-04-11', '02116', '105', 'Ashley Fallon', 'Soul Cycle', 'Three Ride Package');
INSERT INTO payments(created_at, zipcode, amount, payer_name, recipient_name, description)
  VALUES( '2014-04-12', '02116', '5', 'Ashley Fallon ', 'Soul Cycle', 'Water & Shoes');
INSERT INTO payments(created_at, zipcode, amount, payer_name, recipient_name, description)
  VALUES( '2013-04-11', '10023', '1', 'Criag Touch', 'Soul Cycle', 'Single Ride');
  INSERT INTO payments(created_at, zipcode, amount, payer_name, recipient_name, description)
  VALUES( '2013-03-29', '10023', '35', 'Talley Booth', 'Soul Cycle', 'Single Ride');
INSERT INTO payments(created_at, zipcode, amount, payer_name, recipient_name, description)
  VALUES( '2013-03-28', '94115', '350', 'Scott Miley', 'Soul Cycle', 'Ten Rides Package');
INSERT INTO payments(created_at, zipcode, amount, payer_name, recipient_name, description)
  VALUES( '2013-03-24', '94115', '3', 'Sarah Tops', 'Soul Cycle', 'Shoes');
INSERT INTO payments(created_at, zipcode, amount, payer_name, recipient_name, description)
  VALUES( '2013-03-25', '94115', '35', 'Jim Daley', 'Soul Cycle', 'Survivor Ride');
INSERT INTO payments(created_at, zipcode, amount, payer_name, recipient_name, description)
  VALUES( '2013-03-23', '02116', '35', 'William Totty', 'Soul Cycle', 'Single Ride');
INSERT INTO payments(created_at, zipcode, amount, payer_name, recipient_name, description)
  VALUES( '2013-03-29', '02116', '5', 'Katie Reeks', 'Soul Cycle', 'Water & Shoes'); 
INSERT INTO payments(created_at, zipcode, amount, payer_name, recipient_name, description)
  VALUES( '2013-02-27', '02116', '35', 'Danielle Cunningham', 'Soul Cycle', 'Single Ride');
INSERT INTO payments(created_at, zipcode, amount, payer_name, recipient_name, description)
  VALUES( '2013-07-08', '02116', '600', 'Katie Reeks', 'Soul Cycle', 'Unlimited Monthly');       

-- You receive notice that the payment with id of 9 is $10 too low.
-- Alter that row so that it is corrected
UPDATE payments SET amount = '360' WHERE ID = '9'; 


-- Delete all payments with an amount under $2
DELETE FROM payments WHERE amount < '2'; 


-- Select all entries from the payments table
SELECT * FROM payments;

-- In a single query, output all payments ordered from the largest to the smallest
SELECT * FROM payments ORDER by amount DESC; 

-- In a single query, output the names of all distinct recipients
SELECT DISTINCT recipient_name FROM payments; 

-- In a single query, select all payments created in the past week
SELECT *FROM payments WHERE created_at BETWEEN '2014-04-24' and '2014-05-01'; 

-- In a single query, select all payments with a blank description
SELECT *FROM payments WHERE description is NuLL; 


-- In a single query, select all payments matching the name of one of the payers (choose any single one)
SELECT* FROM payments WHERE payer_name = 'Meredith Regan'; 
