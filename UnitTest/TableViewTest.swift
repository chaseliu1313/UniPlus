//
//  TableViewTest.swift
//  Uni+
//
//  Created by Chase on 8/10/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import XCTest
@testable import Uni_


class TableViewTest: XCTestCase {
    
    var sut : FirstTableViewController!
    
    
    override func setUp() {
        super.setUp()
      
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(withIdentifier: "Myday") as! FirstTableViewController
        _ = sut.view
    }
    
    override func tearDown() {
                super.tearDown()
    }
    
    func testFisrtTableViewControllerShouldNoteBeNil(){
    
    
        XCTAssertNotNil(sut.myDayTable)
    }
    
    func testTableDataSource(){
    
         XCTAssertNotNil(sut.myDayTable.dataSource)
         XCTAssertTrue(sut.myDayTable.dataSource is FirstTableViewController)
    
    
    }
    
    func testTableDelegate(){
        
        XCTAssertNotNil(sut.myDayTable.delegate)
        XCTAssertTrue(sut.myDayTable.delegate is FirstTableViewController)
    
    }
    
    func testTableRow(){
        
        
      let sections = sut.myDayTable.numberOfSections
      let rowCount = sut.myDayTable.numberOfRows(inSection: 0)
        
        XCTAssertEqual(sections, 1)
        XCTAssertEqual(rowCount, 4)
    
        
    }
    
    func testCellshouldBeTheSameType(){
    
        let cell = sut.myDayTable.cellForRow(at: IndexPath(row:0, section:0))
        
        XCTAssertTrue(cell is WeatherCell)
        
        let cell2 = sut.myDayTable.cellForRow(at: IndexPath(row:1, section:0))
    
        XCTAssertTrue(cell2 is EventTableViewCell)
        
        let cell3 = sut.myDayTable.cellForRow(at: IndexPath(row:2, section:0))
        
        XCTAssertTrue(cell3 is EventTableViewCell)
        
        let cell4 = sut.myDayTable.cellForRow(at: IndexPath(row:3, section:0))
        XCTAssertTrue(cell4 is EventTableViewCell)
    
    }
    
    
    
}
