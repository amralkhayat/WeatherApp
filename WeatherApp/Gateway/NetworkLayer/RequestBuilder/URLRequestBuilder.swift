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
   // MARK: - Main and Request URLS
   var mainURL: URL { get }
  
   var requestURL: URL { get }
}

extension UrlRequestBuilder {

  var mainURL: URL {
         return URL(string: "https://firebasestorage.googleapis.com/")!
    
      }
  
     var requestURL: URL {
        return mainURL.appendingPathComponent(path)
    }

  
  var urlRequest: URLRequest {
    var request = URLRequest(url: requestURL)
        request.httpMethod = method.rawValue
       return request
   }
    

}
