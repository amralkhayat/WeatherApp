//
//  WeatherListUseCase.swift
//  WeatherApp
//
//  Created by Amr Saeed on 02/09/2021.
//

import Foundation

typealias weatherLiskUseCaseCompletionHandler = ((Result<WeatherListModel, Error>) -> Void)

protocol WeatherListUseCase {
    
    func getWeatherList(completionHandler: @escaping weatherLiskUseCaseCompletionHandler)
}


class  WeatherListkUseCaseImplementation: WeatherListUseCase{
    
    let weatherGateway: WeatherGateway
    
    init(weatherGateway: WeatherGateway) {
        self.weatherGateway = weatherGateway
    }
    
    
    
    func getWeatherList(completionHandler: @escaping weatherLiskUseCaseCompletionHandler) {
      
        weatherGateway.fetchWeather { (result) in
        
            switch result{
            
            case let .success(data):
                completionHandler(.success(data))
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
    }
    
    
}
