//
//  Uni_UITests.swift
//  Uni+UITests
//
//  Created by Chase Liu on 5/8/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import XCTest

class Uni_UITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        let app = XCUIApplication()
        app.buttons["GO!"].tap()
        
        let tablesQuery = app.tables
        tablesQuery.children(matching: .cell).element(boundBy: 1).children(matching: .staticText).element.tap()
        
        let tabBarsQuery = app.tabBars
        tabBarsQuery.buttons["Timetable"].tap()
        
        let calendarButton = tabBarsQuery.buttons["Calendar"]
        calendarButton.tap()
        calendarButton.tap()
        
        let notesButton = tabBarsQuery.buttons["Notes"]
        notesButton.tap()
        calendarButton.tap()
        app.collectionViews.children(matching: .cell).element(boundBy: 32).staticTexts["2"].swipeUp()
        notesButton.tap()
        tablesQuery.staticTexts["You can edit however you want "].tap()
        
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
