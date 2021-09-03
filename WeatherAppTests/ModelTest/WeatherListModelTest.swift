//
//  WeatherListModelTest.swift
//  WeatherAppTests
//
//  Created by Amr Saeed on 02/09/2021.
//
import XCTest
@testable import WeatherApp
class WeatherListModelTest: XCTestCase {
    
    
    var sut:  WeatherListModel?
    //test parsing json with codable
    func test_FeedsListModel_ShouldDecodeModel(){
        //Given
        let expectedData =  WeatherListModel.createWeatherList()
        
        decodingData(object: WeatherListModel.self, fileResourece: "WeatherListData") { respones in
            //When
            
            switch respones{
            case .success(let data):
                self.sut =  data
            case .failure(_):
                break
            }
        }
        
        // Then
    
        XCTAssertEqual(sut?.list[0].main?.temp, WeatherListModel.createWeatherList().list[0].main?.temp)
        XCTAssertEqual(sut?.city?.id, expectedData.city?.id)
    }
}
   
