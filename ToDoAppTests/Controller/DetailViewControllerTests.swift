//
//  DetailViewControllerTests.swift
//  ToDoAppTests
//
//  Created by Daniil Belyaev on 25.06.2021.
//

import XCTest
import CoreLocation
@testable import ToDoApp
class DetailViewControllerTests: XCTestCase {

    var sut: DetailViewController!
    
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: String(describing: DetailViewController.self)) as! DetailViewController
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testHasTitleLabel() {
        XCTAssertNotNil(sut.titleLabel)
        XCTAssertTrue(sut.titleLabel.isDescendant(of: sut.view))
    }
    func testHasDescriptionLabel() {
        XCTAssertNotNil(sut.descriptionLabel)
        XCTAssertTrue(sut.descriptionLabel.isDescendant(of: sut.view))
    }
    func testHasDateLabel() {
        XCTAssertNotNil(sut.dateLabel)
        XCTAssertTrue(sut.dateLabel.isDescendant(of: sut.view))
    }
    func testHasMapView() {
        XCTAssertNotNil(sut.mapView)
        XCTAssertTrue(sut.mapView.isDescendant(of: sut.view))
    }
    func testHasLocationLabel() {
        XCTAssertNotNil(sut.locationLabel)
        XCTAssertTrue(sut.locationLabel.isDescendant(of: sut.view))
    }
    func testSettingsTasksSetsTitleLabel() {
        
        let coordinate = CLLocationCoordinate2D(latitude: 54, longitude: 56)
        
        let location = Location(name: "Baz", coordinate: coordinate)
        let date = Date(timeIntervalSince1970: 1546300800)
        let task = Task(title: "Foo", description: "Bar", location: location, date: date)
        sut.task = task
        
        sut.beginAppearanceTransition(true, animated: true)
        sut.endAppearanceTransition()
        
        XCTAssertEqual(sut.titleLabel.text, task.title)
        XCTAssertEqual(sut.descriptionLabel.text, task.description)
        XCTAssertEqual(sut.dateLabel.text, "01.01.19")
        XCTAssertEqual(sut.locationLabel.text, task.location?.name)
        XCTAssertEqual(sut.mapView.centerCoordinate.latitude, 54, accuracy: 0.001)
        XCTAssertEqual(sut.mapView.centerCoordinate.longitude, 56, accuracy: 0.001)


    }


}
