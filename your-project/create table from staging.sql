use test;
select  distinct Descripcio_tipus_vehicle, count(*) from test_pan2sql3
group by Descripcio_tipus_vehicle
order by 
count(*) desc
limit 7;

select distinct Descripcio_tipus_vehicle, count(*) from test_pan2sql3 where Descripcio_tipus_vehicle in
('Autobús',
'Bicicleta',
'Ciclomotor',
'Furgoneta',
'Motocicleta',
'Taxi',
'Turisme')
group by Descripcio_tipus_vehicle;



-- 'Codi_districte'	'Nom_districte'	'Codi_barri'	'Nom_barri'	'Codi_carrer'	'Nom_carrer'
CREATE TABLE streets 
select 'Codi_carrer', 'Nom_carrer', 'Nom_barri','Nom_districte';

CREATE TABLE streets SELECT * FROM orig_tbl;

drop table streets;


-- get a table for street/ barrios
CREATE TABLE streets 
select Codi_carrer, Nom_carrer, Nom_barri,Nom_districte
 from test_pan2sql3;
 
 -- create master table for accident
drop table accident;
CREATE TABLE accident
select distinct Codi_expedient, Any, Mes_any, Dia_mes, Hora_dia, codi_carrer
from test_pan2sql3
  where Descripcio_tipus_vehicle in
('Autobús', 'Bicicleta', 'Ciclomotor', 'Furgoneta', 'Motocicleta', 'Taxi', 'Turisme');
 
-- 13984 vs -- 19079
select  Codi_expedient, Any, Mes_any, Dia_mes, Hora_dia, Descripcio_carnet
from test_pan2sql3;



 
 
 
 
 where Descripcio_tipus_vehicle in
('Autobús',
'Bicicleta',
'Ciclomotor',
'Furgoneta',
'Motocicleta',
'Taxi',
'Turisme');

select * from streets;
-- 18199 rows   --9648
select distinct(Codi_expedient) from test_pan2sql3
 where Descripcio_tipus_vehicle in
('Autobús', 'Bicicleta', 'Ciclomotor', 'Furgoneta', 'Motocicleta', 'Taxi', 'Turisme')
group by Codi_expedient;