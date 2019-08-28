#USE publications;
SELECT authors.au_id as "AUTHOR ID", authors.au_lname as "LAST NAME",
authors.au_fname as "FIRST NAME", titles.title_id as "TITLE"
FROM authors
INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id=titles.title_id 


#NO CONSIGO ENTENDER EL CONCEPTO
#Espero poder resolverlo mas adelante, porque ahora no consigo pillarlo.