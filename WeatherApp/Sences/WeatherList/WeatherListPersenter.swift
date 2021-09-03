//
//  WeatherListPersenter.swift
//  WeatherApp
//
//  Created by Amr Saeed on 02/09/2021.
//

import Foundation
//MARK:- protocol WeatherListView  show the interaction between view and presenter
protocol WeatherListView: AnyObject {
    func show(message: String)
    func reloadTableView()
    func changeItemBarTitle(title: String)
    func showIndecator ()
    func hideIndecator ()
}


//MARK:- protocol WeatherListPresenter  responsible for handling business logic of the presenter
protocol WeatherListPresenter {
    func numberOfCell() -> Int
    func viewDidLoad()
    func getWeahterList()
    func changeTemp(temp:Double) -> String
    var isTempChanged: Bool {get}
}

//MARK:-  protocol WeatherItemCellView Handling cell view
protocol WeatherItemCellView {
    func displayCellBody(list: weatherList )
    func tempMode(mode:String)
}


class WeatherListPresenterImplementation: WeatherListPresenter{
 
    //MARK:- Properities
     weak var view: WeatherListView?
    private var useCase : WeatherListUseCase
    private var router : WeatherListViewRouter
    private var weatherList: WeatherListModel?
    var isTempChanged: Bool = false
    
    // MARK:- Init
    init(view: WeatherListView, useCase:  WeatherListUseCase, router: WeatherListViewRouter) {
        self.view = view
        self.useCase = useCase
        self.router = router
       
    }
    
   // func get called when before load viewController
    func viewDidLoad() {
        getWeahterList()
    }
    
    /* getWeahterList used for call weather list from api
    and then cashe it to the realm database and populate it to the tableView */
    
    func getWeahterList() {
        self.view?.showIndecator()
        useCase.getWeatherList { [weak self] (result) in
            guard let self = self else {return}
            
            switch result{
            
            case let .success(data):
                
                self.view?.hideIndecator()
                
                self.weatherList = data
           
                self.view?.reloadTableView()
                
            case let .failure(error):
                
                self.view?.hideIndecator()
                
            self.view?.show(message: error.localizedDescription)
            }
        }
    }
    
 
    func changeTemp(temp:Double) -> String {
        if isTempChanged{
            self.view?.changeItemBarTitle(title: "Celsius")
           return temp.TemperatureConverter(from: .kelvin, to: .fahrenheit)
        }else {
            self.view?.changeItemBarTitle(title: "Fahrenheit")
            return temp.TemperatureConverter(from: .kelvin, to: .celsius)
        }
    }
    
    //MARK:- TableView properties 
    func numberOfCell() -> Int {
        return weatherList?.list.count ?? 0
    }
   
    func configurationWeatherItemCell (cell:WeatherItemCellView , index: Int) {
        guard let list = self.weatherList?.list else {return}
        cell.displayCellBody(list: list[index])
        
        cell.tempMode(mode: changeTemp(temp: list[index].main?.temp ?? 0.0))
      }
    
    
    func didSelect(row: Int) {
   
        guard let data = self.weatherList else {return}
        
        let list = data.list[row]
        
        let weather = list.weather[0]
        
        let main = list.main
       
       
        let weatherDetails = WeatherDetailsModel(date: list.dt , city: data.city?.name ?? "",
                                                                 icon: weather.icon ?? "",
                                                                 main: weather.descr ?? "" ,
                                                                 temp: changeTemp(temp: main?.temp ?? 0.0 ))
        
        router.presentDetailsView(for: weatherDetails)
    }
    
    
}

