//
//  URLRequestBuilder.swift
//  WeatherApp
//
//  Created by Amr Saeed on 01/09/2021.
//

import Foundation
protocol UrlRequestBuilder : ApiRequest{
    // MARK: - Methods
    var method: HTTPMethod { get }
    // MARK: - Path
     var path: String { get }
    // MARK: - Parameters
    var parameters: [String: Any]? { get }
   // MARK: - Main 
   var mainURL: URL { get }

}

extension UrlRequestBuilder {

  var mainURL: URL {
         return URL(string: "https://api.openweathermap.org/")!
    
      }
  

  var urlRequest: URLRequest {
    
    let stringUrl =  mainURL.appendingPathComponent(path).absoluteString.removingPercentEncoding!
    guard let url = URL(string: stringUrl ) else  {return urlRequest}
    var request = URLRequest(url: url)
        request.httpMethod = method.rawValue

       return request
   }
    

}
