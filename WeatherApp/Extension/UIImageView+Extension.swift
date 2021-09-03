//
//  UIImage+Extension.swift
//  WeatherApp
//
//  Created by Amr Saeed on 02/09/2021.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func loadImage(imageName: String){
        guard  let url = URL(string: "http://openweathermap.org/img/wn/\(imageName).png") else {return}
  
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url)
    }
}
