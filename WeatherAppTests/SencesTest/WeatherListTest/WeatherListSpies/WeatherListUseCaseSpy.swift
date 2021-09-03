//
//  WeatherListUseCaseSpy.swift
//  WeatherAppTests
//
//  Created by Amr Saeed on 03/09/2021.
//

import Foundation
@testable import WeatherApp
class WeatherListUseCaseSpy:  WeatherListUseCase{
    
    var resultToBeReturned: Result<WeatherListModel, Error>!
    
    func getWeatherList(completionHandler: @escaping weatherLiskUseCaseCompletionHandler) {

     completionHandler(resultToBeReturned)
    }
    
}
