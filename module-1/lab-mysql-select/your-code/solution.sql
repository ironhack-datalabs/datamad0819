#Challenge 1
SELECT 
ta.au_id as "AUTHOR ID",
au.au_lname as "LAST NAME",
au.au_fname as "FIRST NAME",
t.title as "TITLE",
p.pub_name as "PUBLISHER"
FROM titleauthor AS ta LEFT JOIN authors AS au ON ta.au_id=au.au_id
LEFT JOIN titles AS t ON ta.title_id = t.title_id
LEFT JOIN publishers AS p ON t.pub_id=p.pub_id;

#Challenge 2
SELECT 
ta.au_id as "AUTHOR ID",
au.au_lname as "LAST NAME",
au.au_fname as "FIRST NAME",
p.pub_name as "PUBLISHER",
count(t.title) as "TITLE COUNT"
FROM
titleauthor AS ta
LEFT JOIN authors AS au ON ta.au_id=au.au_id
LEFT JOIN titles AS t ON ta.title_id = t.title_id
LEFT JOIN publishers AS p ON t.pub_id=p.pub_id
GROUP BY au.au_id;

#Challenge 3
SELECT 
ta.au_id as "AUTHOR ID",
au.au_lname as "LAST NAME",
au.au_fname as "FIRST NAME",
count(t.title) as "TOTAL"
FROM
titleauthor AS ta
LEFT JOIN authors AS au ON ta.au_id=au.au_id
LEFT JOIN titles AS t ON ta.title_id = t.title_id
LEFT JOIN publishers AS p ON t.pub_id=p.pub_id
GROUP BY au.au_id
ORDER BY count(t.title) DESC,`LAST NAME`
LIMIT 3;

#Challenge 4
SELECT 
ta.au_id as "AUTHOR ID",
au.au_lname as "LAST NAME",
au.au_fname as "FIRST NAME",
IFNULL( count(t.title),0 ) as `TOTAL A`
FROM
titleauthor AS ta
RIGHT JOIN authors AS au ON ta.au_id=au.au_id
LEFT JOIN titles AS t ON ta.title_id = t.title_id
LEFT JOIN publishers AS p ON t.pub_id=p.pub_id
GROUP BY au.au_id
ORDER BY count(t.title) DESC,`LAST NAME`;

#Bonus excercise
SELECT 
ta.au_id as "AUTHOR ID",
au.au_lname as "LAST NAME",
au.au_fname as "FIRST NAME",
(ta.royaltyper/100)*(t.advance+IFNULL(t.ytd_sales,0)) as `PROFIT`
FROM
titleauthor AS ta
RIGHT JOIN authors AS au ON ta.au_id=au.au_id
LEFT JOIN titles AS t ON ta.title_id = t.title_id
LEFT JOIN publishers AS p ON t.pub_id=p.pub_id
GROUP BY `AUTHOR ID`
ORDER BY `PROFIT` DESC
LIMIT 3;





	