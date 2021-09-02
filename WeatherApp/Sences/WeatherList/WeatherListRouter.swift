//
//  WeatherListRouter.swift
//  WeatherApp
//
//  Created by Amr Saeed on 02/09/2021.
//

import Foundation
protocol WeatherListViewRouter {
    func dismiss()
}
class WeatherListViewRouterImplementation: WeatherListViewRouter {
    private weak var WeatherListViewController: WeatherList?
    
    init( WeatherListViewController: WeatherList) {
        self.WeatherListViewController =  WeatherListViewController
    }
    
    // MARK: - WeatherListRouter
    
    func dismiss() {
//        addBookViewController?.dismiss(animated: true, completion: nil)
    }
}
