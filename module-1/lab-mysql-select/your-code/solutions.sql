# Challenge 1 - What titles each author has published at which publishers.

SELECT au.au_id as "AUTHOR ID", au.au_lname as "LAST NAME", au.au_fname as "FIRST NAME", 
t.title as "TITLE", pub.pub_name as "PUBLISHER"
FROM authors as au
RIGHT JOIN titleauthor as tau
ON au.au_id = tau.au_id
LEFT JOIN titles as t
ON tau.title_id = t.title_id
LEFT JOIN publishers as pub
ON t.pub_id = pub.pub_id
ORDER BY au.au_id

# Challenge 2 - How many titles each author has published at each publisher.

SELECT au.au_id as "AUTHOR ID", au.au_lname as "LAST NAME",
au.au_fname as "FIRST NAME", pub.pub_name as "PUBLISHER", count(t.title) as "TOTAL"
FROM authors as au
RIGHT JOIN titleauthor as tau
ON au.au_id = tau.au_id
LEFT JOIN titles as t
ON tau.title_id = t.title_id
LEFT JOIN publishers as pub
ON t.pub_id = pub.pub_id
group by au.au_id, pub.pub_name
order by au.au_id desc

# Challenge 3 - Who are the top 3 authors who have sold the highest number of titles?

SELECT au.au_id as "AUTHOR ID", au.au_lname as "LAST NAME", au.au_fname as "FIRST NAME", sum(t.ytd_sales) as "TOTAL"
FROM authors as au
LEFT JOIN titleauthor as tau
ON au.au_id = tau.au_id
LEFT JOIN titles as t
ON tau.title_id = t.title_id
where t.ytd_sales IS NOT null
group by au.au_id
order by total desc
limit 3

# Challenge 4 - Best Selling Authors Ranking

SELECT au.au_id as "AUTHOR ID", au.au_lname as "LAST NAME", au.au_fname as "FIRST NAME", COALESCE(sum(t.ytd_sales), 0) as "TOTAL"
FROM authors as au
LEFT JOIN titleauthor as tau
ON au.au_id = tau.au_id
LEFT JOIN titles as t
ON tau.title_id = t.title_id
group by au.au_id
order by total desc

# Challenge 5 - Bonus

select au.au_id as "AUTHOR ID", au.au_lname as "LAST NAME", au.au_fname as "FIRST NAME",
round((t.advance*(tau.royaltyper/100))+(((t.price*t.ytd_sales)*(t.royalty/100))*(tau.royaltyper/100)),2) as "PROFITS"
from authors as au
LEFT JOIN titleauthor as tau
ON au.au_id = tau.au_id
LEFT JOIN titles as t
ON tau.title_id = t.title_id
where t.title_id is not null
group by au.au_id
order by profits desc
limit 3