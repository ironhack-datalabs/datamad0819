-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lab-mysql2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab-mysql2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab-mysql2` DEFAULT CHARACTER SET utf8 ;
USE `lab-mysql2` ;

-- -----------------------------------------------------
-- Table `lab-mysql2`.`salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-mysql2`.`salespersons` (
  `idsalespersons` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `store` VARCHAR(45) NULL,
  PRIMARY KEY (`idsalespersons`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab-mysql2`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-mysql2`.`customers` (
  `idcustomers` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `phone_number` INT NULL,
  `email` VARCHAR(45) NULL,
  `adress` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `province` VARCHAR(45) NULL,
  `customerscol` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `zip_customer` INT NULL,
  `salespersons_idsalespersons` INT NULL,
  PRIMARY KEY (`idcustomers`),
  INDEX `fk_customers_salespersons1_idx` (`salespersons_idsalespersons` ASC) VISIBLE,
  CONSTRAINT `fk_customers_salespersons1`
    FOREIGN KEY (`salespersons_idsalespersons`)
    REFERENCES `lab-mysql2`.`salespersons` (`idsalespersons`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab-mysql2`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-mysql2`.`invoices` (
  `idinvoices` INT NOT NULL,
  `date` DATE NULL,
  `car` VARCHAR(45) NULL,
  `customer` VARCHAR(45) NULL,
  `salesperson` VARCHAR(45) NULL,
  `salespersons_idsalespersons` INT NOT NULL,
  `customers_idcustomers` INT NOT NULL,
  PRIMARY KEY (`idinvoices`),
  INDEX `fk_invoices_salespersons1_idx` (`salespersons_idsalespersons` ASC) VISIBLE,
  INDEX `fk_invoices_customers1_idx` (`customers_idcustomers` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_salespersons1`
    FOREIGN KEY (`salespersons_idsalespersons`)
    REFERENCES `lab-mysql2`.`salespersons` (`idsalespersons`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_customers1`
    FOREIGN KEY (`customers_idcustomers`)
    REFERENCES `lab-mysql2`.`customers` (`idcustomers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab-mysql2`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab-mysql2`.`cars` (
  `idCars` INT NOT NULL,
  `manufacturer` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `year` DATE NULL,
  `color` VARCHAR(45) NULL,
  `salespersons_idsalespersons` INT NOT NULL,
  `customers_idcustomers` INT NOT NULL,
  `invoices_idinvoices` INT NOT NULL,
  PRIMARY KEY (`idCars`),
  INDEX `fk_cars_salespersons_idx` (`salespersons_idsalespersons` ASC) VISIBLE,
  INDEX `fk_cars_customers1_idx` (`customers_idcustomers` ASC) VISIBLE,
  INDEX `fk_cars_invoices1_idx` (`invoices_idinvoices` ASC) VISIBLE,
  CONSTRAINT `fk_cars_salespersons`
    FOREIGN KEY (`salespersons_idsalespersons`)
    REFERENCES `lab-mysql2`.`salespersons` (`idsalespersons`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cars_customers1`
    FOREIGN KEY (`customers_idcustomers`)
    REFERENCES `lab-mysql2`.`customers` (`idcustomers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cars_invoices1`
    FOREIGN KEY (`invoices_idinvoices`)
    REFERENCES `lab-mysql2`.`invoices` (`idinvoices`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;