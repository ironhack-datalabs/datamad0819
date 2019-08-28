# Challenge 1  One query

SELECT 
    au.au_id,
	#sum(t.price * s.qty * t.royalty /100 * tau.royaltyper /100) as sales_royalty
    round(sum(t.price * s.qty * t.royalty /100 * tau.royaltyper /100) + sum(t.advance*tau.royaltyper/100),2) as profit
FROM
    authors AS au
        INNER JOIN
    titleauthor AS tau ON au.au_id = tau.au_id
        INNER JOIN
    titles AS t ON tau.title_id = t.title_id
		inner join 
	sales as s ON tau.title_id = s.title_id
    GROUP by au.au_id, t.title_id
    #ORDER BY sales_royalty DESC
    ORDER BY profit DESC	
    LIMIT 3
    ;
    #Challenge 2 - With derivative tables 
   
    SELECT temp.au_id, 
    sum(temp.sales_royalty) + sum(t_temp.advance*ta_temp.royaltyper/100) as profit

   FROM(
		SELECT 
		t.title_id, au.au_id,
		t.price * s.qty * t.royalty /100 * tau.royaltyper /100 as sales_royalty
		FROM
		authors AS au
			INNER JOIN
		titleauthor AS tau ON au.au_id = tau.au_id
			INNER JOIN
		titles AS t ON tau.title_id = t.title_id
			inner join 
		sales as s ON tau.title_id = s.title_id
	) as temp
		
        INNER JOIN 
     titleauthor as ta_temp ON temp.au_id = ta_temp.au_id
		INNER JOIN 
     titles as t_temp ON temp.title_id = t_temp.title_id
    
    GROUP by temp.au_id, temp.title_id
    ORDER BY profit DESC
    LIMIT 3
    ;
    
#Challenge 3 - With temp tables 

CREATE TEMPORARY TABLE royalties_author_title
		SELECT 
		t.title_id, au.au_id,
		t.price * s.qty * t.royalty /100 * tau.royaltyper /100 as sales_royalty
		FROM
		authors AS au
			INNER JOIN
		titleauthor AS tau ON au.au_id = tau.au_id
			INNER JOIN
		titles AS t ON tau.title_id = t.title_id
			inner join 
		sales as s ON tau.title_id = s.title_id
;
   
SELECT temp.au_id, 
sum(temp.sales_royalty) + sum(t_temp.advance*ta_temp.royaltyper/100) as profit
from royalties_author_title as temp
	INNER JOIN 
    titleauthor as ta_temp ON temp.au_id = ta_temp.au_id
		INNER JOIN 
    titles as t_temp ON temp.title_id = t_temp.title_id
   
    GROUP by temp.au_id, temp.title_id
    ORDER BY profit DESC
    LIMIT 3

#Challenge 4 - Permanent table

CREATE TABLE most_profiting_authors AS
    SELECT temp.au_id, 
    sum(temp.sales_royalty) + sum(t_temp.advance*ta_temp.royaltyper/100) as profit

   FROM(
		SELECT 
		t.title_id, au.au_id,
		t.price * s.qty * t.royalty /100 * tau.royaltyper /100 as sales_royalty
		FROM
		authors AS au
			INNER JOIN
		titleauthor AS tau ON au.au_id = tau.au_id
			INNER JOIN
		titles AS t ON tau.title_id = t.title_id
			inner join 
		sales as s ON tau.title_id = s.title_id
	) as temp
		
        INNER JOIN 
     titleauthor as ta_temp ON temp.au_id = ta_temp.au_id
		INNER JOIN 
     titles as t_temp ON temp.title_id = t_temp.title_id
    
    GROUP by temp.au_id, temp.title_id
    ORDER BY profit DESC
    LIMIT 3
    ;