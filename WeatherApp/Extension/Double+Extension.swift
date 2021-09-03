//
//  Double+Extension.swift
//  WeatherApp
//
//  Created by Amr Saeed on 03/09/2021.
//

import UIKit


extension Double {
    func TemperatureConverter (from inputTemp:UnitTemperature , to outTemp: UnitTemperature ) -> String {
      
        let measurementformatter = MeasurementFormatter()
        
        measurementformatter.numberFormatter.maximumFractionDigits = 0 // when we print temp should not be decimal
        
        measurementformatter.unitOptions = .providedUnit // provide unit when we convert temp
        
        let inputTemp =  Measurement(value: self, unit: inputTemp)
        
        let outputTemp = inputTemp.converted(to: outTemp)
        
        
        return measurementformatter.string(from: outputTemp) // return converted temp string type 
    }
}
