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
        INNER JOIN
    publications.titleauthor ON titles.title_id = titleauthor.title_id
        INNER JOIN
    publications.sales ON titleauthor.title_id = sales.title_id
GROUP BY 2, 1
ORDER BY 2;

# STEP 2
# TITLE ID, AUTHOR ID, AGGREGATED ROYALTIES (use the SUM subquery and group by both au_id and title_id)

#DROP TEMPORARY TABLE royalties;

SELECT title_id, author_id, SUM(royalty)
FROM Royalties
GROUP BY 1, 2
ORDER BY 3 DESC;

# STEP 3