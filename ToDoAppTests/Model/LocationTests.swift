//
//  LocationTests.swift
//  ToDoAppTests
//
//  Created by Daniil Belyaev on 22.06.2021.
//

import XCTest
import CoreLocation
@testable import ToDoApp


class LocationTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each
    }
    func testInitsSetsCoordinates() {
        let coordinate = CLLocationCoordinate2D(
            latitude: 1,
            longitude: 2)
        let location = Location(name: "Foo", coordinate: coordinate)
        XCTAssertEqual(location.coordinate?.latitude, coordinate.latitude)
        XCTAssertEqual(location.coordinate?.longitude, coordinate.longitude)
        XCTAssertEqual(location.name, "Foo")
    }
}
