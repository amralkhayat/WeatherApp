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
    
    func test_FeedsListModel_ShouldDecodeModel(){
        
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
     
        
        XCTAssertEqual(sut?.tiles[0].headline, FeedsListModel.createTestTile().tiles[0].headline)
    }
}
