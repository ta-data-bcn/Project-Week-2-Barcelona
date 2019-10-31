use project2;

-- Create CLEAN/ NO DUPS accient
drop table accident;
create table accident 
select distinct codi_expedient_clean, codi_carrer,  Descripcio_causa_vianant 
from stg_accident
order by codi_expedient_clean;

-- Create CLEAN/ NO DUPS accient_datetime
select * from stg_accident_datetime;
drop table accident_datetime;
create table accident_datetime 
select distinct codi_expedient_clean, hora_dia,  dia_mes, mes_any, date
from stg_accident_datetime 
order by codi_expedient_clean;

-- Create CLEAN/ NO DUPS accient_location
select * from stg_accident_location;
drop table accident_location;
create table accident_location 
select distinct codi_expedient_clean, Coordenada_UTM_X, Coordenada_UTM_Y , Longitud, Latitud
from stg_accident_location 
order by codi_expedient_clean;

-- Create CLEAN/ NO DUPS accident_street
drop table accident_street;
create table accident_street 
select distinct codi_expedient_clean, nom_carrer_clean, nom_barri, nom_districte
from stg_street ;

-- New need to see number of accients by month
select distinct mes_any Month, count(a.codi_expedient_clean)
from accident a
left join accident_datetime adt on a.codi_expedient_clean = adt.codi_expedient_clean
group by mes_any
order by count(a.codi_expedient_clean) desc;

-- New need to see number of accients by day of month
select distinct dia_mes as 'Month', count(a.codi_expedient_clean) as 'No. Accidents'
from accident a
left join accident_datetime adt on a.codi_expedient_clean = adt.codi_expedient_clean
group by dia_mes
order by count(a.codi_expedient_clean) desc;

-- New need to see number of accients by hour of day
select distinct hora_dia as 'Time', count(a.codi_expedient_clean) as 'No. Accidents'
from accident a
left join accident_datetime adt on a.codi_expedient_clean = adt.codi_expedient_clean
group by hora_dia;
order by count(a.codi_expedient_clean) desc;

-- New need to see number of accidents by barrio
select distinct nom_barri 'Neighbourhood', count(a.codi_expedient_clean) as 'No. Accidents'
from accident a
inner join accident_street ast on a.codi_expedient_clean = ast.codi_expedient_clean
group by nom_barri;

