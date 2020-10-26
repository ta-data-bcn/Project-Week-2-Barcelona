<img src="https://bit.ly/2VnXWr2" alt="Ironhack Logo" width="100"/>

# Air Quality
*[Yago & Oriol]*

*[Data Analytics, IronHack Barcelona 2020]*

## Content
- [Project Description](#project-description)
- [Questions & Hypotheses](#questions-hypotheses)
- [Dataset](#dataset)
- [Database](#database)
- [Workflow](#workflow)
- [Organization](#organization)
- [Links](#links)


## Project Description
Analysis of presence of several pollutants present on Barcelona's atmosphere, and comparison of this presence in different periods of year, week and day.

## Questions & Hypotheses
- current quality?
    - expect to be at least medium as long as restrictions where applied
- how tourists affect?
    - more people should produce more pollution
- evolution?
    - every year restrictions are more sever, we expect to get better over time
- future estimation over evolution
    - as long as we expect the evolution to be positive, future estimations should be less pollution
- seasons of the year, is there any difference?
    - tourism and rainy seasons should affect to pollution
- areas & hours
    - the idea is that areas with more traffic and main streets with more cars will have lowest air quality
- breath pollutioned air, what is the effect?
    - we are looking over a similar explanation like "smoking 2 packets of cigarretes a day"

## Dataset
[turism](https://consejosdeespana.com/barcelona/las-mejores-epocas-para-ir-a-barcelona/)
[air_quality_wikipedia](https://en.wikipedia.org/wiki/Air_quality_index)
[opendata_ajuntament](https://opendata-ajuntament.barcelona.cat/data/ca/dataset/qualitat-aire-detall-bcn)
[amb_cat](http://www.amb.cat/s/web/medi-ambient/sostenibilitat/qualitat-de-laire.html)
[waqi](https://waqi.info/#/c/41.398/2.15/11.8z)

## Database
The DB structure is simple but optimised. There are two tables:
- Station:
    - ID
    - name
    - latitude
    - longitude
- Registry:
    - ID
    - no2_val
    - o3_val
    - pm_val
    - date_generated
    - station_ID (FK Station.ID)

They have a relation "1 - n", 1 Station has multiple Registries.

## Workflow
Think about the problem
Think about questions that could be interesting
Try to think about the kind of data needed to resolve those questions
Look for the data needed
Create the DB
Transform the recovered data to match the DB
Search for the answers creating queries
extract conclusions from results

## Organization
Used [Trello](https://trello.com/b/1IhN2E5u/module1-project2) to organize work.

 Project organisation is as follows:
 - datasets are in folder './datasets/2.-Urban-Environment/' (folder ignored by git to avoid heavy repository)
 - connections to server are created in a txt file inside a folder called './connection/'
 - tables creation, .py for inserts, README and excel file to help over question 3 results are in './your-project/'

## Links

[Air_Quality_Repository](https://github.com/Cunillet/Project-Week-2-Barcelona)  
[Air_Quality_Slides](https://docs.google.com/presentation/d/1rLj7ip3uUx-Pzlqhic36KICW5VHtT6I7xHwQeqOx6YI/edit?usp=sharing)  
[Oriol_&_Yago_Trello](https://trello.com/b/1IhN2E5u/module1-project2)  
