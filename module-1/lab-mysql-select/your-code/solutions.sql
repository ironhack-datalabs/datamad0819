# Challenge 1 - Who Have Published What At Where?

select a.au_id as AUTHOR_ID,
	a.au_lname as LAST_NAME,
    a.au_fname as FIRST_NAME,
    t.title as TITLE,
    p.pub_name as PUBLISHER
from authors as a
RIGHT JOIN titleauthor as ta on a.au_id=ta.au_id
LEFT JOIN titles as t on ta.title_id=t.title_id
LEFT JOIN publishers as p on t.pub_id=p.pub_id;


#Challenge 2 - Who Have Published How Many At Where?

select 
	a.au_id as AUTHOR_ID,
	a.au_lname as LAST_NAME,
    a.au_fname as FIRST_NAME,
    p.pub_name as PUBLISHER,
    count(t.title_id) as TITLE_COUNT
from authors as a
RIGHT JOIN titleauthor as ta on a.au_id=ta.au_id
LEFT JOIN titles as t on ta.title_id=t.title_id
LEFT JOIN publishers as p on t.pub_id=p.pub_id
GROUP BY a.au_id,p.pub_id;


#Challenge 3 - Best Selling Authors

Select 
	a.au_id as AUTHOR_ID,
	a.au_lname as LAST_NAME,
    a.au_fname as FIRST_NAME,
    sum(qty) as TOTAL
from authors as a
RIGHT JOIN titleauthor as ta on a.au_id=ta.au_id
LEFT JOIN sales as s on ta.title_id=s.title_id
group by a.au_id
order by TOTAL desc
limit 3;

#Challenge 4 - Best Selling Authors Ranking


Select 
	a.au_id as AUTHOR_ID,
	a.au_lname as LAST_NAME,
    a.au_fname as FIRST_NAME,
    IFNULL(sum(s.qty),0) as TOTAL
from authors as a
LEFT JOIN titleauthor as ta on a.au_id=ta.au_id
LEFT JOIN sales as s on ta.title_id=s.title_id
group by a.au_id
order by TOTAL desc;

# Bonus Challenge - Most Profiting Authors

Select 
	a.au_id as AUTHOR_ID,
	a.au_lname as LAST_NAME,
    a.au_fname as FIRST_NAME,
	sum((t.advance+t.price*t.ytd_sales*(t.royalty/100))*(ta.royaltyper/100)) as PROFIT
    from authors as a
LEFT JOIN titleauthor as ta on a.au_id=ta.au_id
LEFT JOIN titles as t on ta.title_id=t.title_id
LEFT JOIN sales as s on ta.title_id=s.title_id
group by a.au_id
order by PROFIT DESC
limit 3;






