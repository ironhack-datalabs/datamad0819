# Challange 1

SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", titles.title AS "TITLE", publishers.pub_name AS "PUBLISHER"
	FROM publications.authors
		LEFT JOIN 
		publications.titleauthor ON authors.au_id = titleauthor.au_id
        LEFT JOIN
        titles ON titleauthor.title_id = titles.title_id
        LEFT JOIN
        publishers ON titles.pub_id = publishers.pub_id
        WHERE title IS NOT NULL;

# Para comprobar si el resultado es correcto

SELECT COUNT(*) FROM publications.titleauthor;


# Challange 2
# query how many titles each author has published at each publisher
# AUTHOR ID, LAST NAME, FIRST NAME, PUBLISHER, TITLE COUNT

SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", publishers.pub_name AS "PUBLISHER", COUNT(publishers.pub_id) AS "COUNT"
	FROM publications.authors
		LEFT JOIN
        publications.titleauthor ON authors.au_id = titleauthor.au_id
        LEFT JOIN
        titles ON titleauthor.title_id = titles.title_id
        LEFT JOIN
        publishers ON titles.pub_id = publishers.pub_id
	WHERE pub_name IS NOT NULL
GROUP BY 1, 4
ORDER BY 5 DESC;


# Challange 3
# Who are the top 3 authors who have sold the highest number of titles?
# AUTHOR ID, LAST NAME, FIRST NAME, TOTAL

SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", SUM(titles.ytd_sales) AS "TOTAL"
	FROM publications.authors
		LEFT JOIN
        publications.titleauthor ON authors.au_id = titleauthor.au_id
        LEFT JOIN
        publications.titles ON titleauthor.title_id = titles.title_id
GROUP BY 1
ORDER BY 4 DESC
LIMIT 3;


# Challange 4

SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", SUM(titles.ytd_sales) AS "TOTAL"
	FROM publications.authors
		LEFT JOIN
        publications.titleauthor ON authors.au_id = titleauthor.au_id
        LEFT JOIN
        publications.titles ON titleauthor.title_id = titles.title_id
GROUP BY 1
ORDER BY 4 DESC;


# Bonus
# who are the 3 most profiting authors and how much royalties each of them have received? 
# AUTHOR ID, LAST NAME, FIRST NAME, PROFIT
# PROFIT = ADVANCE + ROYALTIES
# AUTHORS --- TITLEAUTHOR --- TITLES ---
# (SUM(ROUND(titles.advance, 2)) + SUM(ROUND(titles.royalty * titles.ytd_sales / 100), 2))) AS "PROFIT"
# Pequeña aproximación al ejercicio, no supe calcular los royalties y tampoco la retribución por ser coautor de un libro

SELECT authors.au_id AS "AUTHORS", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", #SUM((ROUND(titles.advance, 2)) +  (ROUND((titles.royalty * titles.ytd_Sales / 100), 2))) AS "PROFIT"
		LEFT JOIN
		publications.titleauthor ON authors.au_id = titleauthor.au_id
		LEFT JOIN
		publications.titles ON titleauthor.title_id = titles.title_id
	GROUP BY 1
    ORDER BY 4 DESC
    LIMIT 3;


