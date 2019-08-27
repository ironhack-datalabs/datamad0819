SELECT
au.au_id as AUTHOR_ID, au.au_lname as LAST_NAME, au.au_fname as FIRST_NAME,  tit.title as TITLE, pub.pub_name as PUBLISHER
FROM
	authors as au
LEFT JOIN
	titleauthor as titau
ON au.au_id = titau.au_id
LEFT JOIN 
	titles as tit
ON
	titau.title_id = tit.title_id
LEFT JOIN
	publishers as pub
ON
	tit.pub_id=pub.pub_id;