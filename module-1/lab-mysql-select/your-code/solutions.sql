#challenge 1:
SELECT au.au_id AS 'AUTHOR ID',
       au.au_lname AS 'LAST NAME', 
       au.au_fname AS 'FIRST NAME',
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
SELECT au.au_id AS 'AUTHOR ID',
       au.au_lname AS 'LAST NAME', 
       au.au_fname AS 'FIRST NAME',
       sum(sa.qty) AS 'TOTAL'
			FROM authors AS au
			LEFT JOIN titleauthor ON titleauthor.au_id = au.au_id
			LEFT JOIN titles AS t ON t.title_id = titleauthor.title_id
			LEFT JOIN sales AS sa ON sa.title_id = t.title_id
					GROUP BY  au.au_id
                    ORDER BY TOTAL DESC
                    limit 3;

#Challenge 4:
SELECT au.au_id AS 'AUTHOR ID',
       au.au_lname AS 'LAST NAME', 
       au.au_fname AS 'FIRST NAME',
         COALESCE(sum(sa.qty),0) AS 'TOTAL'
			FROM authors AS au
			LEFT JOIN titleauthor ON titleauthor.au_id = au.au_id
			LEFT JOIN titles AS t ON t.title_id = titleauthor.title_id
			LEFT JOIN sales AS sa ON sa.title_id = t.title_id
					GROUP BY  au.au_id
                    ORDER BY TOTAL DESC
                    limit 23;
                    
#Bonus:
SELECT au.au_id AS 'AUTHOR ID',
       au.au_lname AS 'LAST NAME', 
       au.au_fname AS 'FIRST NAME',
	   sum((titleauthor.royaltyper/100 * t.royalty) + t.advance) AS 'PROFIT'
			FROM authors AS au
			LEFT JOIN titleauthor ON titleauthor.au_id = au.au_id
			LEFT JOIN titles AS t ON t.title_id = titleauthor.title_id
					GROUP BY  au.au_id
                    ORDER BY PROFIT DESC
                    limit 3;
