#CHALLENGE_1

SELECT 
authors.au_id AS "AUTHOR ID", 
authors.au_lname AS "LAST NAME", 
authors.au_fname AS "FIRST NAME", 
titles.title AS "TITLE", 
publishers.pub_name AS "PUBLISHER"
FROM publications.authors

LEFT JOIN publications.titleauthor
ON authors.au_id = titleauthor.au_id

LEFT JOIN publications.titles
ON titleauthor.title_id = titles.title_id

LEFT JOIN publications.publishers
ON titles.pub_id = publishers.pub_id
WHERE title IS NOT Null

ORDER BY authors.au_id
; 


