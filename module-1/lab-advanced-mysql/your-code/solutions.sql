#Challenge 1 - Most Profiting Authors

#Step 1: Calculate the royalties of each sales for each author

select
ta.au_id as Author_ID,
ta.title_id as Title_ID,
t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100 as Royalty
from titleauthor as ta
left join titles as t on t.title_id=ta.title_id
left join sales as s on s.title_id=ta.title_id;


#Step 2: Aggregate the total royalties for each title for each author

-- select
-- ta.au_id as Author_ID,
-- ta.title_id as Title_ID,
-- sum(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100) as Royalty
-- from titleauthor as ta
-- left join titles as t on t.title_id=ta.title_id
-- left join sales as s on s.title_id=ta.title_id
-- group by ta.au_id, ta.title_id;

#=====================
select
temp.Author_ID,
sum(temp.Royalty) as Royalty
from
(select
ta.au_id as Author_ID,
ta.title_id as Title_ID,
t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100 as Royalty
from titleauthor as ta
left join titles as t on t.title_id=ta.title_id
left join sales as s on s.title_id=ta.title_id) as temp
group by temp.Author_ID, temp.Title_ID
order by Royalty desc;




#Step 3: Calculate the total profits of each author

-- select
-- ta.au_id as Author_ID,
-- round(sum(t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100)+sum(t.advance*ta.royaltyper / 100),2) as Profit
-- from titleauthor as ta
-- left join titles as t on t.title_id=ta.title_id
-- left join sales as s on s.title_id=ta.title_id
-- group by ta.au_id, ta.title_id
-- order  by Profit desc

select
temp.Author_ID,
round(sum(temp.Royalty)+sum(t2.advance*ta2.royaltyper/100),2) as Profit

from
(select
ta.au_id as Author_ID,
ta.title_id as Title_ID,
t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100 as Royalty
from titleauthor as ta
left join titles as t on t.title_id=ta.title_id
left join sales as s on s.title_id=ta.title_id) as temp

inner join titles as t2 on t2.title_id=temp.Title_ID
inner join titleauthor as ta2 on ta2.title_id=temp.Title_ID
group by temp.Author_ID, temp.Title_ID
order by Profit desc
limit 3;

# Challenge 2 - Alternative Solution
# Tabla temporal

CREATE TEMPORARY TABLE royalties
select
ta.au_id as Author_ID,
ta.title_id as Title_ID,
t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100 as Royalty
from titleauthor as ta
left join titles as t on t.title_id=ta.title_id
left join sales as s on s.title_id=ta.title_id;

select 
temp.Author_ID,
round(sum(temp.Royalty)+sum(t.advance*ta.royaltyper/100),2) as Profit
from royalties temp
inner join titles as t on t.title_id=temp.Title_ID
inner join titleauthor as ta on ta.title_id=temp.Title_ID
group by temp.Author_ID, temp.Title_ID
order by Profit desc
limit 3;


#Challenge 3

CREATE TABLE most_profiting_authors
select
temp.Author_ID,
round(sum(temp.Royalty)+sum(t2.advance*ta2.royaltyper/100),2) as Profit

from
(select
ta.au_id as Author_ID,
ta.title_id as Title_ID,
t.price * s.qty * t.royalty / 100 * ta.royaltyper / 100 as Royalty
from titleauthor as ta
left join titles as t on t.title_id=ta.title_id
left join sales as s on s.title_id=ta.title_id) as temp

inner join titles as t2 on t2.title_id=temp.Title_ID
inner join titleauthor as ta2 on ta2.title_id=temp.Title_ID
group by temp.Author_ID, temp.Title_ID
order by Profit desc
limit 3;


select * from most_profiting_authors





