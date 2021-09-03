//
//  WeatherListCellView.swift
//  WeatherAppTests
//
//  Created by Amr Saeed on 03/09/2021.
//

import Foundation
@testable import WeatherApp
class WeatherItemCellViewSpy: WeatherItemCellView {
    
    var tempMode = ""
    var weatherListData: weatherList!
    func displayCellBody(list: weatherList) {
        weatherListData = list
    }
    
    func tempMode(mode: String) {
        tempMode = mode
    }
    
    
}
