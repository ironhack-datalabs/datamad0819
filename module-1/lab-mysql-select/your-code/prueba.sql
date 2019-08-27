#EJERCICIO 1

SELECT 
	a.au_id, au_lname AS "LAST NAME",
    au_fname AS "FIRTS NAME", title as "TITLE",
    pu.pub_name AS "PUBLISHER"
FROM 
	authors a
LEFT JOIN titleauthor AS ta ON ta.au_id = a.au_id
LEFT JOIN titles AS ti ON ti.title_id = ta.title_id
LEFT JOIN publishers AS pu on pu.pub_id = ti.pub_id
WHERE  pu.pub_id is not NULL
ORDER BY a.au_id;


#EJERCICIO 2


SELECT 
	a.au_id, au_lname AS "LAST NAME",
    au_fname AS "FIRTS NAME", title as "TITLE",
    pu.pub_name AS "PUBLISHER",
    count(a.au_id) AS "TITLE COUNT"
FROM 
	authors a
LEFT JOIN titleauthor AS ta ON ta.au_id = a.au_id
LEFT JOIN titles AS ti ON ti.title_id = ta.title_id
LEFT JOIN publishers AS pu on pu.pub_id = ti.pub_id
WHERE  pu.pub_id is not NULL
#se agrupa por titulos y por autores
GROUP BY ti.pub_id,a.au_id
ORDER BY a.au_id DESC;


# EJERCICIO 3


SELECT
	a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME",
	a.au_fname AS "FIRTS NAME", sum(qty) AS "TOTAL"
FROM authors AS a
LEFT JOIN titleauthor AS ti ON ti.au_id = a.au_id
LEFT JOIN sales AS sa ON sa.title_id = ti.title_id
GROUP by a.au_id
ORDER BY sum(qty) DESC
LIMIT 3;




# EJERCICIO 4

SELECT
	a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME",
	a.au_fname AS "FIRTS NAME", IFNULL(SUM(qty),0) AS "TOTAL"
FROM authors AS a
LEFT JOIN titleauthor AS ti ON ti.au_id = a.au_id
LEFT JOIN sales AS sa ON sa.title_id = ti.title_id
GROUP by a.au_id
ORDER BY sum(qty) DESC;


# BONUS
SELECT
	a.au_id AS "AUTHOR ID", a.au_lname AS "LAST NAME",
	a.au_fname AS "FIRTS NAME", 
    sum( (advance + ( (royalty/100) * (price * ytd_sales))) *  (ti.royaltyper/100))   AS "TOTAL"
    
FROM authors AS a
LEFT JOIN titleauthor AS ti ON ti.au_id = a.au_id
LEFT JOIN titles  ON titles.title_id = ti.title_id
LEFT JOIN sales AS sa ON sa.title_id = ti.title_id
GROUP by a.au_id
ORDER BY TOTAL DESC
LIMIT 3
