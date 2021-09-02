//
//  WeatherDetailsConfigurator.swift
//  WeatherApp
//
//  Created by Amr Saeed on 02/09/2021.
//

import Foundation

//MARK:- WeatherDetailsConfigurator using for configuration of the view
protocol WeatherDetailsConfigurator {
   func configure(WeatherDetailsViewController: WeatherDetails)
}


class  WeatherDetailsConfiguratorImplementation: WeatherDetailsConfigurator  {
    
    let weatherDetails: WeatherDetailsModel
    
    init(weatherDetails: WeatherDetailsModel) {
        self.weatherDetails = weatherDetails
    }
    
    
     func configure(WeatherDetailsViewController: WeatherDetails) {
        
        
        let persenter = WeatherDetailsPresenterImplementation(view: WeatherDetailsViewController, weatherDetails: weatherDetails)
        
        WeatherDetailsViewController.presenter = persenter
        
        
    }
    
    
    
}
