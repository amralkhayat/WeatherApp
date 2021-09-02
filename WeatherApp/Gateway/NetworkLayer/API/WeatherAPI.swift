//
//  WeatherAPI.swift
//  WeatherApp
//
//  Created by Amr Saeed on 02/09/2021.
//

import Foundation
enum WeatherAPI:UrlRequestBuilder {

    case getWeatherList
    
    var path: String {
      
        switch self {
          
        case .getWeatherList:
          
            return "data/2.5/forecast?q=Cairo&cnt=1&appid=23517dd4b0e02f297f05fe6e1661f9b5"
        }
    }
    
    var method: HTTPMethod {
      
        switch self {
          
        case . getWeatherList:
          
            return .get
        }
    }
    
    var parameters: [String: Any]? {
      
        switch self {
          
        case .getWeatherList:
          
            return nil
        }
    }

}
