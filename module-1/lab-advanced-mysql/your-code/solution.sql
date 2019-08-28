#CHALLENGE 1
#step 1 
SELECT 
	t.title_id,
    titau.au_id,
   
    ((t.price*sales.qty*t.royalty/100)*(titau.royaltyper/100)) AS royalty
FROM
    titleauthor AS titau
        JOIN
    titles AS t ON t.title_id = titau.title_id
        JOIN
    sales ON titau.title_id = sales.title_id
		 
;

#step 2
SELECT 
	t.title_id,
    titau.au_id,
   
    SUM((t.price*sales.qty*t.royalty/100)*(titau.royaltyper/100)) AS royalty
FROM
    titleauthor AS titau
        JOIN
    titles AS t ON t.title_id = titau.title_id
        JOIN
    sales ON titau.title_id = sales.title_id
	group by titau.au_id,t.title_id
;

#step 3
SELECT 
	t.title_id,
    titau.au_id,
   
    SUM((t.price*sales.qty*t.royalty/100)*(titau.royaltyper)+(t.advance*titau.royaltyper/100)) AS PROFIT
FROM
    titleauthor AS titau
        JOIN
    titles AS t ON t.title_id = titau.title_id
        JOIN
    sales ON titau.title_id = sales.title_id
	group by titau.au_id,t.title_id
    order by PROFIT DESC
    LIMIT 3
;

#Challenge 2
CREATE temporary table titleAuthorProfits(
	SELECT titau.title_id as title_id,titau.au_id as au_id,(t.price*(t.royalty)*(titau.royaltyper/100)) as ROYALTY_U ,(t.advance*(titau.royaltyper/100)) AS ADVANCE_TITLE
	FROM titleauthor as titau
	JOIN titles as t
	ON titau.title_id = t.title_id
	ORDER BY title_id,au_id);

SELECT ta.title_id,ta.au_id, SUM(((sales.qty)*ta.ROYALTY_U)+ ta.ADVANCE_TITLE) AS PROFIT
FROM titleAuthorProfits as ta
JOIN sales
ON ta.title_id = sales.title_id
group by ta.title_id,ta.au_id
ORDER BY PROFIT DESC
LIMIT 3;

drop temporary table titleAuthorProfits;

#CHALLENGE 3

CREATE temporary table titleAuthorProfits(
	SELECT titau.title_id as title_id,titau.au_id as au_id,(t.price*(t.royalty)*(titau.royaltyper/100)) as ROYALTY_U ,(t.advance*(titau.royaltyper/100)) AS ADVANCE_TITLE
	FROM titleauthor as titau
	JOIN titles as t
	ON titau.title_id = t.title_id
	ORDER BY title_id,au_id);

CREATE TABLE most_profiting_authors(
SELECT ta.au_id, SUM(((sales.qty)*ta.ROYALTY_U)+ ta.ADVANCE_TITLE) AS PROFIT
FROM titleAuthorProfits as ta
JOIN sales
ON ta.title_id = sales.title_id
group by ta.au_id
ORDER BY PROFIT DESC
LIMIT 3
);

drop temporary table titleAuthorProfits;

SELECT * FROM most_profiting_authors;

#para volver a ejecutar el create_table hacer el drop de abajo
#DROP TABLE most_profiting_authors;


