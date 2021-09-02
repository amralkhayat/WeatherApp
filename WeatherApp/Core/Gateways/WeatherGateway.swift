//
//  WeatherGateway.swift
//  WeatherApp
//
//  Created by Amr Saeed on 02/09/2021.
//

import Foundation

typealias WeatherGatewayCompletionHandler<T> = ((Result<T, Error>) -> Void)
protocol WeatherGateway {
    func fetchWeather (completionHandler: @escaping WeatherGatewayCompletionHandler<WeatherListModel>)

}
