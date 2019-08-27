# Challange 1
# AUTHOR ID, LAST NAME, FIRST NAME, TITLE, PUBLISHER

SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
	FROM publications.authors
		LEFT JOIN 
		publications.titleauthor ON authors.au_id = titleauthor.au_id
        LEFT JOIN
        titles ON titleauthor.title_id = titles.title_id
        LEFT JOIN
        publishers ON titles.pub_id = publishers.pub_id
        WHERE title IS NOT NULL;


SELECT COUNT(*) FROM publications.titleauthor;

# Challange 2
# query how many titles each author has published at each publisher
# AUTHOR ID, LAST NAME, FIRST NAME, PUBLISHER, TITLE COUNT

SELECT authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name, COUNT(publishers.pub_id)
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

SELECT authors.au_id, authors.au_lname, authors.au_fname, SUM(titleauthor.title_id)
	FROM publications.authors
		LEFT JOIN
        publications.titleauthor ON authors.au_id = titleauthor.au_id
        LEFT JOIN
        titles ON titleauthor.title_id = titles.title_id
GROUP BY 1, 4
ORDER BY 4 DESC
LIMIT 3;

# CHALLANGE 4

