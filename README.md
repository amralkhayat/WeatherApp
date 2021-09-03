# WeatherApp
Weather app populate 16 weather situations with different time , and notify with random weather notifcation.

## Screenshots
![Group](https://user-images.githubusercontent.com/33759960/131956966-50fd5b10-1712-467f-a94f-4d2459de5d0a.png)


## Implemented Using

* MVP with Swift

* SOLID Principles

* Open Weather API

* Clean Code

* Unit Testing(with test covrage 61.2 %)

* Realm

* KingFisher

## MVP Concepts

* View - delegates user interaction events to the Presenter and displays data passed by the Presenter.

* Presenter - contains the presentation logic and tells the View what to present.

* Router - Navigate between Screens .

* Configurator -  Injects the dependency object graph into the scene (view controller).

* UseCase  - business logic for a specific use case in application.

## Files organization 

* Resources: LaunchScreen + Assets.

* Extension : Contains methods extend from apple current classes 

* Core : Gateways + App delegate 

* Configuration : Info.plist

* Model: app models 

* Gateway : Containes network layer + LocalPersistenceLayer + cashe

* Sences : Contains viewControllers of the application 










