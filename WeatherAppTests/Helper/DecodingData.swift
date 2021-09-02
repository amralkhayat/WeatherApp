//
//  DecodingData.swift
//  WeatherAppTests
//
//  Created by Amr Saeed on 02/09/2021.
//


import UIKit
@testable import WeatherApp
typealias CallResponseTest<T> = ((Result<T?, Error>) -> Void)

func decodingData<T>(object: T.Type,fileResourece: String, responseHandler:@escaping CallResponseTest<T>) where T: Decodable{
    
    guard let path =  Bundle.main.path(forResource: fileResourece, ofType: "json")
    
    else {fatalError("Can't find search.json file")}

    let url = URL(fileURLWithPath: path)

    do {
        
    let jsonData = try Data(contentsOf: url)
    let data = try JSONDecoder().decode(T.self,from:jsonData)
        
        responseHandler(.success(data))
        
     } catch let error {
        
        responseHandler(.failure(error))
        
    }
}
