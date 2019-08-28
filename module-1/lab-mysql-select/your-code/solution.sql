
-- challenge 1

SELECT authors.au_id as "AUTHOR ID", authors.au_lname as "LAST NAME", authors.au_fname AS "FIRST NAME", titles.title AS "TITLE", publishers.pub_name AS "PUBLISHER"
FROM publications.authors                 -- AUTHOR ID, NAME Y LAST NAME ESTAN EN LA TABLA AUTHORS
LEFT JOIN publications.titleauthor       -- HAY QUE UNIR LA TABLA TITLEAUTHORS COMO NUCLEO INERMEDIO ENTRE AUTHORS Y TITLES, PARA SELECCIONAR EL TITULO
ON authors.au_id = titleauthor.au_id     -- LA COLUMNA QUE TIENEN EN COMUN AUTHORS Y TITLEAUTHOR (NEXO)
LEFT JOIN publications.titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN publications.publishers
ON titles.pub_id = publishers.pub_id 
WHERE title IS NOT NULL
ORDER BY authors.au_id;                   -- PARA ELIMINAR LAS FILAS QUE NO TIENEN TODAS SUS CELDAS RELLENAS


-- challenge 2


SELECT 
    authors.au_id AS 'AUTHOR ID',
    authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    publishers.pub_name AS 'PUBLISHER',
    COUNT(titles.title_id) AS 'TITLE COUNT'
FROM
    publications.authors
        LEFT JOIN
    publications.titleauthor ON authors.au_id = titleauthor.au_id
        LEFT JOIN
    publications.titles ON titleauthor.title_id = titles.title_id
        LEFT JOIN
    publications.publishers ON titles.pub_id = publishers.pub_id
WHERE
    title IS NOT NULL
GROUP BY authors.au_id , publishers.pub_id;


-- Challenge 3


SELECT 
    authors.au_id AS 'AUTHOR ID',
    authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    sales.qty AS 'TOTAL'
FROM
    authors
        LEFT JOIN
    titleauthor ON authors.au_id = titleauthor.au_id
        LEFT JOIN
    sales ON titleauthor.title_id = sales.title_id
LIMIT 3;


-- Challenge 4


SELECT 
    authors.au_id AS 'AUTHOR ID',
    authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    sales.qty AS 'TOTAL'
FROM
    authors
        LEFT JOIN
    titleauthor ON authors.au_id = titleauthor.au_id
        LEFT JOIN
    sales ON titleauthor.title_id = sales.title_id
LIMIT 23;
