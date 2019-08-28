-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Dealership
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Dealership
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Dealership` DEFAULT CHARACTER SET utf8 ;
USE `Dealership` ;

-- -----------------------------------------------------
-- Table `Dealership`.`Cars`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Dealership`.`Cars` ;

CREATE TABLE IF NOT EXISTS `Dealership`.`Cars` (
  `idCars` INT(11) NOT NULL AUTO_INCREMENT,
  `VIN` VARCHAR(45) NOT NULL,
  `Manufacturer` VARCHAR(45) NOT NULL,
  `Model` VARCHAR(45) NOT NULL,
  `Year` INT(11) NOT NULL,
  `Color` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idCars`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Dealership`.`Customers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Dealership`.`Customers` ;

CREATE TABLE IF NOT EXISTS `Dealership`.`Customers` (
  `idCustomers` INT(11) NOT NULL AUTO_INCREMENT,
  `Customers ID` INT(11) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Phone` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NULL DEFAULT NULL,
  `Address` VARCHAR(45) NULL DEFAULT NULL,
  `City` VARCHAR(45) NULL DEFAULT NULL,
  `State/Province` VARCHAR(45) NULL DEFAULT NULL,
  `Country` VARCHAR(45) NULL DEFAULT NULL,
  `Postal` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idCustomers`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Dealership`.`Salespersons`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Dealership`.`Salespersons` ;

CREATE TABLE IF NOT EXISTS `Dealership`.`Salespersons` (
  `idSalespersons` INT(11) NOT NULL AUTO_INCREMENT,
  `Staff ID` INT(11) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Store` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSalespersons`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `Dealership`.`Invoices`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Dealership`.`Invoices` ;

CREATE TABLE IF NOT EXISTS `Dealership`.`Invoices` (
  `idInvoices` INT(11) NOT NULL AUTO_INCREMENT,
  `Invoice Number` INT(11) NOT NULL,
  `Date` VARCHAR(45) NOT NULL,
  `Sales Persons` INT(11) NOT NULL,
  `Cars` INT(11) NOT NULL,
  `Customers` INT(11) NOT NULL,
  PRIMARY KEY (`idInvoices`),
  INDEX `fk_Invoices_Salespersons_idx` (`Sales Persons` ASC),
  INDEX `fk_Invoices_Cars1_idx` (`Cars` ASC),
  INDEX `fk_Invoices_Customers1_idx` (`Customers` ASC),
  CONSTRAINT `fk_Invoices_Cars1`
    FOREIGN KEY (`Cars`)
    REFERENCES `Dealership`.`Cars` (`idCars`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Customers1`
    FOREIGN KEY (`Customers`)
    REFERENCES `Dealership`.`Customers` (`idCustomers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Salespersons`
    FOREIGN KEY (`Sales Persons`)
    REFERENCES `Dealership`.`Salespersons` (`idSalespersons`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
