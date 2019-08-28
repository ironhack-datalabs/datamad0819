
CREATE DATABASE IF NOT EXISTS `lab_mysql` DEFAULT CHARACTER SET utf8 ;
USE `lab_mysql` ;

-- -----------------------------------------------------
-- Table `mydb`.`Car`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Car` (
  `idCar` INT AUTO_INCREMENT ,
  `vin` VARCHAR(17) NOT NULL,
  `manufacturer` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `year` VARCHAR(45) NULL,
  `color` VARCHAR(45) NULL,
  PRIMARY KEY (`idCar`));




-- -----------------------------------------------------
-- Table `mydb`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Customer` (
  `idCustomer` INT AUTO_INCREMENT,
  `customerID` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `phone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state_province` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `postal` VARCHAR(45) NULL,
  PRIMARY KEY (`idCustomer`));




-- -----------------------------------------------------
-- Table `mydb`.`SalesPerson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`SalesPerson` (
  `idSalesPerson` INT AUTO_INCREMENT,
  `staffId` INT(11) NOT NULL,
  `name` VARCHAR(45) NULL,
  `store` VARCHAR(45) NULL,
  PRIMARY KEY (`idSalesPerson`));




-- -----------------------------------------------------
-- Table `mydb`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Invoice` (
  `idinvoice` INT AUTO_INCREMENT,
  `invoiceNumber` BIGINT(20) NOT NULL,
  `date` DATE NULL,
  `idSalesPerson` INT NOT NULL,
  `idCar` INT NOT NULL,
  `customerId` INT NOT NULL,
  PRIMARY KEY (`idinvoice`),
  
  CONSTRAINT `fk_invoice_SalesPerson`
    FOREIGN KEY (`idSalesPerson`)
    REFERENCES `lab_mysql`.`SalesPerson` (`idSalesPerson`),
   
  CONSTRAINT `fk_invoice_Car1`
    FOREIGN KEY (`idCar`)
    REFERENCES `lab_mysql`.`Car` (`idCar`),
   
  CONSTRAINT `fk_invoice_Customer1`
    FOREIGN KEY (`customerId`)
    REFERENCES `lab_mysql`.`Customer` (`idCustomer`));
   








