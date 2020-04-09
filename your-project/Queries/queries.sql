## Barrios por Distrito
Select NOM_DISTRICTE, count(NOMB_BARRI) as Qty
FROM Barrios
GROUP BY NOM_DISTRICTE;

## Cantidad de personas por Barrio
SELECT Distrito, Barrio , sum(Numero) as People
FROM Population
GROUP BY Barrio
ORDER BY People DESC
LIMIT 10;

## Cantidad de personas desempleadas por Barrio
SELECT Barrio , sum(Numero) as People
FROM Unemployment
GROUP BY Barrio, SItuacion
ORDER BY People DESC;

## Personas Desempleadas en el 2020
SELECT * FROM `Unemployment` WHERE `Ano` = '2020' ORDER BY `Numero` LIMIT 0,1000;

##
SELECT * FROM BusinessTypes WHERE ActivityName LIKE 'Bars%';

## Catidad de Bares
SELECT * FROM CensoActividades
WHERE NombreActividad LIKE 'Bars%';

## Cantidad de Bares por Barrio
SELECT Distrito ,Barrio, count(NombreLocal) as Companies
FROM CensoActividades
WHERE NombreActividad LIKE 'Bars%' or NombreActividad = 'serveis de menjar i begudes' or NombreActividad = 'Restaurants' or NombreActividad = 'Serveis de menjar take away MENJAR RÀPID' or NombreActividad = 'Bars especials amb actuació / Bars musicals / Discoteques /PUB'
group by Barrio
ORDER BY Companies DESC
LIMIT 10;

SELECT Barrio, count(NombreLocal) as Companies
FROM CensoActividades
WHERE NombreActividad LIKE 'Bars%' or NombreActividad = 'serveis de menjar i begudes' or NombreActividad = 'Restaurants' or NombreActividad = 'Serveis de menjar take away MENJAR RÀPID' or NombreActividad = 'Bars especials amb actuació / Bars musicals / Discoteques /PUB'
group by Barrio
ORDER BY Companies ASC
LIMIT 10;

## Top 10 barrios con menos desempleo
SELECT Barrio , sum(Numero) as Unemployed, sum(P.Numero)
FROM Unemployment
JOIN Barrios B on Unemployment.Barrio = B.NOMB_BARRI
JOIN Population P on B.NOMB_BARRI = P.Barrio
GROUP BY Barrio, SItuacion
ORDER BY Unemployed ASC
LIMIT 10;

## Calcular Rango Edad de las personas por Barrios
SELECT Year, AgeRange,Barrio , sum(Numero) as People
FROM Population
GROUP BY AgeRange, Year, Barrio
ORDER BY Year DESC;

SELECT Distrito, Barrio, AVG(EdadMedia) as EdadMedia
FROM PoblacionPorEdadesYNac
GROUP BY Barrio
ORDER BY EdadMedia ASC;


