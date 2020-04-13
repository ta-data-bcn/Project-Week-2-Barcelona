USE Barrios;

## Neighborhoods by District
Select NOM_DISTRICTE, count(NOMB_BARRI) as Qty
FROM Barrios
GROUP BY NOM_DISTRICTE;

## Number of people per Neighborhood
SELECT Distrito, Barrio , sum(Numero) as People
FROM Population
GROUP BY Barrio
ORDER BY People DESC
LIMIT 10;

## Number of unemployed people per Neighborhood
SELECT Barrio , sum(Numero) as People
FROM Unemployment
GROUP BY Barrio, SItuacion
ORDER BY People DESC;


## Number of Bars
SELECT * FROM CensoActividades
WHERE NombreActividad LIKE 'Bars%';

## Number of Bars, Restaurants and Food Services per Neighborhood
SELECT Distrito ,Barrio, count(NombreLocal) as Companies
FROM CensoActividades
WHERE NombreActividad LIKE 'Bars%' or NombreActividad = 'serveis de menjar i begudes' or NombreActividad = 'Restaurants' or NombreActividad = 'Serveis de menjar take away MENJAR RÀPID' or NombreActividad = 'Bars especials amb actuació / Bars musicals / Discoteques /PUB'
group by Barrio
ORDER BY Companies DESC
LIMIT 10;

## Top 10 neighborhoods with less unemployment
SELECT Unemployment.Barrio , sum(P.Numero) as Unemployed
FROM Unemployment
JOIN Barrios B on Unemployment.Barrio = B.NOMB_BARRI
JOIN Population P on B.NOMB_BARRI = P.Barrio
GROUP BY Barrio, SItuacion
ORDER BY Unemployed ASC
LIMIT 10;

## Calculate age range per Neighborhood
SELECT Year, AgeRange,Barrio , sum(Numero) as People
FROM Population
GROUP BY AgeRange, Year, Barrio
ORDER BY Year DESC;

## Calculate Age Range of People by Neighborhood
SELECT Distrito, Barrio, AVG(EdadMedia) as EdadMedia
FROM PoblacionPorEdadesYNac
GROUP BY Barrio
ORDER BY EdadMedia ASC;

## Unemployment Rate (Not Working)
SELECT Population.Barrio, SUM(Population.Numero) as People, SUM(U.Numero), U.Gender, (SUM(U.Numero)/SUM(Population.Numero)*100) as Rate
FROM Population
INNER JOIN Unemployment U on Population.Barrio = U.Barrio and U.SItuacion = "Atur registrat"
GROUP BY Population.Barrio,U.Gender
ORDER BY People DESC
LIMIT 12;

## price directly on those with the lowest average age
SELECT PrecioLocalesComerciales.Barrio, PrecioLocalesComerciales.Precio2011, PrecioLocalesComerciales.Precio2010, PrecioLocalesComerciales.Precio2009, AVG(PPEYN.EdadMedia) AS Average
FROM PrecioLocalesComerciales
INNER JOIN PoblacionPorEdadesYNac PPEYN on PrecioLocalesComerciales.Barrio = PPEYN.Barrio
GROUP BY PrecioLocalesComerciales.Barrio
ORDER BY Average ASC;


SELECT PrecioLocalesComerciales.Barrio, PrecioLocalesComerciales.Precio2011, PrecioLocalesComerciales.Precio2010, PrecioLocalesComerciales.Precio2009, AVG(PPEYN.EdadMedia) AS Average
FROM PrecioLocalesComerciales
    INNER JOIN PoblacionPorEdadesYNac PPEYN on PrecioLocalesComerciales.Barrio = PPEYN.Barrio
GROUP BY PrecioLocalesComerciales.Barrio
ORDER BY Average ASC;
