#Challenge2
INSERT INTO Car (vin,manufacturer,model,year,color) values ("4K096I98581DHSNUP","Volkswagen","Tiguan",'2019',"Blue");
INSERT INTO Car (vin,manufacturer,model,year,color) values ("17096I98581DHSNUP","Ford","Focus",'2019',"Red");
INSERT INTO Car (vin,manufacturer,model,year,color) values ("22096I98581DHSNUP","Volkswagen","Golf",'2019',"White");
INSERT INTO Car (vin,manufacturer,model,year,color) values ("4K096I98581DHweUP","BMW","S-3",'2019',"Blue");
INSERT INTO Car (vin,manufacturer,model,year,color) values ("4K096I98581DHSNUP","Volkswagen","Tiguan",'2019',"Blue");
INSERT INTO Car (vin,manufacturer,model,year,color) values ("UU096I98581DHSNUP","Dodge","Charger",'2019',"Red");
#Challenge3

INSERT INTO Customer (customerID,name,phone,email,address,city,state_province,country,postal)
VALUES (10001,"Juan","666666666","juan@gmail.com","c/Libertad","Madrid","Madrid","Spain","12003");

INSERT INTO Customer (customerID,name,phone,email,address,city,state_province,country,postal)
VALUES (10002,"Eva","333333333","eva@gmail.com","c/Morera","Madrid","Madrid","Spain","18003");

INSERT INTO Customer (customerID,name,phone,email,address,city,state_province,country,postal)
VALUES (10003,"John","111111111","John@gmail.com","c/Montero","Madrid","Madrid","Spain","00005");

INSERT INTO Customer (customerID,name,phone,email,address,city,state_province,country,postal)
VALUES (10004,"Julia","444444444","julia@gmail.com","c/cruz","Madrid","Madrid","Spain","45789");

INSERT INTO Customer (customerID,name,phone,email,address,city,state_province,country,postal)
VALUES (10005,"Andrés","888888888","Andres@gmail.com","c/Alfarería","Madrid","Madrid","Spain","12365");

INSERT INTO Customer (customerID,name,phone,email,address,city,state_province,country,postal)
VALUES (10006,"Julio","666666666","julio@gmail.com","Botella","Madrid","Madrid","Spain","78964");

INSERT INTO SalesPerson (staffId,name,store) VALUES (101,"Pepe","Madrid");
INSERT INTO SalesPerson (staffId,name,store) VALUES (101,"Antonio","Barcelona");
INSERT INTO SalesPerson (staffId,name,store) VALUES (101,"Rodrigo","Valencia");
INSERT INTO SalesPerson (staffId,name,store) VALUES (101,"Anastasia","Madrid");
INSERT INTO SalesPerson (staffId,name,store) VALUES (101,"Andrea","Barcelona");

INSERT INTO Invoice (`invoiceNumber`, `date`, `idSalesPerson`, `idCar`, `customerId`) VALUES (1232143, '2019-05-10', 1, 2, 3);
INSERT INTO Invoice (`invoiceNumber`, `date`, `idSalesPerson`, `idCar`, `customerId`) VALUES (1232143, '2019-06-11', 2, 3, 3);
INSERT INTO Invoice (`invoiceNumber`, `date`, `idSalesPerson`, `idCar`, `customerId`) VALUES (1232143, '2019-07-22', 3, 1, 2);
INSERT INTO Invoice (`invoiceNumber`, `date`, `idSalesPerson`, `idCar`, `customerId`) VALUES (1232143, '2019-08-14', 4, 4, 1);
INSERT INTO Invoice (`invoiceNumber`, `date`, `idSalesPerson`, `idCar`, `customerId`) VALUES (1232143, '2019-09-22', 5, 2, 5);