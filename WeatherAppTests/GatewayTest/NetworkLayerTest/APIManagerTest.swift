//
//  APIManagerTest.swift
//  WeatherAppTests
//
//  Created by Amr Saeed on 02/09/2021.
//

import XCTest
import RealmSwift
@testable import WeatherApp
class APIManagerTest: XCTestCase {
    
    var sut: APIManager!
    
    let configuration: URLSessionConfiguration = {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        return configuration
    }()
     
    override  func setUp() {
        super.setUp()
        
        sut = APIManager(session: configuration)
    }

    override func tearDown() {
        sut = nil
        
        super.tearDown()
    }
    
    
    //MARK:- Test Success respones
    func test_APIManager_200_successfulRequest(){
        // Given

        let expected = TestWeatherModel.createTestWeather()
      
      
        let responseJSONData = try! JSONEncoder().encode(expected)
       
      
        MockURLProtocol.respones(200, responseJSONData, nil)
      
        let expectation = XCTestExpectation(description: "Loading")
      
        // When
      
      sut.performRequest(TestWeatherModel.self, router: testApi.test) { result in
        
        // then
        
            switch result {
              
            case .success(let data ):
      
             
                XCTAssertEqual(data, expected, "Data does not match")
              
            case .failure(let error):
              
                XCTFail("Request was not successful: \(error.localizedDescription)")
            }
            expectation.fulfill()
        }
      
        wait(for: [expectation], timeout: 1)
    }

    //MARK:- Test Success respones with parseError
func test_APIManager_whenSeccefullRequest_parseError(){
  
     // Given
  
  MockURLProtocol.respones(200, Utf8Data(), nil)
  
     let expectedParsingErrorMessage = "The data couldn’t be read because it is missing."
  
     let expectation = XCTestExpectation(description: "Loading")
  
     // When
  
      sut.performRequest(TestWeatherModel.self, router:  testApi.test) { result in
        
      // then
         do {
      
             let _ = try result.get()
          
             XCTFail("Expected parse error to be thrown")
          
         } catch let error as ApiParseError{
          
             XCTAssertEqual(Utf8Data()?.base64EncodedData(), error.data?.base64EncodedData(),"Data doesn't match")
          
             XCTAssertEqual(expectedParsingErrorMessage, error.localizedDescription, "Error message doesn't match")
          
         } catch{
          
             XCTFail("Expected parse error to be thrown")
         }

         expectation.fulfill()
        
     }
     wait(for: [expectation], timeout: 1)
 }
  
  
    //MARK:- Test failure respones with 4xx
  func test_APIManager_whenRespones4xx(){
      // Given
 
    
       MockURLProtocol.respones(400, Utf8Data(), nil)
    
      let expectation = XCTestExpectation(description: "Loading")
    
      // When
    
      sut.performRequest(TestWeatherModel.self, router: testApi.test ) { result in
        
       // then
          do {
      
              let _ = try result.get()
            
              XCTFail("Expected parse error to be thrown")
            
          } catch let error as ApiError{

              XCTAssertEqual(400, error.httpUrlResponse.statusCode,"The http response is not the expected one")
            
              XCTAssertEqual(Utf8Data()?.base64EncodedData(), error.data?.base64EncodedData(),"Data doesn't match")
            
          } catch{
            
              XCTFail("Expected parse error to be thrown")
          }

          expectation.fulfill()
      }
      wait(for: [expectation], timeout: 1)
  }
  
    //MARK:- Test failure when there is no HTTPURLresponse
  func test_APIManager_when_ThereIsNo_HTTPURLresponse (){
    
      // Given
    
      let expectedError  = NSError.createError(withMessage:  "The requested resource could not be found but may be available in the future")
    
      MockURLProtocol.respones(nil, nil,  expectedError)
    
      let expectation = XCTestExpectation(description: "Loading")
    
      // When
    
      sut.performRequest(TestWeatherModel.self, router: testApi.test ) { result in
          // Then
  
             do {
              
                 let _ = try result.get()
              
                 XCTFail("Expected parse error to be thrown")
              
             } catch let error as NetworkRequestError{
              
              XCTAssertEqual(expectedError.localizedDescription, error.localizedDescription, "Error message doesn't match")

             } catch{
              
                 XCTFail("Expected parse error to be thrown")
             }
        
          expectation.fulfill()
      }
      wait(for: [expectation], timeout: 1)
      
    
  }

}

//MARK:-  TestWeatherModel to  test model to test 200 successfulRequest
// MARK: - TestWeatherModel
struct TestWeatherModel: Codable,Equatable {
    let list: [ListTest]
    let city: CityTest
}
//
// MARK: - City
struct CityTest: Codable ,Equatable{
    let id: Int
    let name: String
}
//
// MARK: - List
struct ListTest: Codable , Equatable{
    let dt: Int
    let main: MainTest
    let weather: [WeatherTest]
}
//
// MARK: - Main
struct MainTest: Codable ,Equatable{
    let temp, feelsLike, tempMin, tempMax: Double
    let humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike
        case tempMin
        case tempMax
        case humidity
    }
}
//
// MARK: - Weather
struct WeatherTest: Codable ,Equatable{
    let id: Int
    let main, weatherDescription, icon: String

    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

extension  TestWeatherModel{

    static  func createTestWeather () -> TestWeatherModel {
        let city = CityTest(id: 360630, name: "Cairo")
        let main = MainTest(temp: 300.57, feelsLike:  301.87, tempMin: 299.79, tempMax: 300.57, humidity: 61)
        let weather = WeatherTest(id:  800, main: "Clear", weatherDescription: "clear sky", icon: "01n")
        var weathers = [WeatherTest]()
        weathers.append(weather)

       let weahterList = ListTest(dt: 1630530000, main: main, weather: weathers)

       var wl = [ListTest]()

        wl.append(weahterList)

     return TestWeatherModel(list: wl, city: city)
   }

}
//
