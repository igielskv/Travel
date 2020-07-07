//
//  DistanceCalculatorTests.swift
//  TravelTests
//
//  Created by Manoli on 08/07/2020.
//  Copyright © 2020 macForce.one. All rights reserved.
//

import XCTest

class DistanceCalculatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testCoordinatesOfSeattle() throws {
        let calculator = DistanceCalculator()
        let city = try XCTUnwrap(calculator.city(forName: "Seattle"))
        
        XCTAssertEqual(city.coordinates.latitude, 47.61)
        XCTAssertEqual(city.coordinates.longitude, -122.33)
    }
}
