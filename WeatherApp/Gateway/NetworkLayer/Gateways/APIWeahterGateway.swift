//
//  APIWeahterGateway.swift
//  WeatherApp
//
//  Created by Amr Saeed on 02/09/2021.
//

import Foundation
// This protocol in not necessarily needed since it doesn't include any extra methods
// besides what BooksGateway already provides. However, if there would be any extra methods
protocol APIWeatherGateway: WeatherGateway  {
    
}


class ApiWeatherGatewayImplementation: APIWeatherGateway {
    
    let apiClient: APIClient
    
    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }
    

    //MARK:- Featch Weather
    func fetchWeather(completionHandler: @escaping WeatherGatewayCompletionHandler<WeatherListModel>) {
      
        apiClient.performRequest(WeatherListModel.self, router: WeatherAPI.getWeatherList) { (result) in

            switch result {
            case let .success(weather):
                completionHandler(.success(weather))
            case let .failure(error):
                completionHandler(.failure(error))
            }
        }
    }
    
    
    
}
