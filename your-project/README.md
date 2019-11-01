<img src="https://bit.ly/2VnXWr2" alt="Ironhack Logo" width="100"/>

# Title of My Project
*Maria Platas, Cinla Ozdemir*

*Data Analysis Full Time October 2019*

## Content
- [Project Description](#project-description)
- [Questions & Hypotheses](#questions-hypotheses)
- [Dataset](#dataset)
- [Database](#database)
- [Workflow](#workflow)
- [Organization](#organization)
- [Links](#links)


## Project Description
We decided to carry the analysis on car accidents in Barcelona on 2018.
In the past years, we have noticed an increase of the number of news about car crashes and we decided to dive into the data.

## Questions & Hypotheses
Our hypothesis was the following: "Friday is the most dangerous day". In addition, we had several questions such as: Which type of vehicle was the most accidented? Was there a difference between driving a black car or a white one? Which month was the most dangerous?

## Dataset
What dataset (or datasets) did you use? What is the source of your data? Provide links to the data if available and describe the data briefly.

We used 4 different datasets from 'Ajuntament de Barcelona Open Data'. You can find the same datasets that we used on the following urls:
. https://opendata-ajuntament.barcelona.cat/data/ca/dataset/accidents-gu-bcn/resource/f94d9ac3-e46e-47cd-a3d0-a9b5b9639d86 Main table, it gathers a list of all the accidents that happened in Barcelona.
. https://opendata-ajuntament.barcelona.cat/data/ca/dataset/accidents-vehicles-gu-bcn/resource/6e2daeb5-e359-43ad-b0b5-7fdf438c8d6f Vehicles implied, it gathers the information of the vehicles implied in the accident
. https://opendata-ajuntament.barcelona.cat/data/ca/dataset/accidents-tipus-gu-bcn/resource/1f43e605-4ace-4134-a18b-5a329bf9000c Type of accident, which type of accident was the most common
. https://opendata-ajuntament.barcelona.cat/data/dataset/719b1054-4166-4692-b63e-622b621b4293/resource/200fa1e2-7188-4a01-9b3d-e4ac0016528e/download/2018_accidents_causes_gu_bcn_.csv Causes of the accident, gathers the main causes of accidents.

## Database
What is the structure of your database? Have you created more than one table and if yes, how are they related to each other? Include a drawing or computer-generated image of the ERD (Entity Relationship Diagram) of your database.
We have created 4 tables, the first one is 'main', and there you will find the main information such as the accident id (used in vehicles and accident_types as join keys).

In vehicles you will find the information about the vehicles implied in the accident.
In accident_types there is the information about the type of accidents there were in 2018.
In location you will find the districts with their correspondent codes.


## Workflow
We followed the following workflow:
1st.- Decision  of the topic.
2nd.- Research of the topic chosen, search of the database to be used during the analysis.
3rd.- Planning and organization of the analysis.
4th.- Decide on structure of the database and creation of database.
5th.- Creation of the tables.
6th.- Use of pandas for data cleansing.
7th.- Use of pandas and SQL to analyse data and extraction of conclusions.
8th.- Presentation of results
## Organization
We used Trello in order to know exactly which tasks and subtasks to do and when they were due.

What does your repository look like? Explain your folder and file structure.

## Links
Include links to your repository, slides and kanban board. Feel free to include any other links associated with your project.

[Repository](https://github.com/) https://github.com/Maria6694/Project-Week-2-Barcelona    
[Slides](https://slides.com/) https://docs.google.com/presentation/d/1d9lAIk43D_1rzOmFP_qPNBnwoGBPeGL7rO04aGpHvTg/edit?usp=sharing
[Trello](https://trello.com/en) https://trello.com/b/ZKRnX4t1/project-2

