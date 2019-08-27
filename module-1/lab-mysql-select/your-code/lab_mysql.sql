#challengue 1

SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM lab_mysql.authors
LEFT JOIN lab_mysql.titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN lab_mysql.titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN lab_mysql.publishers
ON titles.pub_id = publishers.pub_id
WHERE title IS NOT NULL;