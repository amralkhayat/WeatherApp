//
//  WeatherListModel.swift
//  WeatherAppTests
//
//  Created by Amr Saeed on 02/09/2021.
//

import RealmSwift
@testable import WeatherApp

extension WeatherListModel {
 
    static  func createWeatherList () -> WeatherListModel {
        

        let city = City(id: 360630, name: "Cairo")
        
        let main = MainTemp(temp: 300.57)
        
        let weather = Weather(id:  800, main: "Clear", descr: "clear sky", icon: "01n")
        
        let weathers = List<Weather>()
        
        weathers.append(weather)
        
       let weahterList = weatherList(dt: 1630530000, main:  main, weather: weathers)
        
      let wl = List<weatherList>()
        
        wl.append(weahterList)
        
     return WeatherListModel(list: wl, city: city)
   }
    
    
    
    
}

