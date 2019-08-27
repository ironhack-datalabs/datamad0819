#CHALLENGE 1
SELECT
	authors.au_id AS 'AUTHOR ID',
    au_lname AS 'LAST NAME',
    au_fname AS 'FIRST NAME',
    title AS 'TITLE',
    pub_name AS 'PUBLISHER'
FROM 
	authors
		LEFT JOIN
	titleauthor
		ON
	authors.au_id = titleauthor.au_id
		LEFT JOIN
	titles
		ON
	titleauthor.title_id = titles.title_id
		LEFT JOIN
	publishers
		ON
	titles.pub_id = publishers.pub_id
WHERE
	title IS NOT NULL;
    
#CHALLENGE 2
SELECT
	authors.au_id AS 'AUTHOR ID',
    max(au_lname) AS 'LAST NAME',
    max(au_fname) AS 'FIRST NAME',
    max(pub_name) AS 'PUBLISHER',
    count(title) AS 'TITLE COUNT'
FROM 
	authors
		LEFT JOIN
	titleauthor
		ON
	authors.au_id = titleauthor.au_id
		LEFT JOIN
	titles
		ON
	titleauthor.title_id = titles.title_id
		LEFT JOIN
	publishers
		ON
	titles.pub_id = publishers.pub_id
WHERE
	pub_name IS NOT NULL
GROUP BY 
	authors.au_id,publishers.pub_id;

#CHALLENGE 3
SELECT
	authors.au_id AS 'AUTHOR ID',
	max(au_lname) AS 'LAST NAME',
    max(au_fname) AS 'FIRST NAME',
	sum(ytd_sales) AS 'TOTAL'
FROM
	authors
		LEFT JOIN
	titleauthor
		ON
	authors.au_id = titleauthor.au_id
		LEFT JOIN
	titles
		ON
	titleauthor.title_id = titles.title_id
GROUP BY
	authors.au_id
ORDER BY
	sum(ytd_sales) DESC
LIMIT 3;

#CHALLENGE 4
SELECT
	authors.au_id AS 'AUTHOR ID',
	max(au_lname) AS 'LAST NAME',
    max(au_fname) AS 'FIRST NAME',
	COALESCE(sum(ytd_sales),0) AS 'TOTAL'
FROM
	authors
		LEFT JOIN
	titleauthor
		ON
	authors.au_id = titleauthor.au_id
		LEFT JOIN
	titles
		ON
	titleauthor.title_id = titles.title_id
GROUP BY
	authors.au_id
ORDER BY
	sum(ytd_sales) DESC;

#BONUS CHALLENGE
SELECT
	authors.au_id AS 'AUTHOR ID',
	max(au_lname) AS 'LAST NAME',
    max(au_fname) AS 'FIRST NAME',
	sum(advance*royaltyper/100) + sum(ytd_sales*royalty*royaltyper/10000) AS 'PROFIIT'
FROM
	authors
		LEFT JOIN
	titleauthor
		ON
	authors.au_id = titleauthor.au_id
		LEFT JOIN
	titles
		ON
	titleauthor.title_id = titles.title_id
GROUP BY
	authors.au_id
ORDER BY
	sum(advance*royaltyper/100) + sum(ytd_sales*royalty*royaltyper/10000) DESC
LIMIT 3;