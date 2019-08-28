#Challenge 1:
SELECT 
	authors.au_id AS 'AUTHOR_ID',
    authors.au_lname AS 'LAST_NAME',
    authors.au_fname AS 'FIRST_NAME',
    titles.title AS 'TITLE',
    publishers.pub_name AS 'PUBLISHER'
FROM authors
LEFT JOIN titleauthor
	ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
	ON titleauthor.title_id = titles.title_id 
LEFT JOIN publishers
	ON titles.pub_id = publishers.pub_id
WHERE TITLE IS NOT NULL
ORDER BY AUTHOR_ID, TITLE DESC

#Challenge 2:
SELECT
	authors.au_id AS 'AUTHOR_ID',
    authors.au_lname AS 'LAST_NAME',
    authors.au_fname AS 'FIRST_NAME',
    publishers.pub_name AS 'PUBLISHER',
    COUNT(titles.title) AS 'TITLE_COUNT'
FROM authors
LEFT JOIN titleauthor
	ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
	ON titleauthor.title_id = titles.title_id 
LEFT JOIN publishers
	ON titles.pub_id = publishers.pub_id
WHERE titles.title IS NOT NULL
GROUP BY AUTHOR_ID, PUBLISHER
ORDER BY AUTHOR_ID DESC

#Challenge 3:
SELECT 
	authors.au_id AS 'AUTHOR_ID',
    authors.au_lname AS 'LAST_NAME',
    authors.au_fname AS 'FIRST_NAME',
    SUM(sales.qty) AS 'TOTAL'
FROM authors
LEFT JOIN titleauthor
	ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
	ON titleauthor.title_id = titles.title_id 
LEFT JOIN sales
	ON titles.title_id = sales.title_id
WHERE titles.title IS NOT NULL
GROUP BY AUTHOR_ID
ORDER BY TOTAL DESC
LIMIT 3

#Challenge 4:
SELECT 
	authors.au_id AS 'AUTHOR_ID',
    authors.au_lname AS 'LAST_NAME',
    authors.au_fname AS 'FIRST_NAME',
    coalesce(SUM(sales.qty), 0) AS 'TOTAL'
FROM authors
LEFT JOIN titleauthor
	ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
	ON titleauthor.title_id = titles.title_id 
LEFT JOIN sales
	ON titles.title_id = sales.title_id
GROUP BY AUTHOR_ID
ORDER BY TOTAL DESC
LIMIT 23

#Challenge 5: #PDT
SELECT 
	authors.au_id AS 'AUTHOR_ID',
    authors.au_lname AS 'LAST_NAME',
    authors.au_fname AS 'FIRST_NAME',
