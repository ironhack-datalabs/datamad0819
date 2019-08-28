#creation table car

DROP TABLE IF EXISTS `car`;
CREATE TABLE `car`(
    `id` int not null AUTO_INCREMENT,
    `vin` varchar(45) UNIQUE,
    `manufacturer` varchar(45),
    `model` varchar(45),
    `year` varchar(45),
    `color` varchar(45),
    PRIMARY KEY (id)
);

#creation table customer

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`(
    `id` int not null AUTO_INCREMENT,
    `customer_id` int UNIQUE,
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

#creation table saleperson

DROP TABLE IF EXISTS `saleperson`;
CREATE TABLE `saleperson`(
    `id` int not null AUTO_INCREMENT,
    `staff_id` int not null UNIQUE,
    `name` varchar(45),
    `store` varchar(45), 
    PRIMARY KEY (id)
);

#creation table invoice 

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice`(
    `id` int not null AUTO_INCREMENT,
    `invoice_number` int not null UNIQUE,
    `date` varchar(45),
    `car` int, 
    `customer` int,
    `sales_person` int,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`car`) 
        REFERENCES `car`(`id`),
    FOREIGN KEY (`customer`) 
        REFERENCES `customer`(`id`),
    FOREIGN KEY (`sales_person`)
        REFERENCES `saleperson`(`id`)
);