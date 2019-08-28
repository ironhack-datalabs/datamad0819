-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cars_shop_1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cars_shop_1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cars_shop_1` DEFAULT CHARACTER SET utf8 ;
USE `cars_shop_1` ;

-- -----------------------------------------------------
-- Table `cars_shop_1`.`Salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_shop_1`.`Salespersons` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Store` VARCHAR(45) NOT NULL,
  `Staff ID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cars_shop_1`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_shop_1`.`Customers` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Phone` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `State/province` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  `Postal` VARCHAR(45) NULL,
  `Customer ID` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cars_shop_1`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_shop_1`.`Invoices` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Date` DATE NOT NULL,
  `Car_Car_id` INT NOT NULL,
  `Salesperson_Sal_id` INT NOT NULL,
  `Customers_Cus_id` INT NOT NULL,
  `Invoice Number` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID`, `Customers_Cus_id`, `Salesperson_Sal_id`, `Car_Car_id`),
  INDEX `fk_Invoices_Salesperson1_idx` (`Salesperson_Sal_id` ASC) VISIBLE,
  INDEX `fk_Invoices_Customers1_idx` (`Customers_Cus_id` ASC) VISIBLE,
  CONSTRAINT `fk_Invoices_Salesperson1`
    FOREIGN KEY (`Salesperson_Sal_id`)
    REFERENCES `cars_shop_1`.`Salespersons` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Customers1`
    FOREIGN KEY (`Customers_Cus_id`)
    REFERENCES `cars_shop_1`.`Customers` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cars_shop_1`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars_shop_1`.`Cars` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `VIN` VARCHAR(45) NOT NULL,
  `Manufacturer` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `Year` YEAR NULL,
  `Color` VARCHAR(45) NULL,
  `Invoices_Invo_id` INT NULL,
  `Invoices_Customers_Cus_id` INT NULL,
  `Invoices_Salesperson_Sal_id` INT NULL,
  `Invoices_Car_Car_id` INT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Car_Invoices1_idx` (`Invoices_Invo_id` ASC, `Invoices_Customers_Cus_id` ASC, `Invoices_Salesperson_Sal_id` ASC, `Invoices_Car_Car_id` ASC) VISIBLE,
  CONSTRAINT `fk_Car_Invoices1`
    FOREIGN KEY (`Invoices_Invo_id` , `Invoices_Customers_Cus_id` , `Invoices_Salesperson_Sal_id` , `Invoices_Car_Car_id`)
    REFERENCES `cars_shop_1`.`Invoices` (`ID` , `Customers_Cus_id` , `Salesperson_Sal_id` , `Car_Car_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

