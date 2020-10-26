<img src="https://bit.ly/2VnXWr2" alt="Ironhack Logo" width="100"/>

# Analysis of Road Traffic Accidents in Barcelona
*Elliott and Sabbah *

*Data Analysis, October 2019 - Barcelona*

## Content
- [Project Description](#project-description)
- [Questions & Hypotheses](#questions-hypotheses)
- [Dataset](#dataset)
- [Database](#database)
- [Workflow](#workflow)
- [Organization](#organization)
- [Links](#links)


## Project Description
The local population of Barcelona are well known for taking their annual holidays during the summar month of August. During the month many businesses close - however there is an influx of visitors who are also taking their summer break. The aim of this project is to determine if there is a change in the number Road Traffic Accidents (RTAs) during the month of August.

## Questions & Hypotheses
The authors of this project have assumed that the number of accidents willincrease during the month of August, compared to the rest of the year.
The questions to be answered during the analysis portion of this project are:
1. Does the month of year influnce the number of RTAs in Barcelona?
2. Does the time of day influence the number of RTAs?
3. Is there seasonabl variation in the numner fo RTAs?
3. If there a variation in the number of accidents by district within the city.

## Dataset
The data for this project was sourced from the Ajuntament of Barcelona Open Data website (accessible in English language). The URL for this raw data CSV file is provided in the Links section below.

## Database
The raw CSV data file was cleaned using Pandas and subsequently populated into tables within a MySQL databse hosted on AWS. The structure and relationships of the tables is demonstrated in the ERD below. Note that not all data in the source file was imported into the database for analysis.

![logo](https://www.dropbox.com/s/ppuwne3jhkv41d6/ERD.JPG?raw=1) "Barcelona Accident Data 2018 - ERD"


You may access the database using the credentials below

endpoint: barcelona-db.cyxhqbnhiohl.eu-west-3.rds.amazonaws.com

username: guest

password: ABCd1234

## Workflow
The following steps were performed during the analysis of this project.
1.  Locate a suitable raw data file.
2.  Import CSV file into Pandas dataframe for initial analysis and review. [One column contained a trailling space which caused an issue]
3.  ERD created based on data available and analysis to be performed.
4.  Remove whitespace from column names and selected columns (accident identifier and street name).
5.  New dataframes created using selected columns from raw data file.
6.  Population of aforementiones new dataframes - used cleaned columns as required.
7.  New database created on Amazon Web Services (AWS).
8.  Respective Pandas dataframes used to populate the tables on the new database.
9.  Analysis performed via both SQL quieres and within Pandas to develop our skill sets using eact methodology.

## Organization
In order to idenitfy and track all tasks required to be completed, a Trello board was utilised. The link to the Trello board used is found in the Links section below.

Within the GitHub respository there are two folders.

The 'your-project' folder contains a the IPYNB and SQL files used to load the raw data CSV, which also resides here. The ERD is in this folder too.

The 'datasets' folders contains a selection of other datasets which were available (but not used) during the discovery phase of this project.

## Links
Include links to your repository, slides and kanban board. Feel free to include any other links associated with your project.

[Repository](https://github.com/tristar82/Project-Week-2-Barcelona)  
[Slides](https://www.dropbox.com/s/udxfsejpht96p2r/Investigation%20into%20influence%20of%20summer%20on%20RTAs%20in%20city%20of%20Barcelona.pdf?dl=0)  
[Trello](https://trello.com/b/G0laRJKn/accidents-in-barcelona)  
[Raw Data Sat](https://opendata-ajuntament.barcelona.cat/data/dataset/317e3743-fb79-4d2f-a128-5f12d2c9a55a/resource/6e2daeb5-e359-43ad-b0b5-7fdf438c8d6f/download/2018_accidents_vehicles_gu_bcn_.csv) 
