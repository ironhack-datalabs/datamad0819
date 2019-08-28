#CUSTOMER 

UPDATE `mydb`.`customers` SET `CUSTOMER_ID` = '101', `NAME` = 'Manolo', `SURNAME` = 'Garcias', `PHONE` = '669987', `EMAIL` = 'm@g', `ADDRESS` = 'ls', `STATE/PROVINCE` = 'Barcelona', `POSTAL` = '6547' WHERE (`CUSTOMER_ID` = '10001');
UPDATE `mydb`.`customers` SET `CUSTOMER_ID` = '201', `STATE/PROVINCE` = 'Teruel', `POSTAL` = '9845' WHERE (`CUSTOMER_ID` = '20002');
UPDATE `mydb`.`customers` SET `CUSTOMER_ID` = '301', `NAME` = 'Juan', `SURNAME` = 'Perez', `PHONE` = '665522', `EMAIL` = 'j@c', `ADDRESS` = 'lr', `STATE/PROVINCE` = 'Madrid', `COUNTRY` = 'Spain', `POSTAL` = '4789' WHERE (`CUSTOMER_ID` = '30003');

#CARS

UPDATE `mydb`.`cars` SET `MANUFACTURER` = 'Seat', `MODEL` = 'Leon', `YEAR` = '2016', `COLOR` = 'Red' WHERE (`VIN` = '1');
UPDATE `mydb`.`cars` SET `MANUFACTURER` = 'BMW', `MODEL` = '120', `YEAR` = '2017', `COLOR` = 'White' WHERE (`VIN` = '2');
UPDATE `mydb`.`cars` SET `MANUFACTURER` = 'Dacia', `MODEL` = 'Logan', `YEAR` = '2019', `COLOR` = 'Brown' WHERE (`VIN` = '3');
UPDATE `mydb`.`cars` SET `MANUFACTURER` = '', `MODEL` = '', `YEAR` = '', `COLOR` = '' WHERE (`VIN` = '5');
UPDATE `mydb`.`cars` SET `MANUFACTURER` = '', `MODEL` = '', `YEAR` = '', `COLOR` = '' WHERE (`VIN` = '4');

#INVIOCE

UPDATE `mydb`.`invoice` SET `ID` = '4', `NUMBER` = '12', `DATE` = '21-4-2018', `CAR` = '4', `CUSTOMER` = '2', `SALES PERSON` = '1' WHERE (`ID` = '1');
UPDATE `mydb`.`invoice` SET `ID` = '5', `NUMBER` = '20', `DATE` = '13-06-2018', `CAR` = '5', `CUSTOMER` = '1', `SALES PERSON` = '3' WHERE (`ID` = '2');
UPDATE `mydb`.`invoice` SET `ID` = '6', `NUMBER` = '26', `DATE` = '17-05-2017', `CAR` = '6', `CUSTOMER` = '3', `SALES PERSON` = '2' WHERE (`ID` = '3');

#salespersons

UPDATE `mydb`.`salespersons` SET `SALESPERSONS_ID` = '31', `NAME` = 'Miguel', `STORE` = '11' WHERE (`SALESPERSONS_ID` = '1');
UPDATE `mydb`.`salespersons` SET `SALESPERSONS_ID` = '21', `NAME` = 'Jorge', `STORE` = '12' WHERE (`SALESPERSONS_ID` = '2');
UPDATE `mydb`.`salespersons` SET `SALESPERSONS_ID` = '11', `NAME` = 'Ruben', `STORE` = '13' WHERE (`SALESPERSONS_ID` = '3');