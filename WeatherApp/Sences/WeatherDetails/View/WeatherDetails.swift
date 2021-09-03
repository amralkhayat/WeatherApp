//
//  WeatherDetails.swift
//  WeatherApp
//
//  Created by Amr Saeed on 31/08/2021.
//

import UIKit

class WeatherDetails: UIViewController,WeatherDetailsView {
   
    

    var presenter:  WeatherDetailsPresenterImplementation?
    var configurator:  WeatherDetailsConfigurator?
    
    //MARK:- IBOUTLETS
    
    @IBOutlet weak var weatherDateLabel: UILabel!
    
    @IBOutlet weak var weatherCity: UILabel!
    
    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBOutlet weak var weatherDescription: UILabel!
    
    @IBOutlet weak var weatherTempLabel: UILabel!
    
    //MARK:- Properities
   
    
    //MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurationUI()
    }

   //MARK:- Helper
    private func configurationUI(){
        configurator?.configure(WeatherDetailsViewController: self)
        presenter?.viewDidLoad()
    }
    
    
    func displayWeatherDetails(details: WeatherDetailsModel) {
        weatherDateLabel.text = "\(details.date.timeStampToDateConverter() ?? "" )"
        weatherCity.text = details.city
        weatherDescription.text = details.main
        weatherTempLabel.text = "\(details.temp)"
        weatherImage.loadImage(imageName: details.icon)
    }

}
