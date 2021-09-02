//
//  WeatherListRouter.swift
//  WeatherApp
//
//  Created by Amr Saeed on 02/09/2021.
//

import UIKit

protocol WeatherListViewRouter {
    
    func presentDetailsView(for Details: WeatherDetailsModel)
}

class WeatherListViewRouterImplementation: WeatherListViewRouter {
   
    private weak var WeatherListViewController: WeatherList?
    
    init( WeatherListViewController: WeatherList) {
        self.WeatherListViewController =  WeatherListViewController
    }
    
    // MARK: - WeatherListRouter
    
    func presentDetailsView(for Details: WeatherDetailsModel) {
        
        let weatherDetails = WeatherDetails()
        
        weatherDetails.configurator = WeatherDetailsConfiguratorImplementation(weatherDetails: Details)
    
        WeatherListViewController?.navigationController?.pushViewController(weatherDetails, animated: true)
        
    }
}
