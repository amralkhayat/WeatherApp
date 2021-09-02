//
//  NetworkTestHelper.swift
//  WeatherAppTests
//
//  Created by Amr Saeed on 02/09/2021.
//

import Foundation
@testable import WeatherApp
//MARK:- Convert String  to UTF8
func Utf8Data () -> Data? {
  
   let Utf8StringResponse = "{\"SomeProperty\":\"SomeValue\"}"
  
     let Data = Utf8StringResponse.data(using: .utf8)
  
  return Data
}

//MARK:- Enum for create URL request
enum testApi:UrlRequestBuilder {

    case test
    
    var path: String {
      
        switch self {
          
        case .test:
          
            return "test"
        }
    }
    
    var method: HTTPMethod {
      
        switch self {
          
        case . test:
          
            return .get
        }
    }
    
    var parameters: [String: Any]? {
      
        switch self {
          
        case .test:
          
            return nil
        }
    }

}
