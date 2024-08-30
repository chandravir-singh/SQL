-- find the total payment according to each payment method
CREATE DATABASE bank;
USE bank;
CREATE TABLE payment(
	cstm_id INT PRIMARY KEY,
    cstm_name VARCHAR(50),
    mode VARCHAR(20),
    city VARCHAR(20)
);
INSERT INTO payment
(cstm_id, cstm_name, mode, city)
VALUES
(101, "Olivia Barett" , "Netbanking" ,"Portland"),
(102, "Ethan Sinclair" , "Credit Card" ,"Miami"),
(103, "Maya Hernandez" , "Credit Card" ,"Seattle"),
(104, "Liam Donvon" , "Netbanking" ,"Denver"),
(105, "Sophia Nugyma" , "Credit Card" ,"New Orleans"),
(106, "Caleb Foster" , "Debit Card" ,"Minneapolis"),
(107, "Ava Patel" , "Debit Card" ,"Phoenix"),
(108, "Lucas Carter" , "Netbanking" ,"Boston"),
(109, "Isabella Martinez" , "Netbanking" ,"Nashville"),
(110, "Jackson Brooks" , "Credit Card" ,"Boston");

SELECT mode, COUNT(cstm_name)
FROM payment
GROUP BY mode;