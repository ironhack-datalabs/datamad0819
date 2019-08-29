# CHALLANGE 1 - STEP 1
# TITLE ID, AUTHOR ID, ROYALTY
# ROYALTY sales_royalty = titles.price * sales.qty * titles.royalty / 100 * titleauthor.royaltyper / 100
# TITLES -- TITLEAUTHOR -- SALES 

CREATE TEMPORARY TABLE Royalties
SELECT 
    titles.title_id AS 'TITLE_ID',
    titleauthor.au_id AS 'AUTHOR_ID',
    SUM((titles.price * sales.qty * titles.royalty) / 100 * titleauthor.royaltyper / 100)  AS 'ROYALTY'
FROM
    publications.titles
        LEFT JOIN
    publications.titleauthor ON titles.title_id = titleauthor.title_id
        LEFT JOIN
    publications.sales ON titleauthor.title_id = sales.title_id
GROUP BY 2, 1
ORDER BY 2;

# DROP TEMPORARY TABLE royalties;

# STEP 2
# TITLE ID, AUTHOR ID, AGGREGATED ROYALTIES (use the SUM subquery and group by both au_id and title_id)
# Sé que este segundo paso está mal, obtengo el mismo output que en el primero, pero no sé por qué


CREATE TEMPORARY TABLE Total
SELECT title_id, author_id, SUM(royalty)
FROM Royalties
GROUP BY 1, 2
ORDER BY 3 DESC;

# STEP 3
# Author ID, Profits of each author aggregating the advance and total royalties of each title

CREATE TEMPORARY TABLE Result
SELECT author_id, ROUND(SUM(titles.advance + royalty), 2) AS "Total_profit"
FROM Total
LEFT JOIN titles
ON total.title_id = titles.title_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3;

#CHALLANGE 3
#CREATE A PERMANENT TABLE NAMED MOST_PROFITING-AUTHORS
#


SELECT author_id, total_profit
FROM (
	SELECT author_id, total_profit
    FROM result
) most_profiting_authors
WHERE most_profiting_authors.total_profit > 0;








