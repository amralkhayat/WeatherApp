//
//  WeatherItemCell.swift
//  WeatherApp
//
//  Created by Amr Saeed on 31/08/2021.
//

import UIKit

class WeatherItemCell: UITableViewCell {

    @IBOutlet weak var weatherDayLabe: UILabel!
    
    @IBOutlet weak var WeahterDateLabel: UILabel!
    
    @IBOutlet weak var weatherTempLabel: UILabel!
    
}

extension WeatherItemCell:  WeatherItemCellView {
    func tempMode(mode: String) {
        weatherTempLabel.text =  mode
    }
    
    
    func displayCellBody(list: weatherList) {
      
        weatherDayLabe.text = "\(list.dt.timeStampToDateConverter()?.prefix(8) ?? "")"
        
        WeahterDateLabel.text = "\(list.dt.timeStampToDateConverter()?.suffix(16) ?? "")"
        
       
        
    }
    
    
}
