-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab_mysql` DEFAULT CHARACTER SET utf8 ;
USE `lab_mysql` ;

-- -----------------------------------------------------
-- Table `mydb`.`Car`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Car` (
  `idCar` INT NOT NULL AUTO_INCREMENT,
  `vin` VARCHAR(17) NOT NULL,
  `manufacturer` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `year` VARCHAR(45) NULL,
  `color` VARCHAR(45) NULL,
  PRIMARY KEY (`idCar`))
ENGINE = InnoDB
AUTO_INCREMENT = 0
PACK_KEYS = DEFAULT;


-- -----------------------------------------------------
-- Table `mydb`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Customer` (
  `idCustomer` INT NOT NULL AUTO_INCREMENT,
  `customerID` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state_province` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `postal` VARCHAR(45) NULL,
  PRIMARY KEY (`idCustomer`))
ENGINE = InnoDB
AUTO_INCREMENT = 0;


-- -----------------------------------------------------
-- Table `mydb`.`SalesPerson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`SalesPerson` (
  `idSalesPerson` INT NOT NULL AUTO_INCREMENT,
  `invoiceNumber` INT(11) NOT NULL,
  `name` VARCHAR(45) NULL,
  `store` VARCHAR(45) NULL,
  PRIMARY KEY (`idSalesPerson`))
ENGINE = InnoDB
AUTO_INCREMENT = 0;


-- -----------------------------------------------------
-- Table `mydb`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`invoice` (
  `idinvoice` INT NOT NULL AUTO_INCREMENT,
  `invoiceNumber` BIGINT(20) NOT NULL,
  `date` DATE NULL,
  `idSalesPerson` INT NOT NULL,
  `idCar` INT NOT NULL,
  `customerId` INT NOT NULL,
  PRIMARY KEY (`idinvoice`, `idSalesPerson`, `idCar`, `customerId`),
  INDEX `fk_invoice_SalesPerson_idx` (`idSalesPerson` ASC),
  INDEX `fk_invoice_Car1_idx` (`idCar` ASC),
  INDEX `fk_invoice_Customer1_idx` (`customerId` ASC),
  CONSTRAINT `fk_invoice_SalesPerson`
    FOREIGN KEY (`idSalesPerson`)
    REFERENCES `mydb`.`SalesPerson` (`idSalesPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoice_Car1`
    FOREIGN KEY (`idCar`)
    REFERENCES `mydb`.`Car` (`idCar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoice_Customer1`
    FOREIGN KEY (`customerId`)
    REFERENCES `mydb`.`Customer` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 0;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;