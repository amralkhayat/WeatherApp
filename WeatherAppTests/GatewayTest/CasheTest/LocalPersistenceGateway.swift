//
//  LocalPersistenceGateway.swift
//  WeatherAppTests
//
//  Created by Amr Saeed on 02/09/2021.
//

import Foundation
@testable import WeatherApp

class LocalPersistenceGatewaySpy: LocalPersistenceMethods {
    
    var fetchWeatheResultToBeReturned: Result<WeatherListModel, Error>!
    var fetchWeatherIsCalled = false

    func fetchWeather(completionHandler: @escaping WeatherGatewayCompletionHandler<WeatherListModel>) {
        fetchWeatherIsCalled = true
        completionHandler(fetchWeatheResultToBeReturned)
    }
    
    func addWeather(object: WeatherListModel, completionHandler: @escaping WeatherGatewayCompletionHandler<Any>) {
        
    }
    
    func deleteWeather(object: WeatherListModel, completionHandler: @escaping WeatherGatewayCompletionHandler<String>) {
        
    }
    
   
    
   
    
    
}
