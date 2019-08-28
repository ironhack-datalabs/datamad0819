SELECT 
authors.au_id as "AUTHOR ID",
authors.au_lname as "LAST NAME",
authors.au_fname as "FIRST NAME",
titles.title_id as "TITLE",
from 
authors
INNER JOIN titles ON authors.au_id=titles.au_id