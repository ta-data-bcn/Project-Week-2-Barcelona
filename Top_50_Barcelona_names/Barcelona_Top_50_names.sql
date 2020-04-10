CREATE DATABASE Population;

#DESCRIPTIVE QUESTIONS!
#question longest(F/M)
select * from most_frequent_names
where Gender = 'Female'
group by name
order by  max(length(`name`)) desc
limit 10;
#Maria Teresa, Maria Carmen, Encarnación. All have 11 letters

#Question longest (M)
select * from most_frequent_names
where Gender = 'Male'
group by name
order by  max(length(`name`)) desc
limit 10;
#Francisco Javier is the clear winner in the male seccion

#question shortest(F)
select * from most_frequent_names
where Gender = 'Female'
group by name
order by  min(length(`name`)) asc
limit 10;
#here we have a another technical draw between Noa, Ona, Lia, Mia, Mar, Eva and Ana all with 3 lettersw
#question shortest (m)
select * from most_frequent_names
where Gender = 'Male'
group by name
order by  min(length(`name`)) asc
limit 10;
#here we have a technical draw once more between Max, Nil, Teo, Roc, Pau, Jan, Pol, Ian and Leo

#Average length of the names group by genre
SELECT gender, ROUND(AVG(length(name)),2) as Average_length
FROM most_frequent_names
GROUP BY 1;
#We can see Female names are slightly longer than males names.

#Are our names in the table? In which decade do they appear first?
SELECT Name, Decade as First_appearance_decade
FROM most_frequent_names
WHERE name = 'Francisco Javier' or 'Andreu'
GROUP BY 1
ORDER BY 2
LIMIT 1;
#Francisco Javier is on the table and appeared in the top 50 for the first time in 1950.
#Andreu has never been on the top 50 male names

#questiononetimeglow(F)
select name, decade, sum(frequency)
from most_frequent_names 
where gender = 'Female'
group by name having count(decade) = 1
order by sum(frequency) desc
limit 10;
#here we have many names that have only been on the to 50 for only one decade, but we choses the 10 with more frequency which are:
#Jessica(1980), Noemi(1970), Eva Maria (1970), Valentina (2010), Lourdes(1960), Olivia(2010), Lidia(1970), Ruth(1970), MªJosefa (1940) and Nora(2010)

#questiononetimeglow(M)
select name, decade, sum(frequency)
from most_frequent_names 
where gender = 'Male'
group by name having count(decade) = 1
order by sum(frequency) desc
Limit 10;
#here we have many names that have only been on the to 50 for only one decade, but we choses the 10 with more frequency which are:
#Leo(2010), Roberto(1970), Juan Jose(1960), Mateu (2010), Geal(2010), Teo(2010), Roc(2010), Adam(2010), Luca(2010),Ian(2010)

#Does appear any name in the top 50 in both genders? Which one?
SELECT name
FROM most_frequent_names
WHERE gender = 'Male' AND name in (SELECT name FROM most_frequent_names where gender = 'Female');
#No name has ever been on the top 50 names on both genders (no matter in which decade it appeared)

#Are there any names in the first decade and in the last? which ones?
SELECT name, gender
from most_frequent_names
where name in (SELECT name FROM most_frequent_names where decade = 'Before 1930') and decade = 2010
GROUP BY NAME;
#There are exactly 5 names for each gender that appear in the top 50 before 1930 and in 2010
#The female names are Maria, Nuria, Ana, Julia, Elena
#The males names are Joan, Jordi, Tomas, Daniel, Alejandro



#ANALYTICAL QUESTIONS!

#How does the lenght of the names change through the decades? (F)
SELECT gender, decade, round(AVG(length(name)),2) as Length
FROM most_frequent_names
where gender = 'Female' and decade not like 'Total'
GROUP BY 1, 2;
#It can be appreciated that during the first half of the century the tendecy of name's length was to increase, while after 1950 each decade it decreases

#How does the lenght of the names change through the decades? (M)
SELECT gender, decade, round(AVG(length(name)),2) as Length
FROM most_frequent_names
where gender = 'Male' and decade not like 'Total'
GROUP BY 1, 2;
#Here we can see the same pattern as female's names does, but it peaks 2 decades later.

#Question All time Favourites (the premises are that if any name has been on the top 50 all decades is the winner, but if there are more,
#we decide the winner by frequency (M)
select name, gender, sum(frequency) as Frequency
from most_frequent_names 
where decade not like 'Total' and gender = 'Male'
group by name having count(decade) = 10
order by gender, sum(frequency) desc;
#Only two male names have been on the top all century! the winner is 'Jordi', followed by the runner-up 'Joan'
#as we also want to know the all time favourites for female names, now we are checking if there are any that have been up there al least 9 decades of the century

#Question All time Favourites (the premises are that if any name has been on the top 50 all decades is the winner, but if there are more,
#we decide the winner by frequency (F)
select name, sum(frequency) as Frequency
from most_frequent_names 
where decade not like 'Total' and gender = 'Female'
group by name having count(decade) = 10
order by sum(frequency) desc;
#here we do find two female names! We have 'Maria' as a winner, followed by the runners-up 'Nuria', 'Ana' and 'Elena'

#Question modern names (only appear on the top the last two decades)
select name, gender, sum(frequency)
from most_frequent_names
where decade >= 2000 and name not in (select name
from most_frequent_names
where decade < 2000)
group by name having count(decade) = 2
order by sum(frequency) desc , gender asc
limit 10;
#Top 3 modern names for females are Martina, Emma and Noa
#top 3 modern names for Males are Jan, Biel and Hugo
#we can also see that out of the 10 most frequent modern names 7 out of 10 are male names
#so we could say that male names have modernized more than female names the past two decades

#Top names of the century (We decided to assing 50 points for the top name of each decade and 1 to the last name, descending accordingly. 
#Afterewards, we multipled the result by the frequency of each name. In order to make the number more readable, we divided the result by 1M)
select name, round((sum(51 - mfn.order) * sum(Frequency)) / 1000000,2) as Score
from most_frequent_names mfn
where decade not like 'Total'
GROUP BY Name
Order BY Score desc
LIMIT 3;
#The clear winner in Barcelona is maria, with an score of 8.65, followed by Antonio (5.60) and the bronze goes to Jordi (5.21)

#In which gender names tends society to innovate more? (We sum the frequency of the names by gender and then divide it by the count the unique names of each gender, the value which is nearest to 1 is the most innovative)
Select  gender, count(DISTINCT(name)) as Total_Unique_Names, sum(Frequency) as Frequency_of_the_names, sum(Frequency) / count(DISTINCT(name)) as Score
From most_frequent_names
where decade not like 'Total'
Group by 1;
#Female names have are more innovative than male names, eventhough their frequency ir higher the number of unique names is also higher, making it closer to 1 than the males names.



