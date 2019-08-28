#challenge 1

SELECT 
    authors.au_id AS 'AUTHOR ID',
    authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    titles.title AS 'TITLE',
    publishers.pub_name AS 'PUBLISHER'
FROM
    authors
        INNER JOIN
    titleauthor ON authors.au_id = titleauthor.au_id
        INNER JOIN
    titles ON titleauthor.title_id = titles.title_id
        INNER JOIN
    publishers ON titles.pub_id = publishers.pub_id
;

#chellenge 2

SELECT 
    authors.au_id AS 'AUTHOR ID',
    authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    publishers.pub_name AS 'PUBLISHER',
    COUNT(titles.title) AS 'TITLE COUNT'
FROM
    authors
        INNER JOIN
    titleauthor ON authors.au_id = titleauthor.au_id
        INNER JOIN
    titles ON titleauthor.title_id = titles.title_id
        INNER JOIN
    publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id , publishers.pub_id
ORDER BY COUNT(titles.title_id) DESC
;

#chellenge 3

SELECT 
    authors.au_id AS 'AUTHOR ID',
    authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    SUM(titles.ytd_sales) AS 'TOTAL'
FROM
    authors
        INNER JOIN
    titleauthor ON authors.au_id = titleauthor.au_id
        INNER JOIN
    titles ON titleauthor.title_id = titles.title_id
        INNER JOIN
    publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC
LIMIT 3
;

#challenge 4

SELECT 
    authors.au_id AS 'AUTHOR ID',
    authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    COALESCE(SUM(titles.ytd_sales), 0) AS TOTAL
FROM
    authors
        INNER JOIN
    titleauthor ON authors.au_id = titleauthor.au_id
        INNER JOIN
    titles ON titleauthor.title_id = titles.title_id
        INNER JOIN
    publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id
ORDER BY TOTAL DESC

;

#BONUS

SELECT 
    authors.au_id AS 'AUTHOR ID',
    authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    ROUND(SUM(titles.ytd_sales * titles.price * titles.royalty / 100 * titleauthor.royaltyper / 100 + titles.advance * titleauthor.royaltyper / 100),
            2) AS PROFIT
FROM
    authors
        LEFT JOIN
    titleauthor ON authors.au_id = titleauthor.au_id
        LEFT JOIN
    titles ON titleauthor.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY profit DESC
LIMIT 3

;

;