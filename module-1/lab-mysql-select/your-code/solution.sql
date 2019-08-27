SELECT 
	ta.au_id,au.au_lname,au.au_fname,t.title,p.pub_name
FROM
    titleauthor AS ta
    LEFT JOIN authors AS au
		ON ta.au_id=au.au_id
	LEFT JOIN titles AS t
		ON ta.title_id = t.title_id
	LEFT JOIN publishers AS p
		ON t.pub_id=p.pub_id;
	
    
    SELECT 
	ta.au_id,au.au_lname,au.au_fname,t.title,p.pub_name,count(ta.au_id) AS Numcount
FROM
    titleauthor AS ta
    LEFT JOIN authors AS au
		ON ta.au_id=au.au_id
	LEFT JOIN titles AS t
		ON ta.title_id = t.title_id
	LEFT JOIN publishers AS p
		ON t.pub_id=p.pub_id
GROUP BY p.pub_id,au_id;

SELECT
	ta.au_id,au.au_lname,au.au_fname,sum(t.ytd_sales) as TotalSales 
FROM
    titleauthor AS ta
    LEFT JOIN authors AS au
		ON ta.au_id=au.au_id
	LEFT JOIN titles AS t
		ON ta.title_id = t.title_id
	LEFT JOIN publishers AS p
		ON t.pub_id=p.pub_id
GROUP BY ta.au_id
ORDER BY TotalSales DESC
limit 3;

SELECT
	au.au_id,au.au_fname,au.au_lname, sum(IFNULL(t.ytd_sales,0)) AS Total_Sales
FROM authors as au
    LEFT JOIN titleauthor AS ta
		ON au.au_id=ta.au_id
	LEFT JOIN titles AS t
		ON ta.title_id=t.title_id
GROUP BY au.au_id
ORDER BY Total_Sales DESC;

SELECT
	au.au_id,au.au_fname,au.au_lname, t.title,t.advance, ta.royaltyper,IFNULL(t.ytd_sales,0) AS Total_Sales, sum(t.advance+(ta.royaltyper/100)*IFNULL(t.ytd_sales,0)) AS Total_profit
FROM authors as au
    LEFT JOIN titleauthor AS ta
		ON au.au_id=ta.au_id
	LEFT JOIN titles AS t
		ON ta.title_id=t.title_id
GROUP BY au.au_id
ORDER BY Total_profit DESC	
LIMIT 3;



	

	
	