create database population;
use population;
#question longest(M)
select * from most_frequent_names
where Gender = 'Female'
group by name
order by  max(length(`name`)) desc
limit 10;
#Maria Teresa, Maria Carmen, Encarnación. All have 11 letters
#Quiestonlongest (M)
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
#questionshortest (m)
select * from most_frequent_names
where Gender = 'Male'
group by name
order by  min(length(`name`)) asc
limit 10;
#here we have a technical draw once more between Max, Nil, Teo, Roc, Pau, Jan, Pol, Ian and Leo
#questiononetimeglow(F)
select name, decade, sum(frequency)
from most_frequent_names 
where gender = 'Female'
group by name having count(decade) = 1
order by sum(frequency) desc
limit 10;
#here we have may names that have only been on the to 50 for only one decade, but we choses the 10 with more frequency which are:
#Jessica(1980), Noemi(1970), Eva Maria (1970), Valentina (2010), Lourdes(1960), Olivia(2010), Lidia(1970), Ruth(1970), MªJosefa (1940) and Nora(2010)
##questiononetimeglow(M)
select name, decade, sum(frequency)
from most_frequent_names 
where gender = 'Male'
group by name having count(decade) = 1
order by sum(frequency) desc
Limit 10;
#here we have may names that have only been on the to 50 for only one decade, but we choses the 10 with more frequency which are:
#Leo(2010), Roberto(1970), Juan Jose(1960), Mateu (2010), Geal(2010), Teo(2010), Roc(2010), Adam(2010), Luca(2010),Ian(2010)
#Question All time Favourites (the premises are that if any name has been on the top 50 all decades is the winner, but if there are more,
#we decide the winner by frequency
select name, gender, sum(frequency)
from most_frequent_names 
group by name having count(decade) = 10
order by gender, sum(frequency) desc
;
#Only two names in both genders have been on the top all century! the winner is 'Carlos', closly followed by the runner-up 'Miguel'
#as we also want to know the all time favourites for female names, now we are checking if there are any that have been up there al least 9 decades of the century
select name, sum(frequency)
from most_frequent_names 
where gender = 'Female'
group by name having count(decade) = 9
order by sum(frequency) desc
;
#here we do find two female names! We have 'Marta' as a winner, followed by the runner-up 'Julia'
