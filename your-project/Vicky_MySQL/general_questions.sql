USE project_week_2;


SELECT * FROM population;

# 1. How many people live in Barcelona in by year?

SELECT SUM(Number), Year FROM population GROUP BY Year;
# '1620809','2017'
# '1608746','2016'
# '1604555','2015'
# '1602386','2014'
# '1611822','2013'

# 2. How many and which districts are there? (external: find out size)

SELECT Count(`District.Name`), `District.Name` FROM population GROUP BY `District.Name`;
# '3840','Ciutat Vella'
# '5760','Eixample'
# '7680','Sants-Montjuïc'
# '2880','Les Corts'
# '5760','Sarrià-Sant Gervasi'
# '4800','Gràcia'
# '10560','Horta-Guinardó'
# '12480','Nou Barris'
# '6720','Sant Andreu'
# '9600','Sant Martí'
# ten districts

SELECT SUM(Number), `District.Name`, `Year` FROM population WHERE `Year`= "2017" GROUP BY `District.Name`;
SELECT SUM(Number), `District.Name`, `Year` FROM population WHERE `Year`= "2013" GROUP BY `District.Name`;

# 3. How many neighbourhoods are there?

SELECT SUM(`Number`), `Neighborhood.Name`, Year FROM population WHERE Year = "2017" GROUP BY `Neighborhood.Name`;
# Note: 960 Count = people in each Neighborhood over time?
# there are 73 neighborhoods

# 4. How many people live in each district 2017?

SELECT Count(`District.Name`), `District.Name` FROM population WHERE Year = "2017" GROUP BY `District.Name` ;
# '768','Ciutat Vella'
# '1152','Eixample'
# '1536','Sants-Montjuïc'
# '576','Les Corts'
# '1152','Sarrià-Sant Gervasi'
# '960','Gràcia'
# '2112','Horta-Guinardó'
# '2496','Nou Barris'
# '1344','Sant Andreu'
# '1920','Sant Martí'

# 5. How many people live in each neighbourhood in 2017?

SELECT Count(`Neighborhood.Name`), `Neighborhood.Name` FROM population WHERE Year = "2017" GROUP BY `Neighborhood.Name`; 
# Note 192 in each Neighborhood in 2017
# Do again --> sum Numbers

# 6. Density per district
# See create table area

# 7. Density per neighbourhood
# N/A

# 8. Growth per district