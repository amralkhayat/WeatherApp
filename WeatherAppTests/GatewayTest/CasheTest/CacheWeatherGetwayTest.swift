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

}
