//
//  LocalPersistenceWeatherGetway.swift
//  WeatherApp
//
//  Created by Amr Saeed on 02/09/2021.
//

import Foundation
protocol LocalPersistenceMethods: WeatherGateway  {
    
    func addWeather (object: WeatherListModel, completionHandler: @escaping WeatherGatewayCompletionHandler<Any>)
      
}



class LocalPersistenceWeatherGetway: LocalPersistenceMethods{
  
    
    
    //MARK:- Properities
    private var realmMethods : RealmMethodsProtocol?
   
    init(realmMethods : RealmMethodsProtocol ){

        self.realmMethods = realmMethods
        
    }
    
    // MARK: - Add new Weather  and save it to  data storage

    func addWeather (object: WeatherListModel,
                  completionHandler: @escaping WeatherGatewayCompletionHandler<Any>) {
        
        realmMethods?.create(object.self) { result in
            
            switch result {
            
            case .success(let message ):
                
                completionHandler(.success(message ?? ""))
                
            case .failure(let error):

                completionHandler(.failure(RealmError(error: error)))

            }
        }
        
    
    }
    
    
    // MARK: - Fetch Weather  from  realm data storage
    func fetchWeather (completionHandler: @escaping WeatherGatewayCompletionHandler<WeatherListModel>) {

        if let data = realmMethods?.readObjects(WeatherListModel.self)?.first {
            completionHandler(.success(data))
        }
    
    }
    

}
