USE publications;

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

# CREATE PERMANENT TABLE
CREATE TABLE most_profiting_authors
SELECT
    profit.au_id,
    (profit.total_royalties_all_books + profit.advance_all_books) as profit 
FROM profit