SELECT au.au_id as "AUTHOR ID", au.au_lname as "LAST NAME", au.au_fname as "FIRST NAME",
t.title as "TITLE", p.pub_name as "PUBLISHER" FROM authors as au
LEFT JOIN titleauthor as ta on au.au_id = ta.au_id
LEFT JOIN titles as t on ta.title_id = t.title_id
LEFT JOIN publishers as p on t.pub_id = p.pub_id
WHERE t.title != "null";


SELECT au.au_id as "AUTHOR ID", au.au_lname as "LAST NAME", au.au_fname as "FIRST NAME",
p.pub_name as "PUBLISHER", count(*) as "TITLE COUNT"FROM authors as au
LEFT JOIN titleauthor as ta on au.au_id = ta.au_id
LEFT JOIN titles as t on ta.title_id = t.title_id
LEFT JOIN publishers as p on t.pub_id = p.pub_id
WHERE t.title != "null"
GROUP BY au.au_id,p.pub_name;

