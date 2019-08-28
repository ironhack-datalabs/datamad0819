#Challenge 3

INSERT INTO car (car_id,VIN,manufacturer,model,year,color) VALUES (0, '3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Blue');
INSERT INTO car (car_id,VIN,manufacturer,model,year,color) VALUES (1, 'ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019, 'Red');
INSERT INTO car (car_id,VIN,manufacturer,model,year,color) VALUES (2, 'RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2018, 'White');
INSERT INTO car (car_id,VIN,manufacturer,model,year,color) VALUES (3, 'HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', 2018, 'Silver');
INSERT INTO car (car_id,VIN,manufacturer,model,year,color) VALUES (4, 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019, 'Gray');
INSERT INTO car (car_id,VIN,manufacturer,model,year,color) VALUES (5, 'DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', 2019, 'Gray');

INSERT INTO customer (customer_id, name, phone, email, address, city, state_province, country, postal) VALUES ('10001','Pablo Picasso','+34 636 17 63 82','-', 'Paseo de la Chopera, 14', 'Madrid', 'Madrid', 'Spain', 28045);
INSERT INTO customer (customer_id, name, phone, email, address, city, state_province, country, postal) VALUES ('20001','Abraham Lincoln','+1 305 907 7086','-', '120 SW 8th St', 'Miami', 'Florida', 'United States', 33130);
INSERT INTO customer (customer_id, name, phone, email, address, city, state_province, country, postal) VALUES ('30001','Napoléon Bonaparte','+33 1 79 75 40 00','-', '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France', 75008);

INSERT INTO salesperson (staff_id, name, store) VALUES (1, 'Petey Cruiser', 'Madrid');
INSERT INTO salesperson (staff_id, name, store) VALUES (2, 'Anna Sthesia', 'Barcelona');
INSERT INTO salesperson (staff_id, name, store) VALUES (3, 'Paul Molive', 'Berlin');
INSERT INTO salesperson (staff_id, name, store) VALUES (4, 'Gail Forcewind', 'Paris');
INSERT INTO salesperson (staff_id, name, store) VALUES (5, 'Paige Turner', 'Mimia');
INSERT INTO salesperson (staff_id, name, store) VALUES (6, 'Bob Frapples', 'Mexico City');
INSERT INTO salesperson (staff_id, name, store) VALUES (7, 'Walter Melon', 'Amsterdam');
INSERT INTO salesperson (staff_id, name, store) VALUES (8, 'Shonda Leer', 'São Paulo');

INSERT INTO invoice (invoice_id, date, car, customer, salesperson) VALUES (852399038, '20180822', 0, 20001, 3);
INSERT INTO invoice (invoice_id, date, car, customer, salesperson) VALUES (731166526, '20181231', 3, 10001, 5);
INSERT INTO invoice (invoice_id, date, car, customer, salesperson) VALUES (271135104, '20190122', 2, 30001, 7);

SELECT * FROM car_company.car;
SELECT * FROM car_company.customer;
SELECT * FROM car_company.salesperson;
SELECT * FROM car_company.invoice;