#Challenge 1 

SELECT 
	#count(au.au_id)
    au.au_id AS AUTHOR,
    au_lname AS 'LAST NAME',
    au_fname AS 'FIRST NAME',
    t.title AS TITLE,
    p.pub_name AS PUBLISHER
FROM
    publications.authors AS au
        LEFT JOIN
    titleauthor AS t_au ON au.au_id = t_au.au_id
        LEFT JOIN
    titles AS t ON t_au.title_id = t.title_id
        LEFT JOIN
    publishers AS p ON t.pub_id = p.pub_id
WHERE
    p.pub_name IS NOT NULL
;

#Challenge 2

SELECT 
    au.au_id AS AUTHOR,
    au_lname AS 'LAST NAME',
    au_fname AS 'FIRST NAME',
    p.pub_name AS PUBLISHER,
    COUNT(t.title_id) AS 'TITLE COUNT'
FROM
    publications.authors AS au
        LEFT JOIN
    titleauthor AS t_au ON au.au_id = t_au.au_id
        LEFT JOIN
    titles AS t ON t_au.title_id = t.title_id
        LEFT JOIN
    publishers AS p ON t.pub_id = p.pub_id
WHERE
    p.pub_name IS NOT NULL
GROUP BY au.au_id , p.pub_id
ORDER BY COUNT(t.title_id) DESC
;

#Challenge 3
SELECT 
    au.au_id AS 'AUTHOR ID',
    au.au_lname AS 'LAST NAME',
    au.au_fname AS 'FIRST NAME',
    sum(t.ytd_sales) as TOTAL
FROM
    publications.authors AS au
        LEFT JOIN
    titleauthor AS t_au ON au.au_id = t_au.au_id
        LEFT JOIN
	titles as t on t_au.title_id = t.title_id
    #sales AS s ON t_au.title_id = s.title_id
WHERE
    t_au.au_id IS NOT NULL
GROUP BY au.au_id
ORDER BY TOTAL DESC
LIMIT 3
;

#Challenge 4
SELECT 
    au.au_id AS 'AUTHOR ID',
    au.au_lname AS 'LAST NAME',
    au.au_fname AS 'FIRST NAME',
	ifnull(sum(t.ytd_sales),0) as TOTAL
FROM
    publications.authors AS au
        LEFT JOIN
    titleauthor AS t_au ON au.au_id = t_au.au_id
        LEFT JOIN
	#sales AS s ON t_au.title_id = s.title_id
    titles AS t ON t_au.title_id = t.title_id
GROUP BY au.au_id
ORDER BY TOTAL DESC
;

#Challenge 5

SELECT 
    au.au_id AS AUTHOR,
    au.au_lname AS 'LAST NAME',
    au.au_fname AS 'FIRST NAME',
    round(SUM(t.ytd_sales * t.price * t.royalty/100 * ta.royaltyper / 100 + t.advance*ta.royaltyper/100),2) AS PROFIT
FROM
    authors AS au
        LEFT JOIN
    titleauthor AS ta ON au.au_id = ta.au_id
        LEFT JOIN
    titles AS t ON ta.title_id = t.title_id
GROUP BY au.au_id
ORDER BY profit DESC
LIMIT 3
;