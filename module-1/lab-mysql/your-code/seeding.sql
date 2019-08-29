USE labmysql;
#seeding cars table
INSERT INTO cars(`ID`,`VIN`,`Manufacturer`,`Model`,`Year`,`Color`) VALUES('0','3K096I98581DHSNUP','Volkswagen','Tiguan','2019','Blue');
INSERT INTO cars(`ID`,`VIN`,`Manufacturer`,`Model`,`Year`,`Color`) VALUES('1','ZM8G7BEUQZ97IH46V','Peugeot','Rifter','2019','Red');
INSERT INTO cars(`ID`,`VIN`,`Manufacturer`,`Model`,`Year`,`Color`) VALUES('2','RKXVNNIHLVVZOUB4M','Ford','Fusion','2018','White');
INSERT INTO cars(`ID`,`VIN`,`Manufacturer`,`Model`,`Year`,`Color`) VALUES('3','HKNDGS7CU31E9Z7JW','Toyota','RAV4','2018','Silver');
INSERT INTO cars(`ID`,`VIN`,`Manufacturer`,`Model`,`Year`,`Color`) VALUES('4','DAM41UDN3CHU2WVF6','Volvo','V60','2019','Gray');
INSERT INTO cars(`ID`,`VIN`,`Manufacturer`,`Model`,`Year`,`Color`) VALUES('5','DAM41UDN3CHU2WVF6','Volvo','V60 Cross Country','2019','Gray');

#carscarsseeding customers table
INSERT INTO customers (`ID`,`Customer ID`,`Name`,`Phone`,`Email`,`Address`,`City`,`State/Province`,`Country`,`Postal`) VALUES("0","10001","Pablo Picasso","+34 636 17 63 82","-","Paseo de la Chopera, 14","Madrid","Madrid","Spain","28045");
INSERT INTO customers (`ID`,`Customer ID`,`Name`,`Phone`,`Email`,`Address`,`City`,`State/Province`,`Country`,`Postal`) VALUES("1","20001","Abraham Lincoln","+1 305 907 7086","-","120 SW 8th St","Miami","Florida","United States","33130");
INSERT INTO customers (`ID`,`Customer ID`,`Name`,`Phone`,`Email`,`Address`,`City`,`State/Province`,`Country`,`Postal`) VALUES("2","30001","Napoléon Bonaparte","+33 1 79 75 40 00","-","40 Rue du Colisée","Paris","Île-de-France","","");

#seeding salespersons table
INSERT INTO salespersons (`ID`,`Staff ID`,`Name`,`Store`) VALUES("0","1","Petey Cruiser","Madrid");
INSERT INTO salespersons (`ID`,`Staff ID`,`Name`,`Store`) VALUES("1","2","Anna Sthesia","Barcelona");
INSERT INTO salespersons (`ID`,`Staff ID`,`Name`,`Store`) VALUES("2","3","Paul Molive","Berlin");
INSERT INTO salespersons (`ID`,`Staff ID`,`Name`,`Store`) VALUES("3","4","Gail Forcewind","Paris");
INSERT INTO salespersons (`ID`,`Staff ID`,`Name`,`Store`) VALUES("4","5","Paige Turner","Mimia");
INSERT INTO salespersons (`ID`,`Staff ID`,`Name`,`Store`) VALUES("5","6","Bob Frapples","Mexico City");
INSERT INTO salespersons (`ID`,`Staff ID`,`Name`,`Store`) VALUES("6","7","Walter Melon","Amsterdam");
INSERT INTO salespersons (`ID`,`Staff ID`,`Name`,`Store`) VALUES("7","8","Shonda Leer","São Paulo");

#seeding invoices
INSERT INTO invoices (`ID`,`Invoice Number`,`Date`,`Car`,`Customer`,`Sales Person`) VALUES("0","852399038","2018-08-22","0","1","3");
INSERT INTO invoices (`ID`,`Invoice Number`,`Date`,`Car`,`Customer`,`Sales Person`) VALUES("1","731166526","2018-12-31","3","0","5");
INSERT INTO invoices (`ID`,`Invoice Number`,`Date`,`Car`,`Customer`,`Sales Person`) VALUES("2","271135104","2019-01-22","2","2","7");






