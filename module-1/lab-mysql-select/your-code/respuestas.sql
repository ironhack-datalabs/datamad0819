#Primer ejercicio
#USE publications;
SELECT authors.au_id as "AUTHOR ID", authors.au_lname as "LAST NAME",
authors.au_fname as "FIRST NAME", titles.title_id as "TITLE", publishers.pub_name as "PUBLISHER"
FROM authors
INNER JOIN titleauthor ON authors.au_id=titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id=titles.title_id 
INNER JOIN publishers ON titles.pub_id =publishers.pub_id
ORDER BY authors.au_id

#Segundo ejercicio


#Estuve intentando entender el concepto lo que me demoro mucho.
#Espero poder resolverlo mas adelante, porque ahora no consigo pillarlo.