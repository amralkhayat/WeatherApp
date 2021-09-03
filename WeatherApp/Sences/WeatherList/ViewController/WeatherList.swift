//
//  WeatherList.swift
//  WeatherApp
//
//  Created by Amr Saeed on 31/08/2021.
//

import UIKit
import UserNotifications
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
   
       
        configurationUI()

    
        }
    
    
    //MARK:- Helper
    private func configurationUI(){
        addNavigationItem()
        
        WeatherListImplementation.configure(WeatherListViewController: self)
        
        presenter?.viewDidLoad()
        
        
    }
    
    private func addNavigationItem(){
        
        tempConverter =  UIBarButtonItem(title: "Fahrenheit", style: .plain, target: self, action: #selector(changeTemp(button:)))

        navigationItem.title = "Weather"
        
        tempConverter.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        navigationItem.rightBarButtonItem = tempConverter
    }
    
  func scheuleNotifications(title: String , body: String){
        // Initialize User Notification Center Object
        let center = UNUserNotificationCenter.current()
        
        center.removeAllPendingNotificationRequests()
        
   
        // The content of the Notification
        let content = UNMutableNotificationContent()
        
        content.title = title
        
        content.body = body
        
        content.categoryIdentifier = "alarm"
        
        content.sound = .default
        
        // scheule Time to fire notifcations every 24 hours
        var dateComponents =  DateComponents()
        
        dateComponents.hour = 24
        
    
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents , repeats: true)
    
        // create notifcation request , we add rondom id for each notifcation using  UUID()
        let request = UNNotificationRequest(identifier: UUID().uuidString, content:  content, trigger: trigger)
        
        center.add(request)
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

