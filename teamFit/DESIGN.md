#  Implementation

##Software Imported

* Firebase
* FirebaseDatabase
* FirebaseAuthentication

##Design Decisions

* Logo: This self-designed logo describes the app with its weights but also the lifeline. This app encompasses both as the user tries to find a healthier way of life through workouts.

* UI Design: The simple and sleek look of the application allows users to toggle between the three main screens once signing up or logging into the application. It allows for a simple navigation and removes any sense of confusion.

* Color Choice: Blue tones can display a sense of calm, while they also represent health and healing. At the same time, the gradient buttons on the workout page allow for a sense of visual satisfaction


##Application Decisions

### Database Design
The database is organized in Firebase Realtime Database and each account is separated by their uid, inside are child branches, one for personal information, and a new one created every day in "MMM-dd-yyyy" format for new data information.

### Login Page

Simple UI Design with two inputs for email and password which are checked by Firebase Authentication in order to enter to the Home Page.

### Sign Up Page

Requested personal information along with email and password to create a new user in Firebase Authentication and add into information part of database for potential future use.

### Home Page

Using a tabbed toggle view to switch between pages after logging in. This home page has the summary of the total water count, workout hours, and food intake in a table-type formate for clear and easy comparison and updates. The data is referenced from the Firebase Database or created into the database if it doesn't already exist. The page also refreshes with the updates as well.

### Update Page

Continues as the second page of the tabbed toggle view to update values into the database when a user wants to change inforamtion about any of the following: water intake for the day, food intake for the day, number of hours worked out during the day.

### Workout Page

This page, using gradient buttons, is a simple connection through links to Youtube playlists about different workout options depending on the focus: upper body, lower body, abs, or cardio



