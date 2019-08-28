#Challenge 1

# Option 1 (following instructions)

SELECT
	AUTHOR_ID,
    SUM(titles.advance*titleauthor.royaltyper/100) + SUM(TOTAL_ROYALTY) AS PROFITS
FROM (SELECT 
	TITLE_ID,
    AUTHOR_ID,
    SUM(ROYALTY) AS TOTAL_ROYALTY
	FROM (SELECT 
		titles.title_id AS 'TITLE_ID',
		titleauthor.au_id AS 'AUTHOR_ID',
		titles.price*sales.qty*(titles.royalty/100)*(titleauthor.royaltyper/100) AS 'ROYALTY'
		FROM titleauthor
		LEFT JOIN titles
			ON titleauthor.title_id = titles.title_id 
		LEFT JOIN sales
			ON titles.title_id = sales.title_id
		order by title_id
	) AS royalties_sales_author
	GROUP BY AUTHOR_ID, TITLE_ID
) AS total_royalties_author_title
LEFT JOIN titleauthor
	ON AUTHOR_ID = titleauthor.au_id
LEFT JOIN titles
	ON titleauthor.title_id = titles.title_id
GROUP BY AUTHOR_ID
ORDER BY PROFITS DESC
LIMIT 3
;

# Option 2 (how I believe it should be)

SELECT
	AUTHOR_ID,
    SUM(TOTAL_ROYALTY) + SUM(TOTAL_ADVANCE) AS PROFITS
FROM (SELECT 
	TITLE_ID,
    AUTHOR_ID,
    SUM(ROYALTY) AS TOTAL_ROYALTY,
    SUM(ADVANCE) AS TOTAL_ADVANCE
	FROM (SELECT 
		titles.title_id AS 'TITLE_ID',
		titleauthor.au_id AS 'AUTHOR_ID',
		titles.price*sales.qty*(titles.royalty/100)*(titleauthor.royaltyper/100) AS 'ROYALTY',
        titles.advance*(titleauthor.royaltyper/100) AS 'ADVANCE'
		FROM titleauthor
		LEFT JOIN titles
			ON titleauthor.title_id = titles.title_id 
		LEFT JOIN sales
			ON titles.title_id = sales.title_id
		order by title_id
	) AS royalties_sales_author
	GROUP BY AUTHOR_ID, TITLE_ID
) AS total_royalties_author_title
GROUP BY AUTHOR_ID
ORDER BY PROFITS DESC
LIMIT 3
;


#Challenge 2

CREATE TEMPORARY TABLE royalties_title
SELECT 
	titles.title_id AS 'TITLE_ID',
	titleauthor.au_id AS 'AUTHOR_ID',
	titles.price*sales.qty*(titles.royalty/100)*(titleauthor.royaltyper/100) AS 'ROYALTY'
	FROM titleauthor
	LEFT JOIN titles
		ON titleauthor.title_id = titles.title_id 
	LEFT JOIN sales
		ON titles.title_id = sales.title_id
	order by title_id
;

CREATE TEMPORARY TABLE royalties_author_title
SELECT 
	TITLE_ID,
    AUTHOR_ID,
    SUM(ROYALTY) AS TOTAL_ROYALTY
	FROM royalties_title
	GROUP BY AUTHOR_ID, TITLE_ID
;

CREATE TEMPORARY TABLE top_three_authors
SELECT
	AUTHOR_ID,
	SUM(TOTAL_ROYALTY) + SUM(titles.advance*titleauthor.royaltyper/100) AS PROFITS
FROM royalties_author_title
LEFT JOIN titleauthor
	ON AUTHOR_ID = titleauthor.au_id
LEFT JOIN titles
	ON titleauthor.title_id = titles.title_id
GROUP BY AUTHOR_ID
ORDER BY PROFITS DESC
LIMIT 3
;




# Challenge 3

CREATE TABLE most_profiting_authors AS (SELECT * FROM top_three_authors)
;

SELECT * FROM most_profiting_authors;