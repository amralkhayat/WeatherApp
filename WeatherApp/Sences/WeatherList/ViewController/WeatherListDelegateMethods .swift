//
//  WeatherListDelegateMethods .swift
//  WeatherApp
//
//  Created by Amr Saeed on 03/09/2021.
//

import UIKit
extension WeatherList: WeatherListView {
   
    
    
    func showIndecator() {
        DispatchQueue.main.async { [weak self ] in
            guard let self = self else {return}
            self.showSpinner(onView: self.view)
        }
    }
    
    func hideIndecator() {
        DispatchQueue.main.async { [weak self ] in
            guard let self = self else {return}
            self.removeSpinner()
        }
    }
    
    func changeItemBarTitle(title: String) {
        tempConverter.title = title
    }
    
    
    func show(message: String) {
        self.presentAlert(withTitle: "Error", message:message, actions: ["Ok" : UIAlertAction.Style.default])
    }
    
    func reloadTableView() {
        DispatchQueue.main.async { [weak self] in
            self?.weatherListTableView.reloadData()
        }
    }
    
    
    func randomDescriptiom(desc: String) {
     
        scheuleNotifications(title: "Weather App", body: desc)
    }
    
}
