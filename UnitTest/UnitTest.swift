//
//  UnitTest.swift
//  UnitTest
//
//  Created by Geng Xu on 2017/10/6.
//  Copyright © 2017年 Chase Liu. All rights reserved.
//

import XCTest
@testable import

class UnitTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
   
    
    func testLogin(){
        
    }
    
    func testCalender(){
        
    }
    
    func testaddNote(){
        let addnote = DetialViewCOntroller.textView(["This is a unit test"])
        
        XCTAssertEqual(addnote, This is a unit test, "This say test passed")
        
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
