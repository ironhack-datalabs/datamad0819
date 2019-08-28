#Cars

INSERT INTO Cars (VIN,Manufacturer,Model,Year,Color) VALUES ('3K096I98581DHSNUP','Volkswagen','Tiguan',2019,'Blue');
INSERT INTO Cars (VIN,Manufacturer,Model,Year,Color) VALUES ('ZM8G7BEUQZ97IH46V','Peugeot','Rifter',2019,'Red');
INSERT INTO Cars (VIN,Manufacturer,Model,Year,Color) VALUES ('RKXVNNIHLVVZOUB4M','Ford','Fusion',2018,'White');
INSERT INTO Cars (VIN,Manufacturer,Model,Year,Color) VALUES ('HKNDGS7CU31E9Z7JW','Toyota','RAV4',2018,'Silver');
INSERT INTO Cars (VIN,Manufacturer,Model,Year,Color) VALUES ('DAM41UDN3CHU2WVF6','Volvo','V60',2019,'Gray');
INSERT INTO Cars (VIN,Manufacturer,Model,Year,Color) VALUES ('DAM41UDN3CHU2WVF6','Volvo','V60 Cross Country',2019,'Gray');

#Customers
INSERT INTO Customers (`Customers ID`,Name,Phone,Email,Address,City,`State/Province`,Country,Postal) VALUES (10001,'Pablo Picasso','+34 636 17 63 82','-','Paseo de la Chopera, 14','Madrid','Madrid','Spain',28045);
INSERT INTO Customers (`Customers ID`,Name,Phone,Email,Address,City,`State/Province`,Country,Postal) VALUES (20001,'Abraham Lincoln','+1 305 907 7086','-','120 SW 8th St','Miami','Florida','United States',33130);
INSERT INTO Customers (`Customers ID`,Name,Phone,Email,Address,City,`State/Province`,Country,Postal) VALUES (30001,'Napoléon Bonaparte','+33 1 79 75 40 00','-','40 Rue du Colisée','Paris','Île-de-France','France',75008);

#Salespersons
INSERT INTO Salespersons (`Staff ID`,Name,Store  ) VALUES (1,'Petey Cruiser','Madrid');
INSERT INTO Salespersons (`Staff ID`,Name,Store  ) VALUES (2,'Anna Sthesia','Barcelona');
INSERT INTO Salespersons (`Staff ID`,Name,Store  ) VALUES (3,'Paul Molive','Berlin');
INSERT INTO Salespersons (`Staff ID`,Name,Store  ) VALUES (4,'Gail Forcewind','Paris');
INSERT INTO Salespersons (`Staff ID`,Name,Store  ) VALUES (5,'Paige Turner','Mimia');
INSERT INTO Salespersons (`Staff ID`,Name,Store  ) VALUES (6,'Bob Frapples','Mexico City');
INSERT INTO Salespersons (`Staff ID`,Name,Store  ) VALUES (7,'Walter Melon','Amsterdam');
INSERT INTO Salespersons (`Staff ID`,Name,Store  ) VALUES (8,'Shonda Leer','São Paulo');

#Invoices
INSERT INTO Invoices (`Invoice Number`,Date,Cars,Customers,`Sales Persons`) VALUES (852399038,'22-08-2018',1,2,4);
INSERT INTO Invoices (`Invoice Number`,Date,Cars,Customers,`Sales Persons`) VALUES (731166526,'31-12-2018',4,1,6);
INSERT INTO Invoices (`Invoice Number`,Date,Cars,Customers,`Sales Persons`) VALUES (271135104,'22-01-2019',3,3,8);
