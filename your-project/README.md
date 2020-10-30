<img src="https://bit.ly/2VnXWr2" alt="Ironhack Logo" width="100"/>

# The danger of driving in Barcelona
*Aine Gates & Víctor López*

*DAFT October 2020, Barcelona & 30/10/2020*

## Content
- [Project Description](#project-description)
- [Questions & Hypotheses](#questions-hypotheses)
- [Dataset](#dataset)
- [Database](#database)
- [Workflow](#workflow)
- [Organization](#organization)
- [Links](#links)


## Project Description
Seeing the amount of students with driver licenses and that holidays are pretty close, we wanted to check how dangerous is drive in Barcelona on those days.

The goal of our project was **find insights to share with the rest of the class with the aim of keeping everyone safe.**

## Questions & Hypotheses
The questions that we want to answer are the following ones:
  * How dangerous is driving in Barcelona?
  * Where are those accidents mostly located?
  * When do more accidents occur?
  * Which is the most dangerous holiday?
  
Before we started checking the data, we thought that Barcelona was more dangerous on holidays, specially in the night. Shall we were correct

## Dataset
The dataset that we used was the original contained on the folder, the **accidents-2017.csv**. From that data, we isolated part of it in different CSV files mentioned above.

## Database
The structure of our database follows the same structure for both tables created, named **acc-with-hol.csv** and **acc-without-hol.csv**. The structure is the following:
  * District Name
  * Weekday
  * Month
  * Day
  * Part of the day
  * Mild injuries
  * Serious injuries
  * Victims
  * Vehicles Involved
  * Date

## Workflow
The workflow that we followed was, first of all, find an initial hypothesis of the project. Later on, we started thinking about initial questions that we wanted to answer. 
After having that in mind, we share it with our mentor and started cleaning the data. That was the most difficult part, as we were new with Pandas. 
Once our data was updated, we figured out if the initial questions make sense, which should we change and we started coding on the new datasets trying to find those insights.
Last, but not least, we gathered all the information and decided how to structure it for the final presentation.

## Organization
For our organization, we divided the workload, especially for the data-cleaning part and for the data wrangling. Also, every part of the project was set on the Trello that we shared.
About the repository, it looks that way:
  1. On the initial folder we can find the **datasets** folder, the **your-project** folder and the **.gitignorefile**.
  2. Inside the **datasets** folder, if we go to **1.-Transportation**, there you can find extra CSV files that we created. Those are **acc_with_hol.csv** and **acc_without_hol.csv**. Also, there are other ones inside another folder named **Holidays**.
  3. Going back to the **your-project** folder, there we can find the main notebooks used by both of us and some useful notebooks that we used along the project. Those deprecated notebooks are stored in the **old-notebooks** folder.

## Links
Include links to your repository, slides and kanban board. Feel free to include any other links associated with your project.

[Repository](https://github.com/agates696/Project-Week-2-Barcelona)  
[Slides](https://docs.google.com/presentation/d/1Xr-MfL-JKuHftDQ3Wa_5WiYvZ4dkvOmhbYBhuULpFJM/edit?usp=sharing)  
[Trello](https://trello.com/b/clRY0s73/project-2-barcelona)  
