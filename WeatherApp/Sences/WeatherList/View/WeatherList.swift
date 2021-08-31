//
//  WeatherList.swift
//  WeatherApp
//
//  Created by Amr Saeed on 31/08/2021.
//

import UIKit

class WeatherList: UIViewController {
    //MARK:- IBOUTLETS
    @IBOutlet weak var weatherListTableView: UITableView!{
        
        didSet {
            
            weatherListTableView.delegate = self
            
            weatherListTableView.dataSource = self
            
            weatherListTableView.tableFooterView =  UIView()
            
            weatherListTableView.registerCellNib(cellClass: WeatherItemCell.self)
            
        }
        
    }
    //MARK:- Properties
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
   
        
        }
    
    
    //MARK:- Helper

}


extension WeatherList: UITableViewDelegate {
    
}

extension WeatherList: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return  tableView.dequeue() as WeatherItemCell
    }
    
    
}
