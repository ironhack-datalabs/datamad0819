#1

SELECT 
    au.au_id AS AUTHOR,
    au.au_lname AS 'LAST NAME',
    au.au_fname AS 'FIRST NAME',
    t.title AS TITLE,
    pb.pub_name AS PUBLISHER
FROM
    authors AS au
        LEFT JOIN
    titleauthor AS ta ON au.au_id = ta.au_id
        LEFT JOIN
    titles AS t ON ta.title_id = t.title_id
        LEFT JOIN
     publishers AS pb ON t.pub_id = pb.pub_id
     where pb.pub_id is not null

#2
SELECT 
    au.au_id AS AUTHOR,
    au.au_lname AS 'LAST NAME',
    au.au_fname AS 'FIRST NAME',
    pb.pub_name AS PUBLISHER,
    count(t.title) as "Title Count"
     
FROM
    authors AS au
        LEFT JOIN
    titleauthor AS ta ON au.au_id = ta.au_id
        LEFT JOIN
    titles AS t ON ta.title_id = t.title_id
        LEFT JOIN
     publishers AS pb ON t.pub_id = pb.pub_id
     where pb.pub_id is not null
     group by au.au_id, pb.pub_name;

#3

SELECT 
    au.au_id AS AUTHOR,
    au.au_lname AS 'LAST NAME',
    au.au_fname AS 'FIRST NAME',
    sa.qty AS TOTAL
FROM
    authors AS au
        LEFT JOIN
    titleauthor AS ta ON au.au_id = ta.au_id
		left join
	sales as sa on ta.title_id = sa.title_id
       limit 3;
#4

SELECT 
    au.au_id AS AUTHOR,
    au.au_lname AS 'LAST NAME',
    au.au_fname AS 'FIRST NAME',
	coalesce(sum(sa.qty),0) AS TOTAL
FROM
    authors AS au
        LEFT JOIN
    titleauthor AS ta ON au.au_id = ta.au_id
		left join
	sales as sa on ta.title_id = sa.title_id
       group by au.au_id
       limit 23;