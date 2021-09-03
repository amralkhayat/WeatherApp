//
//  WeatherListViewSpy.swift
//  WeatherAppTests
//
//  Created by Amr Saeed on 03/09/2021.
//

import Foundation
@testable import WeatherApp
class WeatherListViewSpy: WeatherListView {
    
    var isShowIndicator = false
    var isHideIndicator = false
    var isTableViewReload = false
    var errorMessage = ""
    var title = ""
    func show(message: String) {
       errorMessage = message
    }
    
    func reloadTableView() {
        isTableViewReload =  true
    }
    
    func changeItemBarTitle(title: String) {
        self.title  = title
    }
    
    func showIndecator() {
     isShowIndicator = true
    }
    
    func hideIndecator() {
        isHideIndicator = true
    }
    
    
}
