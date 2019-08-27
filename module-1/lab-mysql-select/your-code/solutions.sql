#challenge 1:
SELECT au.au_id AS 'AUTHOR ID',
       au.au_lname AS 'LAST NAME', 
       au.au_fname AS 'FAMILY NAME',
       t.title AS 'TITLE',
       pu.pub_name AS 'PUBLISHER'
	    FROM authors AS au
		LEFT JOIN titleauthor ON titleauthor.au_id = au.au_id
		LEFT JOIN titles AS t ON t.title_id = titleauthor.title_id
        LEFT JOIN publishers AS pu ON pu.pub_id = t.pub_id
        WHERE title IS NOT NULL;

#challenge 2:
SELECT au.au_id AS 'AUTHOR ID',
       au.au_lname AS 'LAST NAME', 
       au.au_fname AS 'FIRST NAME',
       pu.pub_name AS 'PUBLISHER',
       COUNT(titleauthor.title_id) AS 'TITLE COUNT'
			LEFT JOIN titleauthor ON titleauthor.au_id = au.au_id
			LEFT JOIN titles AS t ON t.title_id = titleauthor.title_id
			LEFT JOIN publishers AS pu ON pu.pub_id = t.pub_id
				WHERE title IS NOT NULL
					GROUP BY  au.au_id, pu.pub_id;

#challenge 3:

