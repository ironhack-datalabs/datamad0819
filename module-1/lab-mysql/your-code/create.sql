SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema carDealership
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `carDealership` DEFAULT CHARACTER SET utf8 ;
USE `carDealership` ;

-- -----------------------------------------------------
-- Table `carDealership`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `carDealership`.`Cars` (
  `ID` INT NOT NULL,
  `VIN` VARCHAR(45) NOT NULL,
  `Manufacturer` VARCHAR(45) NOT NULL,
  `Model` VARCHAR(45) NOT NULL,
  `Year` YEAR NOT NULL,
  `Color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `carDealership`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `carDealership`.`Customers` (
  `ID` INT NOT NULL,
  `Customer ID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Phone` VARCHAR(45) NOT NULL,
  `Email` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NOT NULL,
  `City` VARCHAR(45) NOT NULL,
  `State/Province` VARCHAR(45) NOT NULL,
  `Country` VARCHAR(45) NOT NULL,
  `Postal` INT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `carDealership`.`Salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `carDealership`.`Salespersons` (
  `ID` INT NOT NULL,
  `Staff ID` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Store` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `carDealership`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `carDealership`.`Invoices` (
  `ID` INT NOT NULL,
  `Invoice Number` INT NOT NULL,
  `Date` DATE NOT NULL,
  `Cars_ID` INT NOT NULL,
  `Customers_ID` INT NOT NULL,
  `Salespersons_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `Cars_ID`, `Customers_ID`, `Salespersons_ID`),
  INDEX `fk_Invoices_Cars_idx` (`Cars_ID` ASC),
  INDEX `fk_Invoices_Customers1_idx` (`Customers_ID` ASC),
  INDEX `fk_Invoices_Salespersons1_idx` (`Salespersons_ID` ASC),
  CONSTRAINT `fk_Invoices_Cars`
    FOREIGN KEY (`Cars_ID`)
    REFERENCES `carDealership`.`Cars` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Customers1`
    FOREIGN KEY (`Customers_ID`)
    REFERENCES `carDealership`.`Customers` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Salespersons1`
    FOREIGN KEY (`Salespersons_ID`)
    REFERENCES `carDealership`.`Salespersons` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
