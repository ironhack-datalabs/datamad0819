{\rtf1\ansi\ansicpg1252\cocoartf1504\cocoasubrtf830
{\fonttbl\f0\fswiss\fcharset0 Helvetica;\f1\fnil\fcharset0 Consolas;}
{\colortbl;\red255\green255\blue255;\red27\green31\blue34;\red244\green246\blue249;}
{\*\expandedcolortbl;;\cssrgb\c14118\c16078\c18039;\cssrgb\c96471\c97255\c98039;}
\paperw11900\paperh16840\margl1440\margr1440\vieww23740\viewh21380\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs24 \cf0 \
\pard\pardeftab720\sl380\partightenfactor0

\f1\fs27\fsmilli13600 \cf2 \cb3 \expnd0\expndtw0\kerning0
CREATE SCHEMA IF NOT EXISTS `lab_mysql` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;\
USE `lab_mysql`;\
\
\

    
-- -----------------------------------------------------\
-- Table `lab_mysql`.`SALESPERSON`\
-- -----------------------------------------------------\
CREATE TABLE IF NOT EXISTS `lab_mysql`.`SALESPERSON` (\
  `SALESPERSON_id` INT NOT NULL,\
  `Name` VARCHAR(45) NOT NULL,\
  `Phone` VARCHAR(45) NULL,\
  `Store` VARCHAR(45) NOT NULL,\
  PRIMARY KEY (`SALESPERSON_id`))\
ENGINE = InnoDB;\
\
\
-- -----------------------------------------------------\
-- Table `lab_mysql`.`CUSTOMER`\
-- -----------------------------------------------------\
CREATE TABLE IF NOT EXISTS `lab_mysql`.`CUSTOMER` (\
  `CUSTOMER_id` INT NOT NULL,\
  `Name` VARCHAR(45) NOT NULL,\
  `Email` VARCHAR(45) NOT NULL,\
  `Phone` INT NULL,\
  `City` VARCHAR(45) NOT NULL,\
  `Country` VARCHAR(45) NOT NULL,\
  `ZIP_Code` INT NULL,\
  `SALESPERSON_SALESPERSON_id` INT NOT NULL,\
  PRIMARY KEY (`CUSTOMER_id`, `SALESPERSON_SALESPERSON_id`),\
  INDEX `fk_CUSTOMER_SALESPERSON_idx` (`SALESPERSON_SALESPERSON_id` ASC),\
  CONSTRAINT `fk_CUSTOMER_SALESPERSON`\
    FOREIGN KEY (`SALESPERSON_SALESPERSON_id`)\
    REFERENCES `mydb`.`SALESPERSON` (`SALESPERSON_id`)\
    ON DELETE NO ACTION\
    ON UPDATE NO ACTION)\
ENGINE = InnoDB;\
\
\
-- -----------------------------------------------------\
-- Table `lab_mysql`.`CAR`\
-- -----------------------------------------------------\
CREATE TABLE IF NOT EXISTS `lab_mysql`.`CAR` (\
  `CAR_id` INT NOT NULL,\
  `VIN` INT NOT NULL,\
  `Colour` VARCHAR(45) NULL,\
  `Model` VARCHAR(45) NOT NULL,\
  `Year` INT NULL,\
  `Manufacturer` VARCHAR(45) NOT NULL,\
  `CUSTOMER_CUSTOMER_id` INT NOT NULL,\
  PRIMARY KEY (`CAR_id`, `CUSTOMER_CUSTOMER_id`),\
  INDEX `fk_CAR_CUSTOMER1_idx` (`CUSTOMER_CUSTOMER_id` ASC),\
  CONSTRAINT `fk_CAR_CUSTOMER1`\
    FOREIGN KEY (`CUSTOMER_CUSTOMER_id`)\
    REFERENCES `mydb`.`CUSTOMER` (`CUSTOMER_id`)\
    ON DELETE NO ACTION\
    ON UPDATE NO ACTION)\
ENGINE = InnoDB;\
\
\
-- -----------------------------------------------------\
-- Table `lab_mysql`.`INVOICE`\
-- -----------------------------------------------------\
CREATE TABLE IF NOT EXISTS `lab_mysql`.`INVOICE` (\
  `INVOICE_id` INT NOT NULL,\
  `Invoice_num` INT,\
  `Date` DATETIME NULL,\
  `SALESPERSON_SALESPERSON_id` INT,\
  `CAR_CAR_id` INT,\
  `CAR_CUSTOMER_CUSTOMER_id` INT,\
  PRIMARY KEY (`INVOICE_id`),\
  INDEX `fk_INVOICE_SALESPERSON1_idx` (`SALESPERSON_SALESPERSON_id` ASC),\
  INDEX `fk_INVOICE_CAR1_idx` (`CAR_CAR_id` ASC, `CAR_CUSTOMER_CUSTOMER_id` ASC),\
  CONSTRAINT `fk_INVOICE_SALESPERSON1`\
    FOREIGN KEY (`SALESPERSON_SALESPERSON_id`)\
    REFERENCES `lab_mysql`.`SALESPERSON` (`SALESPERSON_id`)\
    ON DELETE NO ACTION\
    ON UPDATE NO ACTION,\
  CONSTRAINT `fk_INVOICE_CAR1`\
    FOREIGN KEY (`CAR_CAR_id` , `CAR_CUSTOMER_CUSTOMER_id`)\
    REFERENCES `lab_mysql`.`CAR` (`CAR_id` , `CUSTOMER_CUSTOMER_id`)\
    ON DELETE NO ACTION\
    ON UPDATE NO ACTION)\
ENGINE = InnoDB;\
\
\
SET SQL_MODE=@OLD_SQL_MODE;\
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;\
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;}