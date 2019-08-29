
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lab-mysql
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab-mysql
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab-mysql` DEFAULT CHARACTER SET utf8 ;
USE `lab-mysql` ;

-- -----------------------------------------------------
-- Table `lab-mysql`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-mysql`.`cars` (
  `VIN` INT NOT NULL AUTO_INCREMENT,
  `fabricante` VARCHAR(20) NOT NULL,
  `modelo` VARCHAR(45) NULL,
  `year` DATE NULL,
  `color` VARCHAR(10) NULL,
  PRIMARY KEY (`VIN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab-mysql`.`sales_person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-mysql`.`sales_person` (
  `ID` VARCHAR(10) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `tienda` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab-mysql`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-mysql`.`customers` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `phone` INT(9) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `adress` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `zip` INT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab-mysql`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-mysql`.`invoices` (
  `ID` VARCHAR(10) NOT NULL,
  `date` DATE NULL,
  `coste` FLOAT NOT NULL,
  `cars_VIN` INT NOT NULL,
  `sales_person_ID` VARCHAR(10) NOT NULL,
  `customers_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_invoices_cars1_idx` (`cars_VIN` ASC) VISIBLE,
  INDEX `fk_invoices_sales_person1_idx` (`sales_person_ID` ASC) VISIBLE,
  INDEX `fk_invoices_customers1_idx` (`customers_ID` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_cars1`
    FOREIGN KEY (`cars_VIN`)
    REFERENCES `lab-mysql`.`cars` (`VIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_sales_person1`
    FOREIGN KEY (`sales_person_ID`)
    REFERENCES `lab-mysql`.`sales_person` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_customers1`
    FOREIGN KEY (`customers_ID`)
    REFERENCES `lab-mysql`.`customers` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
