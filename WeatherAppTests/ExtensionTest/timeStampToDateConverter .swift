//
//  Int+ExtensionTest.swift
//  WeatherAppTests
//
//  Created by Amr Saeed on 02/09/2021.
//

import XCTest
@testable import WeatherApp
class IntExtension: XCTestCase {
   
    
    func test_timeStampToDateConverter() {
       //Given
        let expectedDate = "Thursday, 2 Sep 2021 "
        //Then
        let data = 1630605600.timeStampToDateConverter()
       // When
        XCTAssertEqual(data, expectedDate)
    }
}
