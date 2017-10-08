//
//  DependencyTest.swift
//  Uni+
//
//  Created by Chase on 8/10/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import XCTest
@testable import Uni_

class DependencyTest: XCTestCase {
    
    var note: Note!
    var cal: CalendarEvent!
    var course: TimetableEvent!
    
    override func setUp() {
        super.setUp()
        note = Note.init(date: "2017-10-08-Sunday", description: "This is a Note")
        cal = CalendarEvent.init(date: "2017-10-08-Sunday", endDate: "2017-10-08-Sunday", description: "This is a calendar", people: "Chase")
    
        
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testNoteInjection(){
    
        course = TimetableEvent.init(event: note, place: "Building80", startTime: 15, endTime: 18)
        
        XCTAssertTrue(course.detail is Note)
        XCTAssertEqual(course.description, note.description)
        
        
        
        
    
    
    }
    
    func testCalInjection(){
        
        course = TimetableEvent.init(event: cal, place: "Building14", startTime: 19, endTime: 21)
        XCTAssertTrue(course.detail is CalendarEvent)
        XCTAssertEqual(course.date, cal.date)
        
    
    }
    
}
