
# SET GLOBAL sql_mode = 'NO_AUTO_VALUE_ON_ZERO';
# SET SESSION sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP DATABASE IF EXISTS lab_mysql;

CREATE DATABASE lab_mysql;

USE lab_mysql;

#creation table car

DROP TABLE IF EXISTS `car`;
CREATE TABLE `car`(
    `id` int not null AUTO_INCREMENT,
    `vin` varchar(45),
    `manufacturer` varchar(45),
    `model` varchar(45),
    `year` varchar(45),
    `color` varchar(45),
    PRIMARY KEY (id)
);

ALTER TABLE `car` AUTO_INCREMENT=0;

#creation table customer

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`(
    `id` int not null AUTO_INCREMENT,
    `customer_id` int not null UNIQUE,
    `name` varchar(45),
    `phone_number` varchar(45),
    `email` varchar(45),
    `address` varchar(45),
    `city` varchar(45),
    `state/province` varchar(45),
    `country` varchar(45),
    `zip/postal` varchar(45),
    PRIMARY KEY (id)
);

ALTER TABLE `customer` AUTO_INCREMENT=0;

#creation table saleperson

DROP TABLE IF EXISTS `salesperson`;
CREATE TABLE `salesperson`(
    `id` int not null AUTO_INCREMENT,
    `staff_id` int not null UNIQUE,
    `name` varchar(45),
    `store` varchar(45), 
    PRIMARY KEY (id)
);

ALTER TABLE `salesperson` AUTO_INCREMENT=0;

#creation table invoice 

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice`(
    `id` int not null AUTO_INCREMENT,
    `invoice_number` int not null UNIQUE,
    `date` DATE,
    `car` int, 
    `customer` int,
    `sales_person` int,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`car`) REFERENCES `car`(id),
    FOREIGN KEY (`customer`) REFERENCES `customer`(id),
    FOREIGN KEY (`sales_person`) REFERENCES `salesperson`(id)
);

ALTER TABLE `invoice` AUTO_INCREMENT=0;