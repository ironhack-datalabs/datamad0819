/* Challenge 1

Step 1 */

CREATE TEMPORARY TABLE step1
SELECT 
        t.title_id,
            tau.au_id,
            (t.price * s.qty * t.royalty / 100 + tau.royaltyper / 100) AS royalty
    FROM
        titles AS t
    LEFT JOIN titleauthor AS tau ON t.title_id = tau.title_id
    LEFT JOIN sales AS s ON s.title_id = tau.title_id;

/*Step 2*/

CREATE TEMPORARY TABLE step2
SELECT 
        step1.title_id,
            step1.au_id,
            SUM(step1.royalty) AS aggregatedroyalties
    FROM step1
    GROUP BY au_id , title_id;

/*Step 3*/

CREATE TEMPORARY TABLE step3
SELECT 
    step2.au_id,
    /*step2.aggregatedroyalties,
    tit.advance,*/
    SUM(step2.aggregatedroyalties + tit.advance) AS profits
FROM step2
LEFT JOIN
    titleauthor AS ttau ON step2.au_id = ttau.au_id
        LEFT JOIN
    titles AS tit ON step2.title_id = tit.title_id
GROUP BY au_id , tit.title_id
ORDER BY profits DESC
LIMIT 3;

/* CHALLENGE 2 */
/* DERIVED TABLE */

SELECT * FROM step3;

SELECT 
    step2.au_id,
    /*step2.aggregatedroyalties,
    tit.advance,*/
    SUM(step2.aggregatedroyalties + tit.advance) AS profits
FROM
    (SELECT 
        step1.title_id,
            step1.au_id,
            SUM(step1.royalty) AS aggregatedroyalties
    FROM
        (SELECT 
        t.title_id,
            tau.au_id,
            (t.price * s.qty * t.royalty / 100 + tau.royaltyper / 100) AS royalty
    FROM
        titles AS t
    LEFT JOIN titleauthor AS tau ON t.title_id = tau.title_id
    LEFT JOIN sales AS s ON s.title_id = tau.title_id) AS step1
    GROUP BY au_id , title_id) AS step2
        LEFT JOIN
    titleauthor AS ttau ON step2.au_id = ttau.au_id
        LEFT JOIN
    titles AS tit ON step2.title_id = tit.title_id
GROUP BY au_id , tit.title_id
ORDER BY profits DESC
LIMIT 3;

/* CHALLENGE 3 */ 
/* CREATE A PERMANENT TABLE FROM THE TEMP TABLE CREATED */

CREATE TABLE most_profiting_authors AS SELECT * FROM
    step3;


