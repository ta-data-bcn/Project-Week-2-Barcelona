use project2;
select distinct codi_expedient, codi_carrer,  Descripcio_causa_vianant from accident
-- group by 
order by codi_expedient;

-- Create CLEAN/ NO DUPS accient
drop table accident;
create table accident 
select distinct codi_expedient, codi_carrer,  Descripcio_causa_vianant 
from stg_accident
order by codi_expedient;

-- Create CLEAN/ NO DUPS accient_date_time
select * from stg_accident_datetime;
drop table accident_datetime;
create table accident_datetime 
select distinct codi_expedient, hora_dia,  dia_mes, mes_any 
from stg_accident_datetime 
order by codi_expedient;

-- Create CLEAN/ NO DUPS accient_location
select * from stg_accident_location;
drop table accident_location;
create table accident_location 
select distinct codi_expedient, Coordenada_UTM_X, Coordenada_UTM_Y , Longitud, Latitud
from stg_accident_location 
order by codi_expedient;

-- Create CLEAN/ NO DUPS accident_street
select * from stg_street;
drop table accident_street;
create table accident_street 
select distinct codi_carrer, nom_carrer, nom_barri, nom_districte
from stg_street 
order by codi_carrer;


-- New need to 

select distinct mes_any, count(a.codi_expedient)
from accident a
left join accident_datetime adt on a.codi_expedient = adt.codi_expedient
group by mes_any
order by count(a.codi_expedient) desc;





select * from accident_clean;

drop table accident_datetime;
drop table stg_data;
drop table stg_accident_location;
drop table accident_datetime;