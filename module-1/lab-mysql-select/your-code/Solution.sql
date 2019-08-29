#Challenge 1

SELECT a.au_id as "AUTHOR ID", a.au_    lname as "LAST NAME", a.au_fname as "FIRST NAME", t.title as "TITLE", p.pub_name as "PUBLISHER"
FROM authors as a 
LEFT JOIN titleauthor as ta ON a.au_id = ta.au_id
LEFT JOIN titles as t ON  ta.title_id = t.title_id
LEFT JOIN publishers as p ON t.pub_id = p.pub_id
WHERE t.title IS NOT NULL;

# Sacar todo de golpe donde aparecen todas las columnas que quiero sacar, relacionarlas entre sí unas con otras viendo lo que tienen en conún y usando el alias
#Ahora sólo hay que llamar a las columnas que deseamos obtener usando el alias

#Challenge 2

SELECT a.au_id as "AUTHOR ID", a.au_lname as "LAST NAME", a.au_fname as "FIRST NAME", p.pub_name as "PUBLISHER", COUNT(t.title_id) as "TITLE COUNT" 
FROM authors as a 
LEFT JOIN titleauthor as ta ON a.au_id = ta.au_id
LEFT JOIN titles as t ON  ta.title_id = t.title_id
LEFT JOIN publishers as p ON t.pub_id = p.pub_id
WHERE t.title IS NOT NULL
GROUP BY a.au_id, p.pub_id;

#Challenge 3


SELECT a.au_id as "AUTHOR ID", a.au_lname as "LAST NAME", a.au_fname as "FIRST NAME", s.qty as "TOTAL"
FROM authors as a 
LEFT JOIN titleauthor as ta ON a.au_id = ta.au_id
LEFT JOIN sales as s ON ta.title_id = s.title_id
lIMIT 3;

#Challenge 4

SELECT a.au_id as "AUTHOR ID", a.au_lname as "LAST NAME", a.au_fname as "FIRST NAME", COALESCE(sum(s.qty), 0 ) as "TOTAL"
FROM authors as a 
LEFT JOIN titleauthor as ta ON a.au_id = ta.au_id
LEFT JOIN sales as s ON ta.title_id = s.title_id
GROUP BY a.au_id
lIMIT 23 ;
