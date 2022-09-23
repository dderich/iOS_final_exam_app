# iOS_final_exam_app
### Term: Summer 2022
### Course: Mobile App Development iOS

![Home / landing page of the app](https://github.com/dderich/iOS_final_exam_app/blob/master/Screenshots/Screen%20-%20Start.png)


I created an app that displays one JSON object at a time from a Recipe API.
From the object received, I extracted values using JSON parsing to specify a recipe on a Storyboard Scene or View.
Once extracted, I showed the fetched recipe on a UILabel/Text or iOS GUI Widget on the main screen of the APP.
The same screen provides two buttons to the user: 
1) Add to favorite recipes
2) Show another recipe

• On click “Show another recipe” button, another recipe is fetched from the API and displayed on screen

• On click of “Add to favorite recipes” button, the current displayed recipe is saved to the CoreData database and another recipe is fetched from the API and displayed on screen

The app also allows te user to:

• open another screen from main screen where all the recipes from database that user had chosen as their favourite and displayed in TableView
• delete any of the recipes from the list

• The app is structured using MVC architecture having clear separation of concerns between UI and business logic
• The app is executed using the iPhone 11 simulator in iOS 14.1.

• The app uses the Swift Packages: 
    Alamofire - 5.6.2
    SwifyJSON - 5.0.1
