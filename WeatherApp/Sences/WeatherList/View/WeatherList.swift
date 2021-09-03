//
//  WeatherList.swift
//  WeatherApp
//
//  Created by Amr Saeed on 31/08/2021.
//

import UIKit

class WeatherList: UIViewController {

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
    var tempConverter =  UIBarButtonItem()
    //MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
   
        addNavigationItem()
 
        WeatherListImplementation.configure(WeatherListViewController: self)
        presenter?.viewDidLoad()
        
        }
    
    
    //MARK:- Helper
    private func addNavigationItem(){
        tempConverter =  UIBarButtonItem(title: "Fahrenheit", style: .plain, target: self, action: #selector(changeTemp(button:)))

        navigationItem.title = "Weather"
        tempConverter.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationItem.rightBarButtonItem = tempConverter
    }
    
    //MARK:- Selector
    
    @objc func changeTemp(button:UIButton) {
        presenter?.isTempChanged = !(presenter?.isTempChanged ?? false )
        weatherListTableView.reloadData()
        }
    
}


//MARK:- TableView Delegate Methods
extension WeatherList: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        presenter?.didSelect(row: indexPath.row)
        
    }
}
//MARK:- TableView DataSource  Methods
extension WeatherList: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        presenter?.numberOfCell() ?? 0
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeue() as WeatherItemCell
        // cell configuration
        presenter?.configurationWeatherItemCell(cell: cell, index: indexPath.row)
        
        return cell
    }

}

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
    
}
