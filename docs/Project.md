# Application for animal shelters management

## Description and features

Here is the project description that we want to build

I want to create application for android to manage the animals in the animal shelters. There could be up to 1000 animals in each, and many people who works with them should interact with animals, each other and data in app smoothly not blocking each other

Here is what I want to see in the first version of the application:
- I want to manage personal through firebase by their google email accounts.
- I want to manage shelters through firebase
- I want to manage groups of personal with giving them specific rights on the backend, and assign personal to that groups.
- I want that personal can be assigned to specific shelters
- I want that personal can be assigned to specific animals, so they see and work only with them. This can be done by them personally, by the personal with assign right, and by the system automatically.
- I want that each animal has such data:
* name, photo, chipid if present, birth date, gender, type(cat, dog, etc), automatic generated id on the backend
* weight history
* vaccination records (title of vaccine, date, re-vaccination date, comment, remind before field for days, hours, minutes)
* Medical documents as images
* Treatment documents as images or formatted text
* Treatment medicine plan. Each plan has amount of medicines or procedures, each of them should have (name, description, start date, end date, repeat every in days, times per day, remind in field for days, hours, minutes)
* Gallery of animals photos with date, and notes
- I want ability to convert all animal data into pdf for sharing, by selecting data groups which to share(for example to not share animal gallery)
- I want knowledge base view that will have title, tags, and formatted text that can have images(that will be uploaded on the backend). with ability to search by text or tags.
- I want that app get data updates as soon as they added to the server
- I want that all binary data like images, audio, video, etc was stored on firebase storage to minimize the cost, but also in cache on the phone to not redownload it each time
- I want that every personal has today tasks view, where should be visible all their assigned animals treatment medicine plan actions like give medicine or do procedure. with ability to check that each action is done, and order by time and animal

## What and how we use
### State management
- We Use Provider package for managing the state as it seems the best choice for this app
- For some local Widgets we may use internal state instead of providers. For example animations, etc

## Project structure
- 'assets' - place for images, etc
- `screens` - place where we have our app screens
- `widgets` - place for reusable widgets
- `model` - place for data models
- `providers` - place for providers to manage app state
- `services` - place for services that interracts outside app: API, Auth, 
File Handling, etc
- `repository` - place for saving repository that work over data and services
- `constants` - place for saving global app constants
- `utils` - place for small utils and 3rd party libraries if the small to include 
instead of dependency
```
/assets
/lib
  /main.dart
  /src
    /app.dart
    /constants
      /constants.dart
      /theme.dart
    /ui
      /screens
        /home_screen.dart
        /animal_details_screen.dart
        /login_screen.dart
        etc.
      /widgets
        /custom_button.dart
        /animal_list_item.dart
        etc.
    /model
      /user.dart
      /animal.dart
      /vaccination_record.dart
      etc.
    /providers
      /user_provider.dart
      /animal_provider.dart
      /authentication_provider.dart
      etc.
    /services
      /api
        /user_service.dart
        /animal_service.dart
        etc.
      /firebase_auth_service.dart
      /firestore_service.dart
      etc.
    /repository
      /user_repository.dart
      /animal_repository.dart
      etc.
    /utils
      timedate.dart
      etc.
```
