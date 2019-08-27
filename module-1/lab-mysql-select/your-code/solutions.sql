SELECT authors.au_id as "AUTHOR ID", authors.au_lname as "LAST NAME", authors.au_fname as "FIRST NAME", SUM(titles.ytd_sales) AS TOTAL


FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id 
INNER JOIN titles 
ON titleauthor.title_id = titles.title_id

GROUP BY
authors.au_id

ORDER BY Total DESC LIMIT 3;