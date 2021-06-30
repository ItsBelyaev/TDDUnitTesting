//
//  TaskCellTests.swift
//  ToDoAppTests
//
//  Created by Daniil Belyaev on 24.06.2021.
//

import XCTest
@testable import ToDoApp

class TaskCellTests: XCTestCase {
    
    var cell: TaskCell!

    override func setUp()  {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: String(describing: TaskListViewController.self)) as! TaskListViewController
        controller.loadViewIfNeeded()
        
        let tableView = controller.tableView
        let dataSource = FakeDataSource()
        tableView?.dataSource = dataSource
        
    cell = tableView?.dequeueReusableCell(withIdentifier: String(describing: TaskCell.self), for: IndexPath(row: 0, section: 0)) as? TaskCell
    }

    override func tearDown() {
    }

    func testCellHasTitleLabel() {
        XCTAssertNotNil(cell.titleLabel)
        
    }
    func testCellHasTitleLabelInContentView() {
        XCTAssertTrue(cell.titleLabel.isDescendant(of: cell.contentView))
    }
    func testCellHasLocationLabel() {
        XCTAssertNotNil(cell.locationLabel)
    }
    func testCellHasLocationLabelInContentView() {
        XCTAssertTrue(cell.locationLabel.isDescendant(of: cell.contentView))
    }
    func testCellHasDateLabel() {
        XCTAssertNotNil(cell.dateLabel)
    }
    func testCellHasDateLabelInContentView() {
        XCTAssertTrue(cell.dateLabel.isDescendant(of: cell.contentView))
    }
    func testConfigureSetsTitle() {
        let task = Task(title: "Foo")
        cell.configure(withTask: task)
        XCTAssertEqual(task.title, cell.titleLabel.text)
    }
    func testConfigureSetsDate() {
        let task = Task(title: "Foo")
        cell.configure(withTask: task)

        let df = DateFormatter()
        df.dateFormat = "dd.MM.yy"
        let date = task.date
        let dateString = df.string(from: date!)
        
        XCTAssertEqual(cell.dateLabel.text, dateString)
    }
    func testConfigureSetsLocation() {
        let location = Location(name: "Foo")
        let task = Task(title: "Bar", location: location)
        
        cell.configure(withTask: task)
        XCTAssertEqual(task.location?.name, cell.locationLabel.text)
    }
    func testDoneTaskShouldStrikeThrough() {
        let task = Task(title: "Foo")
        cell.configure(withTask: task, done: true)

        let attributedString = NSAttributedString(string: "Foo", attributes: [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue])
        
        XCTAssertEqual(cell.titleLabel.attributedText, attributedString)
        
    }
    func testDoneTaskDateLabelEqualsNil() {
        let task = Task(title: "Foo")
        cell.configure(withTask: task, done: true)
        
        XCTAssertNil(cell.dateLabel)
    }
    func testDoneTaskLocationLabelEqualsNil() {
        let task = Task(title: "Foo")
        cell.configure(withTask: task, done: true)
        
        XCTAssertNil(cell.locationLabel)
    }

}

extension TaskCellTests {
    class FakeDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            return UITableViewCell()
        }
        
        
    }
}
