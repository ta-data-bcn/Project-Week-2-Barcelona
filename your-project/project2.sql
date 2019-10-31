use Project2;
#create temporary table country_year_sumnum #Creat a table with the total number of immigrants per natinality per year
select Nationality as n, Year as y, sum(Number) as num
from immigrants_by_nationality
group by n, y
order by num desc;

use Project2; # To sum the number of immigrants by country with disregards to years
select n, sum(num)
from country_year_sumnum
group by n;

use Project2; # To sum the number of immigrants by country with disregards to years
select n, sum(num)
from country_year_sumnum
group by n;

use Project2; # To sum the number of immigrants by country in 2015
select Nationality as n, Year as y, sum(Number) as num
from immigrants_by_nationality
where Year = 2015
group by n, y
order by num desc;


use Project2; # To sum the number of immigrants by country in 2016
select Nationality as n, Year as y, sum(Number) as num
from immigrants_by_nationality
where Year = 2016
group by n, y
order by num desc;


use Project2; # To sum the number of immigrants by country in 2017
select Nationality as n, Year as y, sum(Number) as num
from immigrants_by_nationality
where Year = 2017
group by n, y
order by num desc;

use Project2; # To know the Top 5 districts among Italy immigrants
select `District Name` as d, Nationality, sum(Number) as num
from immigrants_by_nationality
where Nationality = 'Italy'
group by d, Nationality
order by num desc limit 5;


use Project2; # To know the Top 5 districts among Pakistan immigrants:
select `District Name` as d, Nationality, sum(Number) as num
from immigrants_by_nationality
where Nationality = 'Pakistan'
group by d, Nationality
order by num desc limit 5;


use Project2; # To know the Top 5 districts among China immigrants:
select `District Name` as d, Nationality, sum(Number) as num
from immigrants_by_nationality
where Nationality = 'China'
group by d, Nationality
order by num desc limit 5;


use Project2; # To know the Top 5 districts among Colombia immigrants:
select `District Name` as d, Nationality, sum(Number) as num
from immigrants_by_nationality
where Nationality = 'Colombia'
group by d, Nationality
order by num desc limit 5;


use Project2; # To know the Top 5 districts among France immigrants:
select `District Name` as d, Nationality, sum(Number) as num
from immigrants_by_nationality
where Nationality = 'France'
group by d, Nationality
order by num desc limit 5;

use Project2; # To know the number of immigrants (Non spain) in each of the top 10 districts
select `District Name` as d, sum(Number) as num
from immigrants_by_nationality
where Nationality != 'Spain'
group by d
order by num desc limit 10;

# This was a dataset that we imported, we were just having a look at it to get some insights.
use Project2;
select Nacionalitat as n, Any as y, sum(Nombre) as num
from nacionalitat_per_sex
where Any = 2019 #and Nacionalitat != 'Espanya'
group by n, y
order by num desc
limit 11;