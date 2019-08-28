#Challenge 1
SELECT
	sum.au_id,
    SUM(sum.sales_royalty + titles.advance)   AS total_incomes
    
FROM
(SELECT 
		au.au_id,
		t.title_id,
		SUM(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) AS sales_royalty
        
	FROM 
		authors AS au
    INNER JOIN titleauthor AS ta ON au.au_id = ta.au_id
    INNER JOIN titles AS t ON t.title_id = ta.title_id
    INNER JOIN sales AS s ON s.title_id = t.title_id
    GROUP BY au.au_id, t.title_id
    ) sum

INNER JOIN titles ON titles.title_id = sum.title_id
	GROUP BY sum.au_id
	ORDER BY total_incomes DESC
	LIMIT 3;



#challenge 2:
CREATE TEMPORARY TABLE sales_royalty
SELECT 
		au.au_id,
		t.title_id,
		sum(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) AS sales_royalty
        
	FROM 
		authors AS au
    INNER JOIN titleauthor AS ta ON au.au_id = ta.au_id
    INNER JOIN titles AS t ON t.title_id = ta.title_id
    INNER JOIN sales AS s ON s.title_id = t.title_id
    GROUP BY au.au_id, t.title_id;
    
 SELECT
	sum.au_id,
    SUM(sum.sales_royalty + titles.advance)   AS total_incomes
    FROM sales_royalty AS sum
    inner join titles ON titles.title_id = sum.title_id
    GROUP BY sum.au_id
    ORDER BY total_incomes DESC
    LIMIT 3;


#Challenge 3

CREATE TABLE most_profiting_authors
SELECT
	sum.au_id,
    SUM(sum.sales_royalty + titles.advance)   AS total_incomes
    
FROM
(SELECT 
		au.au_id,
		t.title_id,
		SUM(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) AS sales_royalty
        
	FROM 
		authors AS au
    INNER JOIN titleauthor AS ta ON au.au_id = ta.au_id
    INNER JOIN titles AS t ON t.title_id = ta.title_id
    INNER JOIN sales AS s ON s.title_id = t.title_id
    GROUP BY au.au_id, t.title_id
    ) sum
    inner join titles ON titles.title_id = sum.title_id
    GROUP BY sum.au_id
    ORDER BY total_incomes DESC;


