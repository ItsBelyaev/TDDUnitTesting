//
//  NewTaskViewControllerTests.swift
//  ToDoAppTests
//
//  Created by Daniil Belyaev on 29.06.2021.
//

import XCTest
import CoreLocation
@testable import ToDoApp

class NewTaskViewControllerTests: XCTestCase {

    
    var sut: NewTaskViewController!
    
    override func setUpWithError() throws {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: String(describing: NewTaskViewController.self)) as? NewTaskViewController
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testHasTextFields() {
        XCTAssertTrue(sut.titleTextField.isDescendant(of: sut.view))
        XCTAssertTrue(sut.locationTextField.isDescendant(of: sut.view))
        XCTAssertTrue(sut.dateTextField.isDescendant(of: sut.view))
        XCTAssertTrue(sut.addressTextField.isDescendant(of: sut.view))
        XCTAssertTrue(sut.descriptionTextField.isDescendant(of: sut.view))
        XCTAssertTrue(sut.saveButton.isDescendant(of: sut.view))
        XCTAssertTrue(sut.cancelButton.isDescendant(of: sut.view))



    }
    func testSaveUsesGeocoderToConvertCoordsFromAddress() {
        
        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        let date = df.date(from: "01.01.19")

        
        sut.titleTextField.text = "Foo"
        sut.locationTextField.text = "Bar"
        sut.dateTextField.text = "01.01.19"
        sut.addressTextField.text = "Moscow"
        sut.descriptionTextField.text = "Baz"
        sut.taskManager = TaskManager()
        let mockGeocoder = MockCLGeocoder()
        sut.geocoder = mockGeocoder
        sut.save()
        
        let coordinate = CLLocationCoordinate2D(latitude: 55.7558, longitude: 37.6173)
        let location = Location(name: "Bar", coordinate: coordinate)
        let generatedTask = Task(title: "Foo", description: "Baz", location: location, date: date)
        let placemark = MockCLPlacemark()
        placemark.mockCoordinate = CLLocationCoordinate2D(latitude: 55.7558, longitude: 37.6173)
        mockGeocoder.completionHandler?([placemark], nil)
        
        let task = sut.taskManager.task(at: 0)

        
        XCTAssertEqual(task, generatedTask)
    }

}

extension NewTaskViewControllerTests {
    class MockCLGeocoder: CLGeocoder {
        var completionHandler: CLGeocodeCompletionHandler?
        override func geocodeAddressString(_ addressString: String, completionHandler: @escaping CLGeocodeCompletionHandler) {
            self.completionHandler = completionHandler
        }
    }
    class MockCLPlacemark: CLPlacemark {
        var mockCoordinate: CLLocationCoordinate2D!
        
        override var location: CLLocation {
            return CLLocation(latitude: mockCoordinate.latitude, longitude: mockCoordinate.longitude)
        }
    }
}
