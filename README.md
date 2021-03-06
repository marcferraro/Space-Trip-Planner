### Interstellar Traveller

## Introduction
Welcome to Interstellar Traveller, created by two new Flatiron students as their final mod 1 project.

Below, we'll walk you through how to book your first trip into space. You can add destinations, write journal entries, and explore the weird locations we added. Enjoy the ride!

## SETUP

1. Head to this link https://github.com/marcferraro/Space-Trip-Planner and clone to your text editor project folder.
2. Open your text editor then open all files in the clones folder.
3. Run 'bundle install' 
4. Run 'rake db:migrate'
5. Run 'rake db:seed'
6. Run 'ruby bin/run.rb'


## Program Features
Create accounts, plan trips and write journals.

# Create Account
1. In main menu select Create_Traveller_Account and enter name and age.
2. Keep track of your id number for future logins.
3. If you have any existing accounts, select Existing_Account and enter id.

![login_screen](images/login.jpeg)

# Plan Trips
1. To create a new trip, select Create_New_Trip and enter start date and end date.

![main_menu](images/main_menu.jpeg)

2. To add loctions to your trip, select either Find_Random_Locations or Custom_Location_Search.
3. In Find_Random_Locations you will given three random locations to choose from. Enter the id of the location you would like to add to your itinerary.

![Add_Location_menu](images/add_location.jpeg)

4. In Custom_Location_Search choose the options that best describe the location you would like to travel to. Then enter the id of location to add to your itinerary.
5. When finished, select Finish_Creation.
6. Enter the name of your trip and vehicle you will be taking.
7. Select save to create your trip, discard to head back to main menu or restart to begin this process again.

![trip_results](images/trip_results.jpeg)

8. To view trip details select View_Trips in Main Menu.

![view_trips](images/view_trips.jpeg)


# Log Entry
1. To create a new log entry select Write_Travellers_Log then select New_Entry
2. Enter a trip id for the log you would like to enter.
3. Write your new entry, then hit enter when finished.

![log_entry](images/log_entry.jpeg)

4. Select New_Entry to create another or Main_Menu to head back.

# Contributors

Marc Ferraro and Rachelle Spicer

All the data included is imaginary. This project is licensed under the terms of the Learn.co Educational Content License: http://learn.co/content-license