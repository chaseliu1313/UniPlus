//
//  RegistrationUnitTest.swift
//  Uni+
//
//  Created by Chase on 7/10/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import XCTest
@testable import Uni_

class RegistrationUnitTest: XCTestCase {
    
    var regiVM : RegiViewModel!
    
    override func setUp() {
        super.setUp()
        regiVM = RegiViewModel()
        
        
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
   
    func testRegistration(){
    
    let name = "Jerry"
    let email = "Jerry@gamil.com"
    let password = "123456"
    let confirm = "123456"
        
        
       
        
       let result =  regiVM.verifyRege(name: name, email: email, password: password, confirm: confirm)
        
        
        XCTAssertEqual(result.0, true)
        
        let result2 = regiVM.register(email: email, name: name, password: password)
        
        
        
        
        XCTAssertEqual(result2.0, true)
        XCTAssertEqual(result2.1.email, email)
    
    }
}
