//
//  NetworkErrors.swift
//  WeatherApp
//
//  Created by Amr Saeed on 01/09/2021.
//


import Foundation

struct NetworkRequestError: Error {
    
    let error: Error?
    
    var localizedDescription: String {
        
        return error?.localizedDescription ?? "Network request error - no other information"
    }
}

struct ApiError: Error {
    let data: Data?
  
    let httpUrlResponse: HTTPURLResponse
  
}

struct ApiParseError: Error {
  
    static let code = 0
    
    let error: Error
  
    let httpUrlResponse: HTTPURLResponse
  
    let data: Data?
    
    var localizedDescription: String {
      
        return error.localizedDescription
    }
}
