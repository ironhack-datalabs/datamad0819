# Challenge 1

SELECT au.au_id as "AUTHOR ID", au.au_lname as "LAST NAME", au.au_fname as "FIRST NAME",
t.title as "TITLE", p.pub_name as "PUBLISHER" FROM authors as au
LEFT JOIN titleauthor as ta on au.au_id = ta.au_id
LEFT JOIN titles as t on ta.title_id = t.title_id
LEFT JOIN publishers as p on t.pub_id = p.pub_id
WHERE t.title != "null";

# Challenge 2

SELECT au.au_id as "AUTHOR ID", au.au_lname as "LAST NAME", au.au_fname as "FIRST NAME",
p.pub_name as "PUBLISHER", count(t.title_id) as "TITLE COUNT"FROM authors as au
LEFT JOIN titleauthor as ta on au.au_id = ta.au_id
LEFT JOIN titles as t on ta.title_id = t.title_id
LEFT JOIN publishers as p on t.pub_id = p.pub_id
WHERE t.title != "null"
GROUP BY au.au_id,p.pub_name;

# Challenge 3

SELECT au.au_id as "AUTHOR ID", au.au_lname as "LAST NAME", au.au_fname as "FIRST NAME",
sum(t.ytd_sales) as "TOTAL" FROM authors as au
LEFT JOIN titleauthor as ta on au.au_id = ta.au_id
LEFT JOIN titles as t on ta.title_id = t.title_id
WHERE t.title != "null"
GROUP BY au.au_id
ORDER BY TOTAL DESC
LIMIT 3;

# Challenge 4

SELECT au.au_id as "AUTHOR ID", au.au_lname as "LAST NAME", au.au_fname as "FIRST NAME",
ifnull(sum(t.ytd_sales),0) as "TOTAL"FROM authors as au
LEFT JOIN titleauthor as ta on au.au_id = ta.au_id
LEFT JOIN titles as t on ta.title_id = t.title_id
GROUP BY au.au_id
ORDER BY TOTAL DESC;

# Challenge Bonus

SELECT au.au_id as "AUTHOR ID", au.au_lname as "LAST NAME", au.au_fname as "FIRST NAME",
round(sum(t.ytd_sales*t.price*t.(royalty/100)*(ta.royaltyper/100)) + sum(t.advance*(ta.royaltyper)/100),0) as "PROFIT" 
FROM authors as au
LEFT JOIN titleauthor as ta on au.au_id = ta.au_id
LEFT JOIN titles as t on ta.title_id = t.title_id
GROUP BY au.au_id
ORDER BY PROFIT DESC
LIMIT 3;

