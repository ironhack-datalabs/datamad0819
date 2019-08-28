
#Inserto los Custumer con la Ciudad mal escrita
INSERT INTO Customer (customerID,name,phone,email,address,city,state_province,country,postal)
VALUES (10010,"Pablo Picaso","888888888","ppicasso@gmail.com","c/Alfarería","Mimia","Florida","USA","12365");

INSERT INTO Customer (customerID,name,phone,email,address,city,state_province,country,postal)
VALUES (10011,"Abraham Lincoln","888888888","lincoln@us.gov","c/Alfarería","Mimia","Florida","USA","12365");

INSERT INTO Customer (customerID,name,phone,email,address,city,state_province,country,postal)
VALUES (10012,"Napoleon Bonaparte","888888888","hello@napoleon.me","c/Alfarería","Mimia","Florida","USA","12365");

#Hago el update, quito el modo seguro y lo vuelvo a poner
 
SET SQL_SAFE_UPDATES=0;
  UPDATE Customer SET city = "Miami" where name in ('Pablo Picaso','Abraham Lincoln','Napoleon Bonaparte')
 and email in ('ppicasso@gmail.com','lincoln@us.gov','hello@napoleon.me');
SET SQL_SAFE_UPDATES=1;

