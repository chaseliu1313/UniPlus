//
//  UnitTest.swift
//  UnitTest
//
//  Created by Geng Xu on 2017/10/6.
//  Copyright © 2017年 Chase Liu. All rights reserved.
//

import XCTest
@testable import Uni_

class UnitTest: XCTestCase {
    
    var nv : NoteViewModel!
    
    
    override func setUp() {
    
        super.setUp()
        nv = NoteViewModel()
    }
    

    
    
    func test_FormNote(){
    
    let description = "This is a new test"
        
       let note =  nv.formNote(content: description)
    
        XCTAssertEqual(note.description, "This is a new test")
    
    
    }
    
    func test_InsertNote(){
    
        let note = Note.init(date: "2017-10-07-Saturday", description: "testNote")
        //let userID = 2
        
    
        
        
       
        
       let result =  nv.addNote(note: note)
        
        
     
        XCTAssertEqual(result, true)
        
        
    
    }
    

    
    override func tearDown() {
        super.tearDown()
    }
    
}
