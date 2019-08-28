# Bonus Challenges

#1

UPDATE salesperson
SET store = "Miami"
WHERE staff_id = 5
;

SELECT * FROM car_company.salesperson;

#2

UPDATE customer
SET email = CASE customer_id
    WHEN 10001 THEN 'ppicasso@gmail.com' 
    WHEN 20001 THEN 'lincoln@us.gov' 
    WHEN 30001 THEN 'hello@napoleon.me'
    END
WHERE customer_id IN(10001, 20001, 30001);
 
SELECT * FROM car_company.customer;
