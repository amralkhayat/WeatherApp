//
//  WeatherListConfigurator.swift
//  WeatherApp
//
//  Created by Amr Saeed on 02/09/2021.
//

import Foundation
import RealmSwift
protocol WeatherListConfigurator {
    static func configure(WeatherListViewController:WeatherList)
}


class WeatherListImplementation:WeatherListConfigurator {
    
    
    
    static func configure(WeatherListViewController: WeatherList) {
        
        // Router
        let router = WeatherListViewRouterImplementation(WeatherListViewController: WeatherListViewController)
     
        
        // useCase
        let apiClient = ApiWeatherGatewayImplementation(apiClient: APIManager(session:  URLSessionConfiguration.default))
        
        let realmManager = RealmManager()
        
        let localPersistence = LocalPersistenceWeatherGetway(realmMethods: realmManager)
        
        
        let casheWeatherList =  CacheWeatherGetway(apiWeatherGateway: apiClient, localPersistenceWeathersGateway: localPersistence)
        
        let weatherUseCase = WeatherListkUseCaseImplementation(weatherGateway: casheWeatherList)
        
        
        
        // Persenter
       let persenter =  WeatherListPresenterImplementation(view: WeatherListViewController,useCase: weatherUseCase, router:  router)
        
        
        WeatherListViewController.presenter = persenter
    }
    

}


