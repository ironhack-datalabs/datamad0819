#CARS

INSERT INTO cars (idCars,VIN,manufacturer,model,year,color)
VALUES 

(1, "ZM8G7BEUQZ97IH46V" , "Peugeot" , "Rifter" , 2019 , "Red"),
(2, "RKXVNNIHLVVZOUB4M" , "Ford" , "Fusion" , 2018, "White"),
(3, "HKNDGS7CU31E9Z7JW" , "Toyota" , "RAV4" , 2018, "Silver"),
(4, "DAM41UDN3CHU2WVF6" , "Volvo" , "V60" ,2019, "Gray"),
(5, "DAM41UDN3CHU2WVF6" , "Volvo" , "V60 Cross Country", 2019 , "Gray")

#CUSTOMERS

INSERT INTO customers (idcustomers, name ,phone_number,email,address,)
VALUES 
( 10001 , "Pablo Picasso" , "+34 636 17 63 82" ,"-", "Paseo de la Chopera 14"),
( 20001 , "Abraham Lincoln" , "+1 305 907 7086" ,"-", "120 SW 8th St"),
( 30001 , "Napoléon Bonaparte" , "+33 1 79 75 40 00" , "-" , "40 Rue du Colisée")

#INVOICES

INSERT INTO invoices (idinvoices, date ,car,customer,sales_person)
VALUES 
(852399038,22-08-2018,0,1,3),
(731166526,31-12-2018,3,0,5),
(271135104,22-01-2019,2,2,7);

#SALESPERSON.

INSERT INTO salesperson (idsalesperson,name,store_name)
VALUES
(0,"Petey Cruiser","Madrid"),
(1,"Anna Sthesia","Barcelona"),
(2,"Paul Molive","Berlin"),
(3,"Gail Forcewind","Paris"),
(4,"Paige Turner","Mimia"),
(5,"Bob Frapples","Mexico City"),
(6,"Walter Melon","Amsterdam"),
(7,"Shonda Leer","São Paulo")
;