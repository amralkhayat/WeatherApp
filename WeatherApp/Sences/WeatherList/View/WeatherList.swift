//
//  WeatherList.swift
//  WeatherApp
//
//  Created by Amr Saeed on 31/08/2021.
//

import UIKit

class WeatherList: UIViewController , WeatherListView{

    var presenter:  WeatherListPresenterImplementation?
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
   
        navigationItem.title = "City"
 
        WeatherListImplementation.configure(WeatherListViewController: self)
        presenter?.viewDidLoad()
        }
    
    
    //MARK:- Helper

}


extension WeatherList: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        presenter?.didSelect(row: indexPath.row)
        
    }
}

extension WeatherList: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        presenter?.numberOfCell() ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeue() as WeatherItemCell
        presenter?.configurationWeatherItemCell(cell: cell, index: indexPath.row)
        return cell
    }
    
    
    
    func show(message: String) {
        
    }
    
    func reloadTableView() {
        DispatchQueue.main.async { [weak self] in
            self?.weatherListTableView.reloadData()
        }
    }
    
    
}
