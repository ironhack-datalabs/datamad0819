#challengue 1

SELECT authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', 
titles.title as 'TITLE', publishers.pub_name as 'PUBLISHER'
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers
ON titles.pub_id = publishers.pub_id
WHERE title IS NOT NULL;

#chellengue 2

SELECT authors.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', 
authors.au_fname as 'FIRST NAME', titles.title as 'TITLE', publishers.pub_name as 'PUBLISHER',
 COUNT(t.title_id) as 'TITLE COUNT'

FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers
ON titles.pub_id = publishers.pub_id
WHERE t.title != "null"
GROUP BY au.au_id,publishers.pub_id, titles.title_id
ORDER BY COUNT(t.title_id) DESC