//
//  WeatherDetailsPresenter.swift
//  WeatherApp
//
//  Created by Amr Saeed on 02/09/2021.
//

import Foundation

//MARK:- protocol WeatherDetailsView  show the interaction between view and presenter
protocol WeatherDetailsView: AnyObject {
    func displayWeatherDetails(details: WeatherDetailsModel)

}
//MARK:- protocol WeatherDetail responsible for handling business logic of the presenter
protocol WeatherDetailsPresenter {
     func viewDidLoad()
}


class WeatherDetailsPresenterImplementation: WeatherDetailsPresenter {
   
    
//    //MARK:- Properities
     weak var view: WeatherDetailsView?
    var weatherDetails: WeatherDetailsModel
    
    // MARK:- Init
    init(view: WeatherDetailsView ,weatherDetails: WeatherDetailsModel ) {
        self.view = view
        self.weatherDetails = weatherDetails
    }
    
    
    func viewDidLoad() {
        view?.displayWeatherDetails(details: weatherDetails)
    }
    
    
}
