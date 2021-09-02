//
//  LocalPersistenceWeatherGetwayTest.swift
//  WeatherAppTests
//
//  Created by Amr Saeed on 02/09/2021.
//

import XCTest
import RealmSwift
@testable import WeatherApp
class LocalPersistenceWeatherGetwayTest: XCTestCase {

    //MARK:- Properities
     
     var sut: LocalPersistenceWeatherGetway!
     
     var localPersistenceWeatherSpy = RealmPersistenceWeatherGatewaySpy()
     

     override  func setUp() {
         super.setUp()

         sut = LocalPersistenceWeatherGetway(realmMethods:  localPersistenceWeatherSpy)
     }

     override func tearDown() {
          sut = nil
         
         super.tearDown()
     }
     
   //MARK:- CRUD RealmSwift
     
     // MARK:- Add Weather
     
     //  when add Weatherpass success message
     func test_LocalPersistenceWeatherGetway_addWeather_success () {
          // Given
         
         let WeatherParamters = WeatherListModel.createWeatherList()
         
         localPersistenceWeatherSpy.addWeatherCompletionHandler = .success("Data successfully saved")
         
         let addWeatherCompletionHandlerExpectation = expectation(description: "create Weather completion handler expectation")
         
          // When
         sut.addWeather(object: WeatherParamters) { (result) in
             
         // Then
             guard let SuccessMessage = try? result.get() else {
                
                 XCTFail("Should've saved the Weather  with success")
                 
                 return
             }
           
             XCTAssertEqual(SuccessMessage as! String, "Data successfully saved")
             
             addWeatherCompletionHandlerExpectation.fulfill()
     
         }
         
         waitForExpectations(timeout: 1, handler: nil)
         
     }
     
     
  // Make sure  when failure to add Weather should throw an error
     func test_LocalPersistenceWeatherGetway_addWeather_failure() {

          // Given
         
         let WeatherParamters  = WeatherListModel.createWeatherList()

        localPersistenceWeatherSpy.addWeatherCompletionHandler = .failure(RealmError(error: NSError.createError(withMessage: "Failed save Weather to the data base")))
         
         let failurWeatherCompletionHandlerExpectation = expectation(description: " failure create Weather  completion handler expectation")

          // When
         
         sut.addWeather(object: WeatherParamters ) { (result) in
             
             // Then
             
             switch result {

             case .success(_):
                 break
                 
             case .failure(let error):

                 XCTAssertNotNil(error)
             }
             
             failurWeatherCompletionHandlerExpectation.fulfill()

         }

         waitForExpectations(timeout: 1, handler: nil)
     }


 // MARK:- Read Weather
     //  when Fetch Weather sholud return data what we have saved
 func test_LocalPersistenceFeedsGetway_fetchWeather_success() {

      // Given
     let WeatherParamters  = WeatherListModel.createWeatherList()
     
     localPersistenceWeatherSpy.readWeather = [WeatherParamters]
     
     localPersistenceWeatherSpy.addWeatherCompletionHandler = .success("Data successfully saved")

     let FetchWeatherCompletionHandlerExpectation = expectation(description: "Fetch Weather completion handler expectation")
     
     //When
     
     sut.addWeather(object: WeatherParamters) {  _ in}
     
     sut.fetchWeather { (result) in
         
         switch result {
         
         case .success(let data):
             
            XCTAssertEqual(data, WeatherParamters)
             
         case .failure(_):
             break
         }
         FetchWeatherCompletionHandlerExpectation.fulfill()
     }
     waitForExpectations(timeout: 1, handler: nil)
 }
     
     
     
     
 //MARK:- Delete Weather
     
     // After save Weather test if we can delete feeds successfully
     func test_LocalPersistenceFeedsGetway_deleteWeather_success () {
          // Given
         
         let WeatherParamters = WeatherListModel.createWeatherList()
         
         localPersistenceWeatherSpy.addWeatherCompletionHandler = .success("Data successfully saved")
         
         localPersistenceWeatherSpy.removeWeatherCompletionHandler =  .success("Data successfully deleted")
         
         let deleteWeatherCompletionHandlerExpectation = expectation(description: "delete Weather completion handler expectation")
         
          // When
         sut.addWeather(object: WeatherParamters) {  _ in}
         
         sut.deleteWeather(object: WeatherParamters) { (result) in
             
             // Then
                 guard let SuccessMessage = try? result.get() else {
                     
                     XCTFail("Should've delete the Weather with success")
                     
                     return
                 }
               
                 XCTAssertEqual(SuccessMessage, "Data successfully deleted")
                 
                 deleteWeatherCompletionHandlerExpectation.fulfill()
             
         }
         

         waitForExpectations(timeout: 1, handler: nil)
         
     }
     
     
     
     // After save Weather test if we try to delete Weather will throw an error because can not detele Weather
     func test_LocalPersistenceFeedsGetway_deleteFeeds_failure () {
         
          // Given
         
         let WeatherParamters = WeatherListModel.createWeatherList()
         
         localPersistenceWeatherSpy.addWeatherCompletionHandler = .success("Data successfully saved")
         
         localPersistenceWeatherSpy.removeWeatherCompletionHandler =  .failure(RealmError(error: NSError.createError(withMessage: "Failed to delete Weather from  the data base")))
         
         let deleteWeatherCompletionHandlerExpectation = expectation(description: "delete Weathercompletion handler expectation")
         
          // When
         
         sut.addWeather(object:WeatherParamters) {  _ in}
         
         sut.deleteWeather(object: WeatherParamters) { (result) in
             
         // Then
             
             switch result {

             case .success(_):
                 break
                 
             case .failure(let error):

                 XCTAssertNotNil(error)
             }

                 
             deleteWeatherCompletionHandlerExpectation.fulfill()
             
         }
         

         waitForExpectations(timeout: 1, handler: nil)
         
     }
     
 }



