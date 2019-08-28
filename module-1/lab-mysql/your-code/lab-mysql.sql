#lab-mysql

- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`CARS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CARS` (
  `id` INT NOT NULL,
  `VIN` VARCHAR(45) NULL,
  `Manufacturer` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `Year` VARCHAR(45) NULL,
  `Color` VARCHAR(45) NULL,
  `Salespersons_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Salespersons_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Salespersons` (
  `id` INT NOT NULL,
  `Staff ID` VARCHAR(45) NULL,
  `Name` VARCHAR(45) NULL,
  `Store` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CUSTOMERS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CUSTOMERS` (
  `id` INT NOT NULL,
  `Customer ID` VARCHAR(45) NULL,
  `Name` VARCHAR(45) NULL,
  `Phone` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `Postal` VARCHAR(45) NULL,
  `Salespersons_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Salespersons_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`INVIOCES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`INVIOCES` (
  `id` INT NOT NULL,
  `Invioces Number` VARCHAR(45) NULL,
  `Date` VARCHAR(45) NULL,
  `Car` VARCHAR(45) NULL,
  `Customer` VARCHAR(45) NULL,
  `Sales Person` VARCHAR(45) NULL,
  `Salespersons_id` INT NOT NULL,
  `CUSTOMERS_id` INT NOT NULL,
  `CUSTOMERS_Salespersons_id` INT NOT NULL,
  `CARS_id` INT NOT NULL,
  `CARS_Salespersons_id` INT NOT NULL,
  PRIMARY KEY (`id`, `Salespersons_id`, `CUSTOMERS_id`, `CUSTOMERS_Salespersons_id`, `CARS_id`, `CARS_Salespersons_id`),
  INDEX `fk_INVIOCES_Salespersons1_idx` (`Salespersons_id` ASC) VISIBLE,
  INDEX `fk_INVIOCES_CUSTOMERS1_idx` (`CUSTOMERS_id` ASC, `CUSTOMERS_Salespersons_id` ASC) VISIBLE,
  INDEX `fk_INVIOCES_CARS1_idx` (`CARS_id` ASC, `CARS_Salespersons_id` ASC) VISIBLE,
  CONSTRAINT `fk_INVIOCES_Salespersons1`
    FOREIGN KEY (`Salespersons_id`)
    REFERENCES `mydb`.`Salespersons` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_INVIOCES_CUSTOMERS1`
    FOREIGN KEY (`CUSTOMERS_id` , `CUSTOMERS_Salespersons_id`)
    REFERENCES `mydb`.`CUSTOMERS` (`id` , `Salespersons_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_INVIOCES_CARS1`
    FOREIGN KEY (`CARS_id` , `CARS_Salespersons_id`)
    REFERENCES `mydb`.`CARS` (`id` , `Salespersons_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
