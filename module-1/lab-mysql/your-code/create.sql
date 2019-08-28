-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lab_mysql
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab_mysql
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab_mysql` DEFAULT CHARACTER SET utf8 ;
USE `lab_mysql` ;

-- -----------------------------------------------------
-- Table `lab_mysql`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Cars` (
  `car_VIN` INT NOT NULL,
  `manufacturer` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `year` DATE NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`car_VIN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `phone number` INT(10) NOT NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `province` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `zip` INT(6) NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`Salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Salesperson` (
  `staff_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `store` VARCHAR(45) NULL,
  PRIMARY KEY (`staff_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Invoices` (
  `invoice_id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `Cars_car_VIN` INT NOT NULL,
  `Customers_customer_id` INT NOT NULL,
  PRIMARY KEY (`invoice_id`),
  INDEX `fk_Invoices_Cars_idx` (`Cars_car_VIN` ASC) VISIBLE,
  INDEX `fk_Invoices_Customers1_idx` (`Customers_customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_Invoices_Cars`
    FOREIGN KEY (`Cars_car_VIN`)
    REFERENCES `lab_mysql`.`Cars` (`car_VIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Customers1`
    FOREIGN KEY (`Customers_customer_id`)
    REFERENCES `lab_mysql`.`Customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`Sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Sales` (
  `Invoices_invoice_id` INT NOT NULL,
  `Salesperson_staff_id` INT NOT NULL,
  PRIMARY KEY (`Invoices_invoice_id`, `Salesperson_staff_id`),
  INDEX `fk_Invoices_has_Salesperson_Salesperson1_idx` (`Salesperson_staff_id` ASC) VISIBLE,
  INDEX `fk_Invoices_has_Salesperson_Invoices1_idx` (`Invoices_invoice_id` ASC) VISIBLE,
  CONSTRAINT `fk_Invoices_has_Salesperson_Invoices1`
    FOREIGN KEY (`Invoices_invoice_id`)
    REFERENCES `lab_mysql`.`Invoices` (`invoice_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_has_Salesperson_Salesperson1`
    FOREIGN KEY (`Salesperson_staff_id`)
    REFERENCES `lab_mysql`.`Salesperson` (`staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
