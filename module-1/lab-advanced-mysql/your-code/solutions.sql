USE publications;

#SUB QUERIES
SELECT
    total_royalties.au_id,
    sum(advance)+SUM(total_royalties) as profits,
    au_fname,
    au_lname
FROM
    (SELECT
        title_id, 
        au_id,
        advance, 
        sum(royalties) AS total_royalties
    FROM
        (SELECT
            titles.title_id,
            price,
            advance,
            royalty,
            qty,
            au_id,
            royaltyper,
            (qty*price*royalty*royaltyper/10000) AS royalties
        FROM
            titles
            LEFT JOIN
                sales
                ON titles.title_id = sales.title_id
            LEFT JOIN
                titleauthor
                ON titles.title_id = titleauthor.title_id) AS royalties
    GROUP BY title_id, au_id) AS total_royalties
    LEFT JOIN
		authors
        ON total_royalties.au_id = authors.au_id
GROUP BY au_id
ORDER BY profits DESC
LIMIT 3;

#TEMPORARY TABLES
CREATE TEMPORARY TABLE royalties
SELECT
    titles.title_id,
    price,
    advance,
    royalty,
    qty,
    au_id,
    royaltyper,
    (qty*price*royalty*royaltyper/10000) AS royalties
FROM
    titles
    LEFT JOIN
        sales
        ON titles.title_id = sales.title_id
    LEFT JOIN
        titleauthor
        ON titles.title_id = titleauthor.title_id;
CREATE TEMPORARY TABLE total_royalties
SELECT
    title_id, 
    au_id,
    MAX(advance) AS advance, 
    SUM(royalties) AS total_royalties
FROM
   royalties
GROUP BY title_id, au_id;
CREATE TEMPORARY TABLE profits
SELECT
    au_id,
    SUM(advance)+SUM(total_royalties) AS profits
FROM
    total_royalties
GROUP BY au_id;
SELECT
    profits.au_id,
    profits,
    au_fname,
    au_lname
FROM
    profits
    LEFT JOIN
		authors
        ON profits.au_id = authors.au_id
ORDER BY profits DESC
LIMIT 3;

#CREATE PERMANENT TABLE
CREATE TABLE most_profiting_authors
SELECT
    profits.au_id,
    profits,
    au_fname,
    au_lname
FROM
    profits
    LEFT JOIN
		authors
        ON profits.au_id = authors.au_id
ORDER BY profits DESC;












'''''

#FIRST TRY

# SUB QUERIES
SELECT
    profit.au_id,
    (profit.total_royalties_all_books + profit.advance_all_books) as profit
FROM
    (SELECT
        total_royalties.au_id,
        SUM(total_royalties.total_royalties_each_book) AS total_royalties_all_books,
        SUM(total_royalties.advance_each_book) AS advance_all_books
    FROM
        (SELECT
            royalties.title_id,
            MAX(royalties.au_id) as au_id,
            SUM(royalties.sales_royalty) as total_royalties_each_book,
            MAX(royalties.advance) as advance_each_book
        FROM
            (SELECT 
                titles.title_id,
                titleauthor.au_id, 
                (titles.price*sales.qty*(titles.royalty/100)*(titleauthor.royaltyper/100)) AS sales_royalty,
                titles.advance
            FROM titleauthor
                LEFT JOIN titles
                ON titleauthor.title_id = titles.title_id
                LEFT JOIN sales
                ON titles.title_id = sales.title_id) as royalties
            GROUP BY royalties.title_id) as total_royalties
        GROUP BY total_royalties.au_id) as profit
    ORDER BY profit DESC
LIMIT 3;

# TEMPORARY TABLES
CREATE TEMPORARY TABLE royalties
    SELECT 
        titles.title_id,
        titleauthor.au_id, 
        (titles.price*sales.qty*(titles.royalty/100)*(titleauthor.royaltyper/100)) AS sales_royalty,
        titles.advance
    FROM titleauthor
        LEFT JOIN titles
        ON titleauthor.title_id = titles.title_id
        LEFT JOIN sales
        ON titles.title_id = sales.title_id;
CREATE TEMPORARY TABLE total_royalties
    SELECT
        royalties.title_id,
        MAX(royalties.au_id) as au_id,
        SUM(royalties.sales_royalty) as total_royalties_each_book,
        MAX(royalties.advance) as advance_each_book
    FROM
        royalties
        GROUP BY royalties.title_id;
CREATE TEMPORARY TABLE profit
    SELECT
        total_royalties.au_id,
        SUM(total_royalties.total_royalties_each_book) AS total_royalties_all_books,
        SUM(total_royalties.advance_each_book) AS advance_all_books
        FROM
            total_royalties
        GROUP BY total_royalties.au_id;
SELECT
    profit.au_id,
    (profit.total_royalties_all_books + profit.advance_all_books) as profit
FROM
    profit
    ORDER BY profit DESC
LIMIT 3;
 '''''