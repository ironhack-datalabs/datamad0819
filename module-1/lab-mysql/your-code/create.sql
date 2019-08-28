# Challenge 1 and 2

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_fCHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema car_company
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `car_company` DEFAULT CHARACTER SET utf8 ;
USE `car_company` ;

-- -----------------------------------------------------
-- Table `car_company`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_company`.`customer` (
    `customer_id` INT NOT NULL,
    `name` VARCHAR(45) NOT NULL,
    `phone` VARCHAR(45) NULL,
    `email` VARCHAR(45) NULL,
    `address` VARCHAR(45) NULL,
    `city` VARCHAR(45) NULL,
    `state_province` VARCHAR(45) NULL,
    `country` VARCHAR(45) NULL,
    `postal` INT NULL,
    PRIMARY KEY (`customer_id`)
)  ENGINE=INNODB;

-- -----------------------------------------------------
-- Table `car_company`.`salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_company`.`salesperson` (
    `staff_id` INT NOT NULL,
    `name` VARCHAR(45) NOT NULL,
    `store` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`staff_id`)
)  ENGINE=INNODB;

-- -----------------------------------------------------
-- Table `car_company`.`car`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_company`.`car` (
    `car_id` INT NOT NULL,
    `VIN` VARCHAR(20) NOT NULL,
    `manufacturer` VARCHAR(45) NOT NULL,
    `model` VARCHAR(45) NOT NULL,
    `year` INT NOT NULL,
    `color` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`car_id`)
)  ENGINE=INNODB;

-- -----------------------------------------------------
-- Table `car_company`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `car_company`.`invoice` (
  `invoice_id` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `car` INT NOT NULL,
  `customer` INT NOT NULL,
  `salesperson` INT NOT NULL,
  PRIMARY KEY (`invoice_id`),
  INDEX `fk_invoices_customers_idx` (`customer` ASC) VISIBLE,
  INDEX `fk_invoices_salespersons1_idx` (`salesperson` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_customers`
    FOREIGN KEY (`customer`)
    REFERENCES `car_company`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_salespersons1`
    FOREIGN KEY (`salesperson`)
    REFERENCES `car_company`.`salesperson` (`staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_cars`
    FOREIGN KEY (`car`)
    REFERENCES `car_company`.`car` (`car_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
