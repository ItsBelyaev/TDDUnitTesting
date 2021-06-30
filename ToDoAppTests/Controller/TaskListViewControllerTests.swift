//
//  TaskListViewControllerTests.swift
//  ToDoAppTests
//
//  Created by Daniil Belyaev on 22.06.2021.
//

import XCTest
import UIKit
@testable import ToDoApp

class TaskListViewControllerTests: XCTestCase {
    var sut: TaskListViewController!

    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: String(describing: TaskListViewController.self))
        
        sut = vc as? TaskListViewController
        
        sut.loadViewIfNeeded()
    }

    override func tearDown(){

    }

    func testTableViewNotNilWhenViewIsLoaded() {
        XCTAssertNotNil(sut.tableView)
        

    }
    func testWhenViewIsLoadedDataProviderIsNotNil() {
        XCTAssertNotNil(sut.dataProvider)
    }
    func testWhenViewIsLoadedTableViewDelegateIsSet() {
        XCTAssertNotNil(sut.tableView.delegate is DataProvider)
    }
    func testWhenViewIsLoadedTableViewDataSourceIsSet() {
        XCTAssertNotNil(sut.tableView.dataSource is DataProvider)
    }
    func testWhenViewIsLoadedTableViewDelegateEqualsTableViewDataSource() {
        
        XCTAssertEqual(
            sut.tableView.delegate as? DataProvider,
            sut.tableView.dataSource as? DataProvider)
    }
    

}
