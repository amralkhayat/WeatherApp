//
//  CreateError.swift
//  WeatherAppTests
//
//  Created by Amr Saeed on 02/09/2021.
//

import Foundation
@testable import WeatherApp
//MARK:- Create Error return predefined array
extension NSError {
  
    static func createError(withMessage message: String) -> NSError {
      
        return NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: message])
    }
}
