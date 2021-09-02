//
//  Double+Extension.swift
//  WeatherApp
//
//  Created by Amr Saeed on 02/09/2021.
//

import UIKit
extension Int{
   
    func timeStampToDateConverter () -> String? {
      
        let date = Date(timeIntervalSince1970: TimeInterval(self)) //convert unix timestamp to Date
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "EEEE, d MMM yyyy "
     
        
        return dateFormatter.string(from: date)
    }
}
