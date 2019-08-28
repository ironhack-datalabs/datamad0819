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
  `id` INT NOT NULL AUTO_INCREMENT,
  `car_VIN` VARCHAR(45) NOT NULL,
  `manufacturer` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `year` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Customers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `phone number` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `province` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `zip` INT(6) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`Salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Salesperson` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `staff_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `store` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Invoices` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `invoice_number` INT NOT NULL,
  `date` VARCHAR(45) NOT NULL,
  `Cars_id` INT NOT NULL,
  `Customers_id` INT NOT NULL,
  `Salesperson_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Invoices_Cars1_idx` (`Cars_id` ASC) VISIBLE,
  INDEX `fk_Invoices_Customers1_idx` (`Customers_id` ASC) VISIBLE,
  INDEX `fk_Invoices_Salesperson1_idx` (`Salesperson_id` ASC) VISIBLE,
  CONSTRAINT `fk_Invoices_Cars1`
    FOREIGN KEY (`Cars_id`)
    REFERENCES `lab_mysql`.`Cars` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Customers1`
    FOREIGN KEY (`Customers_id`)
    REFERENCES `lab_mysql`.`Customers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Salesperson1`
    FOREIGN KEY (`Salesperson_id`)
    REFERENCES `lab_mysql`.`Salesperson` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
