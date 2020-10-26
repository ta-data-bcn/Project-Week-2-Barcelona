<img src="https://bit.ly/2VnXWr2" alt="Ironhack Logo" width="100"/>

# Immigration: an inside view
*Alba Balcells & Mireia Guinovart*

*DA0620, Barcelona-Ironhack & 3 July*

## Content
- [Project Description](#project-description)
- [Questions & Hypotheses](#questions-hypotheses)
- [Dataset](#dataset)
- [Database](#database)
- [Workflow](#workflow)
- [Organization](#organization)
- [Links](#links)


## Project Description
Barcelona cannot be concieved as such if Immigration is not considered. Not only there are plenty of Catalans and Spaniards that move to the Catalonian capital but also a large percentage of the population is foreign. This project analyses which districts they choose and if it depends on the district characteristics.

## Questions & Hypotheses

In this project the followiong questions were asked:

- What is the percentage of immigrants living in certain neighbourhoods? And percentage by nationality?
- Is there a link between the country of origin of immigrants and the Barcelona's neighbourhood chosen to live?
- Do immigrants from less developed (or more developed) countries go to lower (or higher) quality districts?
- What could define a higher or lower quality district?
- Does the quality (low, neutral, high) of the district relate with its death rate? 
- Do the districts with higher population have more schools or hospitals? what about the other facilities (parks, sports centers,etc)

The hypotheses are:

- Higher quality districts will be those with low crime rate and high facilities sum (sum of all the facilities available such as schools or hospitals) so there should be a correlation between both variables.
- Lower quality districts will have a higher mortality rate
- Higher populated districts will have a higher facilities sum
- There will exist a relationship between the immigrant's nacionality and the district they choose to live in

## Dataset
The datasets that contain information about Barcelona were obtained in the following links:
- Information about facilities (schools,bars,hospitals...etc) and crime:
    - [Barcelona Open Data](https://opendata-ajuntament.barcelona.cat/en/)
- Information about the population numbers and mortality
    - [Statistics Barcelona's Council:Population](https://www.bcn.cat/estadistica/castella/dades/anuari/cap02/C020102.htm)
    - [Statistics Barcelona's Council: Mortality ](https://www.bcn.cat/estadistica/catala/dades/barris/tvida/salutpublica/t318.htm)
The datasets that do not contain information about Barcelona:
- Information about average wages worldwide
    - [OECD Data](https://data.oecd.org/earnwage/average-wages.htm)
<br>From the datasets mention above, data was processed and standarized into new datasets for data comparison.

## Database
Our database is comprised by multiple datasets that are connected to each other by the Barcelona's district and Barcelona's neighbourhood, being the complete_dataset the link (the center point) between them all. 

Different tables were created but again all are related by the district as a common value and derive from the complete_dataset.


## Workflow
The steps followed in our workflow were:
- Step 1: decide the questions and the hypothesis
- Step 2: decide the data needed to do so
- Step 3: have a quick look to the datasets available to see if all the data needed was there
- Step 4: finding new datasets to complement the data available
- Step 5: filter the data and create a dataset with all the data needed merged
- Step 6: analyse the data
- Step 7: obtaining results
- Step 8: conclusions

## Organization

For this project a kanban board was not necesary. The work was organised with meetings in which the steps to follow were decided. 

The repository is organised in two main folders: datasets and your-project. 
Inside the datasets folder there are the datasets already provided in individual folders and then a folder called Data-filtered with the datasets filtered and ready to merge as well as the merged version and then an unfiltered folder with all the raw datasets that we used.
Inside the your-project folder there are the .ipynb files in which the data was filtered (to_filter),merged(merging) and analysed (the rest).


## Links
Include links to your repository, slides and kanban board. Feel free to include any other links associated with your project.

[Repository](https://github.com/albabalcells/Project-Week-2-Barcelona)  
[Slides](https://docs.google.com/presentation/d/1nE8OsijBlGWmCbeEfTgpk23ado72Slf0hYDsBz9YJ0Q/edit?usp=sharing)  

