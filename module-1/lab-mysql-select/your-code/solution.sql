#CHALLENGE 1
SELECT
au.au_id as AUTHOR_ID, au.au_lname as LAST_NAME, au.au_fname as FIRST_NAME,  tit.title as TITLE, pub.pub_name as PUBLISHER
FROM
	authors as au
LEFT JOIN
	titleauthor as titau
ON au.au_id = titau.au_id
LEFT JOIN 
	titles as tit
ON
	titau.title_id = tit.title_id
LEFT JOIN
	publishers as pub
ON
	tit.pub_id=pub.pub_id
WHERE tit.title IS not null;


#CHALLENGE 2
SELECT
au.au_id as AUTHOR_ID, au.au_lname as LAST_NAME, au.au_fname as FIRST_NAME, pub.pub_name as PUBLISHER, count(titau.title_id)
FROM
	authors as au
LEFT JOIN
	titleauthor as titau
ON au.au_id = titau.au_id
LEFT JOIN 
	titles as tit
ON
	titau.title_id = tit.title_id
LEFT JOIN
	publishers as pub
ON
	tit.pub_id=pub.pub_id
WHERE tit.title IS not null
GROUP BY au.au_id,pub.pub_id
;


#CHALLENGE 3
SELECT
au.au_id as AUTHOR_ID, au.au_lname as LAST_NAME, au.au_fname as FIRST_NAME, sum(sales.qty) AS TOTAL
FROM
	authors as au
LEFT JOIN
	titleauthor as titau
ON au.au_id = titau.au_id
LEFT JOIN 
	titles as tit
ON
	titau.title_id = tit.title_id
JOIN sales
on tit.title_id = sales.title_id
WHERE tit.title IS not null
group by au.au_id
order by sum(sales.qty) DESC
LIMIT 3
;

#CHALLENGE 4
SELECT
au.au_id as AUTHOR_ID, au.au_lname as LAST_NAME, au.au_fname as FIRST_NAME, COALESCE(sum(sales.qty),0) AS TOTAL
FROM
	authors as au
LEFT JOIN
	titleauthor as titau
ON au.au_id = titau.au_id

LEFT JOIN sales
on titau.title_id = sales.title_id

group by au.au_id
order by sum(sales.qty) DESC
limit 23;

#BONUS
SELECT 
	a.au_id AS AUTHOR_ID, 
	a.au_lname AS LAST_NAME, 
	a.au_fname AS FIRST_NAME, 
	sum(((titles.price *titles.royalty/100)+titles.advance)*(ta.royaltyper/100)) AS PROFIT
 
FROM
	titles
JOIN
	titleauthor AS ta
ON
	titles.title_id = ta.title_id
JOIN authors AS a
ON ta.au_id = a.au_id
group by (a.au_id)
order by PROFIT DESC
LIMIT 3;
    