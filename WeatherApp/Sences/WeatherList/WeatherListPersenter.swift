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
}


//MARK:- protocol WeatherListPresenter  responsible for handling business logic of the presenter
protocol WeatherListPresenter {
    func numberOfCell() -> Int
    func viewDidLoad()
    func getWeahterList()
}
//MARK:-  protocol WeatherItemCellView Handling cell view
protocol WeatherItemCellView {
    func displayCellBody(list: weatherList )
}


class WeatherListPresenterImplementation: WeatherListPresenter{
 

    //MARK:- Properities
     weak var view: WeatherListView?
    private var useCase : WeatherListUseCase
    private var router : WeatherListViewRouter
    private var weatherList: WeatherListModel?

    
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
        
        useCase.getWeatherList { [weak self] (result) in
            guard let self = self else {return}
            
            switch result{
            
            case let .success(data):
                
                self.weatherList = data
                
                self.view?.reloadTableView()
                
            case let .failure(error):
                
            self.view?.show(message: error.localizedDescription)
            }
        }
    }
    
    //MARK:- TableView properties 
    func numberOfCell() -> Int {
        return weatherList?.list.count ?? 0
    }
   
    func configurationWeatherItemCell (cell:WeatherItemCellView , index: Int) {
        guard let list = self.weatherList?.list else {return}
        cell.displayCellBody(list: list[index])
          
      }
    
    
    func didSelect(row: Int) {
     
        guard let data = self.weatherList else {return}
        
        let list = data.list[row]
        
        let weather = list.weather[0]
        
         let main = list.main
        
        let weatherDetails = WeatherDetailsModel(date: list.dt , city: data.city?.name ?? "",
                                                 icon: weather.icon ?? "", main: weather.descr ?? "" , temp: main?.temp ?? 0.0
                                                 ,maxTemp: main?.tempMax ?? 0.0, minTemp: main?.tempMin ?? 0.0)
        
        router.presentDetailsView(for: weatherDetails)
    }
    
    
}
