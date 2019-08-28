INSERT INTO cars (VIN, Manufacturer, Model, Year, Color) 
	VALUES
		('3K096I98581DHSNUP', 'Volkswagen', 'Tiguan', 2019, 'Blue'),
        ('ZM8G7BEUQZ97IH46V', 'Peugeot', 'Rifter', 2019, 'Red'),
        ('RKXVNNIHLVVZOUB4M', 'Ford', 'Fusion', 2019, 'White'),
        ('HKNDGS7CU31E9Z7JW', 'Toyota', 'RAV4', 2018, 'Silver'),
        ('DAM41UDN3CHU2WVF6', 'Volvo', 'V60', 2019, 'Gray'),
        ('DAM41UDN3CHU2WVF6', 'Volvo', 'V60 Cross Country', 2019, 'Gray');

INSERT INTO customers (Customer_name, Phone, Email, Adress, City, State, Country, Zip)
	VALUES
		('Pablo Garcia', '+ 34 636 17 63 82', NULL, 'Paseo de la Chopera 14', 'Madrid', 'Madrid', 'Spain', 28045),
        ('John Smith', '+ 1 305 907 7086', NULL, '120 SW 8th St', 'Miami', 'Florida', 'United States', 33130),
        ('Jaques Feraud', '+ 33 1 79 75 40 00', NULL, '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France', 75008);

INSERT INTO salespersons (Staff_name, Store)
	VALUES
		('Petey Cruiser', 'Madrid'),
        ('Anna Sthesia', 'Barcelona'),
        ('Paul Molive', 'Berlin'),
        ('Gail Forcewind', 'Paris'),
        ('Paige Turner', 'Mimia'),
        ('Bob Frapples', 'Mexico City'),
        ('Walter Melon', 'Amsterdam'),
        ('Shonda Leer', 'Sao Paulo');

INSERT INTO invoices (Invoice_number, Date, Customers_idCustomers, Cars_idCars, Salespersons_idStaff)
	VALUES
		(852399038, '2018-08-22', 1, 6, 8),
        (731166526, '2018-12-31', 2, 5, 2),
        (271135104, '2019-01-22', 3, 5, 3);