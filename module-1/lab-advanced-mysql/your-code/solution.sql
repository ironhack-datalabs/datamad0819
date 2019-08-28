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
   
    SUM((t.price*sales.qty*t.royalty/100)*(titau.royaltyper/100)+(t.advance*titau.royaltyper/100)) AS PROFIT
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
