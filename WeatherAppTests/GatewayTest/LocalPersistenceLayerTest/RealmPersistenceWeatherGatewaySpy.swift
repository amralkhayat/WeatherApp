//
//  RealmPersistenceFeedsGatewaySpy.swift
//  WeatherAppTests
//
//  Created by Amr Saeed on 02/09/2021.
//



import RealmSwift
@testable import WeatherApp
class RealmPersistenceWeatherGatewaySpy: RealmMethodsProtocol{
  
    var addWeatherCompletionHandler:  Result<String?, RealmError>!
    var readWeather:  [Any]?
    

    func create<T>(_ objects: T, responseHandler: @escaping CallResponse<String>) where T : Object {
        
        responseHandler(addWeatherCompletionHandler)
    }
    
    
    func readObjects<R>(_ object: R.Type) -> [R]? where R : Object {
        
        return readWeather as? [R]
    }
    
    

    
    
   
    

    
    
}
