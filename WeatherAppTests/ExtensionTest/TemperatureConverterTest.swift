//
//  TemperatureConverterTest.swift
//  WeatherAppTests
//
//  Created by Amr Saeed on 03/09/2021.
//

import XCTest
@testable import WeatherApp
class TemperatureConverterTest: XCTestCase {

    func test_TemperatureConverter_ShouldConvert_TempFromKelvinToCelsius() {
       //Given
        let expectedDate = "27°C"
        //Then
        let data = 300.57.TemperatureConverter(from: .kelvin, to: .celsius)
       // When
        XCTAssertEqual(data, expectedDate)
    }

}
