SELECT 
    authors.au_id AS 'AUTHOR ID',
    authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    titles.title AS "TITLE",
    publishers.pub_name AS "PUBLISHER"
FROM
    authors
        INNER JOIN
    titleauthor ON authors.au_id = titleauthor.au_id
        INNER JOIN
    titles ON titleauthor.title_id = titles.title_id
        INNER JOIN
    publishers ON titles.pub_id = publishers.pub_id;
    
    #e2 
SELECT 
    authors.au_id AS 'AUTHOR ID',
    authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    titles.title AS TITLE,
    publishers.pub_name AS "PUBLISHER",
    COUNT(titles.title) AS 'TITLE COUNT'
FROM
    authors
        INNER JOIN
    titleauthor ON authors.au_id = titleauthor.au_id
        INNER JOIN
    titles ON titleauthor.title_id = titles.title_id
        INNER JOIN
    publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id , publishers.pub_id;

#e3

SELECT 
    authors.au_id AS 'AUTHOR ID',
    authors.au_lname AS 'LAST NAME',
    authors.au_fname AS 'FIRST NAME',
    SUM(titles.ytd_sales) + IFNULL(titles.ytd_sales, 0) AS "TOTAL"
FROM
    authors
        INNER JOIN
    titleauthor ON authors.au_id = titleauthor.au_id
        INNER JOIN
    titles ON titleauthor.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY Total DESC
LIMIT 3;