#Veterinary Clinic

## Setup

1. Open Visual Studio and create a new empty MVC project.
    * In Visual Studio start page click on New Project (file -> new project if not on start page)
    * Select ASP.NET Web Application and give it a name
    * Click OK
    * Under ASP.NET 4.6 Templates select Empty MVC.  Under "Add folders and Core References for:" check the MVC box
    * Click OK
2. Make a new SQL database see https://github.com/nashville-software-school/csharp-dotnet-milestones/blob/LSDatabases/3-database-driven-applications/exercises/database/DBS_V8_LINQ%2BENTITYFRAMEWORK.md for instructions.

## Instructions

This exercise mocks the operations of a Veterinarian's office.  The office needs software that keeps track of their animal patients, human owners and the primary Veterinarian for each animal.  Make an MVC application that outputs a list of Pets with the pet's Name, Animal Type, Breed (if applicable), The name of their owner and the name of their Veterinarian to the browser.

## Requirements

1. Each pet should include their name (i.e. Fido), species (cat, dog, etc.), breed (if applicable), human owner and Veterinarian.
2. Populate the tables with example data, give each veternatian several patients and at least 3 humans more than one pet.
3. Make at least 3 tables.
4. Use LINQ to join the 3 tables to retrieve the data for the list.
5. Output a list to the browser of pets that at minimum includes their name, owner's name and veternarian's name.  

## Bonus Criteria

1. Make a patient profile view that gives the Name, owner and Veterinarian of a single animal
2. Make a forth table that lists charges.  Populate this with sample data that gives some owners of multiple pets charges from each pet.  Then use LINQ to make an invoice for the pet owner.

