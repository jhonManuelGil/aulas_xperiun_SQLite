



-- =======================================  como sazer chamdo SQLite


SELECT ArtistId AS Artist_ID, Name AS Artist_Name
FROM artists LIMIT 5;

/*
1	AC/DC
2	Accept
3	Aerosmith
4	Alanis Morissette
5	Alice In Chains
 
 */


SELECT * from customers LIMIT 5;
/*
1	Luís	Gonçalves	Embraer - Empresa Brasileira de Aeronáutica S.A.	Av. Brigadeiro Faria Lima, 2170	São José dos Campos	SP	Brazil	12227-000	+55 (12) 3923-5555	+55 (12) 3923-5566	luisg@embraer.com.br	3
2	Leonie	Köhler		Theodor-Heuss-Straße 34	Stuttgart		Germany	70174	+49 0711 2842222		leonekohler@surfeu.de	5
3	François	Tremblay		1498 rue Bélanger	Montréal	QC	Canada	H2G 1A7	+1 (514) 721-4711		ftremblay@gmail.com	3
4	Bjørn	Hansen		Ullevålsveien 14	Oslo		Norway	0171	+47 22 44 22 22		bjorn.hansen@yahoo.no	4
5	František	Wichterlová	JetBrains s.r.o.	Klanova 9/506	Prague		Czech Republic	14700	+420 2 4172 5555	+420 2 4172 5555	frantisekw@jetbrains.com	4 
 */





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


-- =======================================  selecão dos cliente do brazil com os filtro  AND / <>
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



-- =======================================  Agrupando valores com as aggregation functions

SELECT COUNT(*) FROM customers where Country = 'Brazil';

-- forma incorreta
SELECT * FROM customers where Country = 'Brazil';


-- contar cliente de forma mas correta
SELECT State, COUNT(*) AS  Cliente FROM customers where Country = 'Brazil' GROUP BY State;

/*
 DF	1
 RJ	1
 SP	3
 */

SELECT City,  State, COUNT(*) AS  Cliente FROM customers where Country = 'Brazil' GROUP BY City,  State;
/*
 Brasília	DF	1
 Rio de Janeiro	RJ	1
 São José dos Campos	SP	1
 São Paulo	SP	2
 */


SELECT 
    BillingCity, 
    BillingState, COUNT(*) 
FROM invoices  
where BillingCountry = 'Brazil' GROUP BY BillingCity, 
    BillingState;
/*
 Brasília	DF	7
 Rio de Janeiro	RJ	7
 São José dos Campos	SP	7
 São Paulo	SP	14
 */




SELECT 
    BillingCity, 
    BillingState, COUNT(*) AS QTDNotas
FROM invoices  
where BillingCountry = 'Brazil' GROUP BY BillingCity, 
      BillingState;
/*
 Brasília	DF	7
Rio de Janeiro	RJ	7
São José dos Campos	SP	7
São Paulo	SP	14
 */


-- =======================================  Filtrando dados agrupados

SELECT 
    BillingCity, 
    BillingState, COUNT(*) AS QTDNotas 
FROM invoices  
where BillingCountry = 'Brazil' 
GROUP BY BillingCity, 
         BillingState
HAVING COUNT(*) > 10; -- 14
-- São Paulo	SP	14

SELECT 
    BillingCity, 
    BillingState, COUNT(*) AS QTDNotas, SUM(Total) AS VlrNotas -- = São Paulo	SP	35	190.1
FROM invoices  
where BillingCountry = 'Brazil' 
GROUP BY BillingCity, 
         BillingState
HAVING COUNT(*) < 10 AND SUM(Total) > 38; 
-- = São José dos Campos	SP	7	39.62

 SELECT 
    BillingCity,
    BillingState,
    COUNT(*) AS QtdNotas,
    SUM(total) as VlrNotas
FROM invoices
WHERE BillingCountry = 'Brazil'
GROUP BY 
    BillingCity,
    BillingState
HAVING COUNT(*) < 10
AND SUM(total) >38

-- Brasília	DF	7	37.62
-- Rio de Janeiro	RJ	7	37.62
-- São José dos Campos	SP	7	39.62
-- São Paulo	SP	14	75.24


-- ======================================= Filtrando dados agrupados


SELECT * FROM invoices WHERE "BillingCountry" = 'Brazil'


SELECT  
    "BillingCity",
    "BillingState",
    count(*) AS QtdNotas,
    sum(total) as VlrNotas
FROM invoices 
WHERE "BillingCountry" = 'Brazil'
GROUP BY
    "BillingCity",
    "BillingState"
HAVING count(*) < 10
AND sum(total) > 38

-- ================================== Relacionando tabelas ===============================

SELECT * 
FROM  artists
INNER JOIN albums
   ON(artists."ArtistId" = albums."AlbumId")
WHERE artists."ArtistId" =  16;

SELECT * 
FROM albums a
WHERE "ArtistId" = 16

---- ========================= FIN 
  







