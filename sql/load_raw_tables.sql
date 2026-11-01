-----------------------------------------------------------------
-- Multi-Channel Marketing Attribution (Data Analysis Project)
-----------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS novacart_staging;
USE novacart_staging;

DROP TABLE IF EXISTS customers_raw;
CREATE TABLE customers_raw (
    customer_id          VARCHAR(20),
    customer_name        VARCHAR(100),
    email                VARCHAR(150),
    signup_date_raw       VARCHAR(20),
    acquisition_channel  VARCHAR(50),
    city                 VARCHAR(50)
);

DROP TABLE IF EXISTS orders_raw;
CREATE TABLE orders_raw (
    order_id         VARCHAR(20),
    customer_id      VARCHAR(20),
    order_date_raw    VARCHAR(20),
    order_amount_raw  VARCHAR(30)
);

DROP TABLE IF EXISTS marketing_spend_raw;
CREATE TABLE marketing_spend_raw (
    month_raw          VARCHAR(20),
    channel           VARCHAR(50),
    spend_amount_raw   VARCHAR(30)
);

-----------------------------------------------------------------
-- Loading the Data 
-----------------------------------------------------------------


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/novacart_dataset/customers.csv'
INTO TABLE customers_raw
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(customer_id, customer_name, email, signup_date_raw, acquisition_channel, city);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/novacart_dataset/orders.csv'
INTO TABLE orders_raw
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(order_id, customer_id, order_date_raw, order_amount_raw);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/novacart_dataset/marketing_spend.csv'
INTO TABLE marketing_spend_raw
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(month_raw, channel, spend_amount_raw);

--------------------------------------------------
-- Checking weather the dataset loaded ?
--------------------------------------------------

select * from customers_raw;
select * from marketing_spend_raw;
select * from orders_raw;
