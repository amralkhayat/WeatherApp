//
//  RealmError.swift
//  WeatherApp
//
//  Created by Amr Saeed on 01/09/2021.
//

import Foundation

struct RealmError: LocalizedError {
    
    let error: Error?
    
    var localizedDescription: String {
     
        return error?.localizedDescription ?? "unknown error"
    }
}
