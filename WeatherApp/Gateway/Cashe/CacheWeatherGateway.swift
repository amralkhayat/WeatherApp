//
//  CacheWeatherGateway.swift
//  WeatherApp
//
//  Created by Amr Saeed on 02/09/2021.
//

import Foundation


//MARK:- CacheWeatherGetway
//this class responsible to compose api and local persistence to be able to make api request and cash it to the realm database.
class CacheWeatherGetway: WeatherGateway  {
    
    
    let localPersistenceWeatherGateway: LocalPersistenceMethods
    
    let apiWeatherGateway:  APIWeatherGateway
    
    init(apiWeatherGateway:  APIWeatherGateway, localPersistenceWeathersGateway: LocalPersistenceMethods) {
        
        self.apiWeatherGateway = apiWeatherGateway
        
        self.localPersistenceWeatherGateway =  localPersistenceWeathersGateway
    }
    
    
    func fetchWeather(completionHandler: @escaping WeatherGatewayCompletionHandler<WeatherListModel>) {
        apiWeatherGateway.fetchWeather { (result) in
            
            self.handleFetchWeatherApiResult(result, completionHandler: completionHandler)
        
        }
    }
    
    //MARK:- Handling fetch api when data successfully  parsing save data to realm model if no internet connection or any error will load pervious copy of the data
    func handleFetchWeatherApiResult(_ result: Result<WeatherListModel, Error>, completionHandler: @escaping (Result<WeatherListModel,Error>) -> Void) {
        
        switch result {
        
        case let .success(Weather):
            print(Weather)
       
            handlingSuccessSavetoRelam(Weather: Weather, completionHandler: completionHandler)
            
        case .failure(_):
            
            localPersistenceWeatherGateway.fetchWeather(completionHandler: completionHandler)
          }
        }
    

    
    
    private func handlingSuccessSavetoRelam(Weather: WeatherListModel,completionHandler: @escaping (Result<WeatherListModel,Error>) -> Void){
        localPersistenceWeatherGateway.addWeather(object: Weather) { result in
        
            switch result {

            case .success(_):
                
                self.localPersistenceWeatherGateway.fetchWeather(completionHandler: completionHandler)
                
            case .failure(_):
                self.localPersistenceWeatherGateway.fetchWeather(completionHandler: completionHandler)
              }
            
          }
        
       }
    
    }
    
