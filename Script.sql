-- como sazer chamdo SQLite
SELECT ArtistId AS Artist_ID, Name AS Artist_Name
FROM artists LIMIT 15;


SELECT * from customers LIMIT 55;

-- selecão dos cliente do brazil 
SELECT * from customers WHERE Country = "Brazil";


/*


| **Operador** | **Descripción**                                            |
| ------------ | ---------------------------------------------------------- |
| `=`          | Igual a. Compara si dos valores son iguales.               |
| `!=`         | Diferente de. Verdadero si los valores **no** son iguales. |
| `<>`         | Diferente de (alternativa a `!=`).                         |
| `>`          | Mayor que.                                                 |
| `<`          | Menor que.                                                 |
| `>=`         | Mayor o igual que.                                         |
| `<=`         | Menor o igual que.                                         |




| **Operador**                          | **Descripción**                                             |
| ------------------------------------- | ----------------------------------------------------------- |
| `AND`                                 | Verdadero solo si **todas** las condiciones son verdaderas. |
| `OR`                                  | Verdadero si **al menos una** condición es verdadera.       |
| `NOT`                                 | Nega una condición.                                         |


*/


-- selecão dos cliente do brazil com os filtro  AND / <>
SELECT * from customers WHERE Country = "Brazil" AND "State" = "SP";

-- selecão dos cliente do brazil com os filtro  AND / <>
SELECT * from customers WHERE Country = "Brazil" AND "State" <> "SP";


SELECT * from customers 
WHERE Country = "Brazil" 
AND "State" =  "SP" 
AND "City" =  "São Paulo";


SELECT * from customers 
WHERE Country = "Brazil" 
AND "State" =  "SP" 
AND "City" <>  "São Paulo" LIMIT 1;



SELECT "FirstName", "LastName", "City" from customers 
WHERE Country = "Brazil" 
AND "State" =  "SP" 
AND "City" <>  "São Paulo";



-- Agrupando valores com as aggregation functions

SELECT COUNT(*) FROM customers where Country = 'Brazil';

-- forma incorreta
SELECT * FROM customers where Country = 'Brazil';


-- contar cliente de forma mas correta
SELECT State, COUNT(*) AS  Cliente FROM customers where Country = 'Brazil' GROUP BY State;



SELECT City,  State, COUNT(*) AS  Cliente FROM customers where Country = 'Brazil' GROUP BY City,  State;



SELECT 
    BillingCity, 
    BillingState, COUNT(*) 
FROM invoices  
where BillingCountry = 'Brazil' GROUP BY BillingCity, 
    BillingState;


-- pegar os cliente ,as de 10 notas


SELECT 
    BillingCity, 
    BillingState, COUNT(*) AS QTDNotas
FROM invoices  
where BillingCountry = 'Brazil' GROUP BY BillingCity, 
      BillingState;

-- Filtrando dados agrupados

SELECT 
    BillingCity, 
    BillingState, COUNT(*) AS QTDNotas 
FROM invoices  
where BillingCountry = 'Brazil' 
GROUP BY BillingCity, 
         BillingState
HAVING COUNT(*) > 10; -- 14


SELECT 
    BillingCity, 
    BillingState, COUNT(*) AS QTDNotas, SUM(Total) AS VlrNotas -- = São Paulo	SP	35	190.1
FROM invoices  
where BillingCountry = 'Brazil' 
GROUP BY BillingCity, 
         BillingState
HAVING COUNT(*) < 10 AND SUM(Total) > 38; 
-- = São José dos Campos	SP	7	39.62



