//
//  CacheFeedsGetwayTest.swift
//  WeatherAppTests
//
//  Created by Amr Saeed on 02/09/2021.
//

import XCTest
@testable import WeatherApp
class CacheWeatherGetwayTest: XCTestCase {

    //MARK:- Properities
     
     var sut: CacheWeatherGetway!
     
     var localPersistenceFeedsSpy = LocalPersistenceGatewaySpy()
    
     var apiWeatherGatewaySpy = APIWeatherGatewaySpy()
     

     override  func setUp() {
         super.setUp()

        sut =  CacheWeatherGetway(apiWeatherGateway: apiWeatherGatewaySpy , localPersistenceWeathersGateway: localPersistenceFeedsSpy)
     }

     override func tearDown() {
          sut = nil
         
         super.tearDown()
     }
    
    
//    //MARK:- Fetch weather from server
//    func test_CacheWeatherGetway_fetchWeather_api_success_save_locally(){
//        // Given
//        let weatherReturned =  WeatherListModel.createWeatherList()
//        
//        apiWeatherGatewaySpy.fetchWeatheResultToBeReturned = .success(weatherReturned)
//        
//        let fetchWeatherCompletionHandlerExpectation = expectation(description: "Fetch Weather completion handler expectation")
//
//        // When
//        
//        sut.fetchWeather { _ in}
//        sut.handleFetchWeatherApiResult( apiWeatherGatewaySpy.fetchWeatheResultToBeReturned) { (result) in
//            switch result {
//            
//            case .success(_):
//                
//            case .failure(_):
//                break
//            }
//        }
//          
//        
//            fetchWeatherCompletionHandlerExpectation.fulfill()
//            
//        
//        
//        waitForExpectations(timeout: 1, handler: nil)
//        
//        
//        
//    }
    
    
    

}
