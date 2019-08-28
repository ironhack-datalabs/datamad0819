-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Cars
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Cars
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Cars` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `Cars` ;

-- -----------------------------------------------------
-- Table `Cars`.`Car`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cars`.`Car` (
  `id` INT(11) NOT NULL ,
  `vin` VARCHAR(20) NOT NULL,
  `Manufacturer` VARCHAR(40) NULL DEFAULT NULL,
  `model` VARCHAR(40) NULL DEFAULT NULL,
  `year` INT NULL DEFAULT NULL,
  `color` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Cars`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cars`.`Customer` (
  `id` INT(11) NOT NULL ,
  `customer_id` INT(11) NOT NULL,
  `name` VARCHAR(20) NULL DEFAULT NULL,
  `phone` VARCHAR(20) NULL DEFAULT NULL,
  `email` VARCHAR(20) NULL DEFAULT NULL,
  `address` VARCHAR(100) NULL DEFAULT NULL,
  `city` VARCHAR(40) NULL DEFAULT NULL,
  `state` VARCHAR(20) NULL DEFAULT NULL,
  `country` VARCHAR(20) NULL DEFAULT NULL,
  `postal` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `customer_id` (`customer_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Cars`.`SalesPerson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cars`.`SalesPerson` (
  `id` INT(11) NOT NULL ,
  `staff_id` INT(11) NOT NULL,
  `name` VARCHAR(20) NOT NULL,
  `store` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `staff_id` (`staff_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Cars`.`Invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cars`.`Invoice` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `invoice_number` INT(11) NOT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `salesPerson_` INT(11) NOT NULL,
  `car` INT(11) NOT NULL,
  `customer` INT(11) NOT NULL,
  PRIMARY KEY (`id`, `salesPerson_`, `car`, `customer`),
  UNIQUE INDEX `invoice_number` (`invoice_number` ASC) VISIBLE,
  INDEX `fk_Invoice_SalesPerson_idx` (`salesPerson_` ASC) VISIBLE,
  INDEX `fk_Invoice_Car1_idx` (`car` ASC) VISIBLE,
  INDEX `fk_Invoice_Customer1_idx` (`customer` ASC) VISIBLE,
  CONSTRAINT `fk_Invoice_SalesPerson`
    FOREIGN KEY (`salesPerson_`)
    REFERENCES `Cars`.`SalesPerson` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_Car1`
    FOREIGN KEY (`car`)
    REFERENCES `Cars`.`Car` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_Customer1`
    FOREIGN KEY (`customer`)
    REFERENCES `Cars`.`Customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
