#Lab | MySQL Select

##Challenge 1 - Who Have Published What At Where?

###V1 - versión sin abreviaciones
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
;

###V2 - versión con abreviaciones (el resto del lab lo he hecho
sin abreviaciones porque me parecía más intuitivo para no perderme
pero en adelante utilizaré abreviaciones para los Joins)

SELECT 
	a.au_id AS 'AUTHOR_ID',
    a.au_lname AS 'LAST_NAME',
    a.au_fname AS 'FIRST_NAME',
    t.title AS 'TITLE',
    p.pub_name AS 'PUBLISHER'
FROM authors AS a
LEFT JOIN titleauthor AS ta
	ON a.au_id = ta.au_id
LEFT JOIN titles AS t
	ON ta.title_id = t.title_id 
LEFT JOIN publishers AS p
	ON t.pub_id = p.pub_id
WHERE TITLE IS NOT NULL
ORDER BY AUTHOR_ID, TITLE DESC
;

##Challenge 2 - Who Have Published How Many At Where?

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
;

##Challenge 3 - Best Selling Authors

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
;

##Challenge 4 - Best Selling Authors Ranking

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
;

##Bonus Challenge - Most Profiting Authors

SELECT 
	authors.au_id AS 'AUTHOR_ID',
    authors.au_lname AS 'LAST_NAME',
    authors.au_fname AS 'FIRST_NAME',
    ROUND(SUM(
    (titleauthor.royaltyper/100) * 
    (titles.advance + titles.ytd_sales*titles.price*(titles.royalty/100))),2) 
    AS 'PROFIT'
FROM authors
LEFT JOIN titleauthor
	ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
	ON titleauthor.title_id = titles.title_id 
LEFT JOIN sales
	ON titles.title_id = sales.title_id
GROUP BY AUTHOR_ID
ORDER BY PROFIT DESC
LIMIT 3
;