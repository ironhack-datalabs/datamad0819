USE labmysql;

# Create Cars table
CREATE TABLE IF NOT EXISTS `labmysql`.`cars` (
  `ID` INT UNSIGNED NOT NULL,
  `VIN` VARCHAR(35) NOT NULL,
  `Manufacturer` TINYTEXT NULL,
  `Model` TINYTEXT NULL,
  `Year` YEAR(4) NULL,
  `Color` TINYTEXT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;

#Create Customers table
CREATE TABLE IF NOT EXISTS `labmysql`.`customers` (
  `ID` INT UNSIGNED NOT NULL,
  `Customer ID` INT UNSIGNED NOT NULL,
  `Name` MEDIUMTEXT NOT NULL,
  `Phone` MEDIUMTEXT NULL,
  `Email` MEDIUMTEXT NULL,
  `Address` MEDIUMTEXT NULL,
  `City` MEDIUMTEXT NULL,
  `State/Province` MEDIUMTEXT NULL,
  `Country` MEDIUMTEXT NULL,
  `Postal` MEDIUMTEXT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `customer_id_UNIQUE` (`Customer ID` ASC) VISIBLE)
ENGINE = InnoDB;

#Create salespersons table
CREATE TABLE IF NOT EXISTS `labmysql`.`salespersons` (
  `ID` INT UNSIGNED NOT NULL,
  `Staff ID` INT UNSIGNED NOT NULL,
  `Name` MEDIUMTEXT NULL,
  `Store` MEDIUMTEXT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `staff_id_UNIQUE` (`Staff ID` ASC) VISIBLE)
ENGINE = InnoDB;

#Create Invoices table
CREATE TABLE IF NOT EXISTS `labmysql`.`invoices` (
  `ID` INT UNSIGNED NOT NULL,
  `Invoice Number` INT,
  `Date` DATE NULL,
  `Car` INT UNSIGNED NOT NULL,
  `Customer` INT UNSIGNED NOT NULL,
  `Sales Person` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `invoice_number_UNIQUE` (`Invoice Number` ASC) VISIBLE,
  INDEX `fk_invoices_cars_idx` (`Car` ASC) VISIBLE,
  INDEX `fk_invoices_customers_idx` (`Customer` ASC) VISIBLE,
  INDEX `fk_invoices_staff_idx` (`Sales Person` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_cars`
    FOREIGN KEY (`Car`)
    REFERENCES `labmysql`.`cars` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_customers`
    FOREIGN KEY (`Customer`)
    REFERENCES `labmysql`.`customers` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_staff`
    FOREIGN KEY (`Sales Person`)
    REFERENCES `labmysql`.`salespersons` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
