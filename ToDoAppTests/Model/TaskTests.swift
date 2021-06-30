//
//  TaskTests.swift
//  ToDoAppTests
//
//  Created by Daniil Belyaev on 22.06.2021.
//

import XCTest
@testable import ToDoApp

class TaskTests: XCTestCase {

    func testInitTaskWithTitle() {
        let task = Task(title: "Foo") // Foo Bar Baz
        
        XCTAssertNotNil(task)
    }
    func testInitTaskWithTitleAndDescription() {
        let task = Task(title: "Foo", description: "Bar")
        
        XCTAssertNotNil(task)
    }
    func testWhenGivenTitleSetsTitle() {
        let string = "Foo"
        let task = Task(title: string)
        XCTAssertEqual(task.title, string)
    }
    func testWhenGivenDescriptionSetsDescription() {
        let string = "Foo"
        let task = Task(title: string, description: string)
        XCTAssertEqual(task.description, string)
    }
    func testTaskInitsWithDate() {
        let task = Task(title: "Foo")
        XCTAssertNotNil(task.date)
    }
    func testWhenGivenLocationSetsLocation() {
        let location = Location(name: "Foo")
        
        let task = Task(title: "Bar", description: "Baz", location: location)
        XCTAssertEqual(location, task.location)
    }
}
