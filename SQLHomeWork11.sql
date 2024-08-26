--actor ve customer tablolarında bulunan first_name sütunları için tüm verileri sıralayalım
SELECT first_name 
FROM actor

UNION

SELECT first_name 
FROM customer

ORDER BY first_name;


--actor ve customer tablolarında bulunan first_name sütunları için kesişen verileri sıralayalım.
SELECT first_name 
FROM actor

INTERSECT

SELECT first_name 
FROM customer;

--actor ve customer tablolarında bulunan first_name sütunları için ilk tabloda bulunan ancak ikinci tabloda bulunmayan verileri sıralayalım.
SELECT first_name 
FROM actor

EXCEPT

SELECT first_name 
FROM customer;

--İlk 3 sorguyu tekrar eden veriler için de yapalım.
SELECT a.first_name
FROM (
    SELECT first_name
    FROM actor
    GROUP BY first_name
    HAVING COUNT(*) > 1
) a
INNER JOIN (
    SELECT first_name
    FROM customer
    GROUP BY first_name
    HAVING COUNT(*) > 1
) c ON a.first_name = c.first_name;