//
//  WeatherListViewControllerTest.swift
//  WeatherAppTests
//
//  Created by Amr Saeed on 03/09/2021.
//

import XCTest
@testable import WeatherApp
class WeatherListViewControllerTest: XCTestCase {

    // MARK: - Properities
    
    var sut: WeatherList!

    //MARK:- Set up
    override func setUp() {
        
        sut =  WeatherList()
        
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        
        sut = nil
        
        super.tearDown()
    }
    
    //MARK:- Tests
    
    func test_WeatherList_CanInstantiateAlbums_ViewController (){
        
        XCTAssertNotNil(sut)
    }
    
    func test_WeatherList_WhenTableViewLoad_shouldBeNotNill (){
        XCTAssertNotNil(sut.weatherListTableView)
    }
    
    func test_WeatherList_ShouldSetTableViewDataSource(){
        XCTAssertNotNil(sut.weatherListTableView)
    }
    
    
    func test_WeatherList_ShouldToConformsToTableViewViewDataSource(){
        XCTAssert(sut.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:cellForRowAt:))))
    }

    func test_WeatherList_ShouldToConformsToTableViewViewDeleagte(){
        XCTAssert(sut.conforms(to: UITableViewDelegate.self))
      
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:didSelectRowAt:))))
    }
    
    
    
}
