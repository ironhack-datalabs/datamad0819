UPDATE `lab-mysql`.`salesperson` SET `store_name` = 'Miami' WHERE (`idsalesperson` = '4');

SELECT * FROM `lab-mysql`.salesperson;


UPDATE `lab-mysql`.`customers` SET `email` = 'ppicasso@gmail.com' WHERE (`idcustomers` = '10001');
UPDATE `lab-mysql`.`customers` SET `email` = 'lincoln@us.gov' WHERE (`idcustomers` = '20001');
UPDATE `lab-mysql`.`customers` SET `email` = 'hello@napoleon.me' WHERE (`idcustomers` = '30001');
SELECT * FROM `lab-mysql`.customers;