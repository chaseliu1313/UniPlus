//
//  NetworkingTest.swift
//  Uni+
//
//  Created by Chase on 7/10/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import XCTest
@testable import Uni_
import SwiftyJSON

class NetworkingTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
       
    }
    
    override func tearDown() {
       
        super.tearDown()
    }
    
    func testConnection(){
    
       let url = "-37.7903556,144.944014"
       
        var currentWeather : String?
        
        
       ConnectionManager.getJSON(url: url) { (success, json) in
        
        if success {
            
            let weather : [String: Any] = json["currently"].dictionaryObject!
            
            currentWeather = weather["summary"] as? String
        }
        
        else {
        
            
        }
        
        }
        
        XCTAssertNotNil(currentWeather)
        
        
        
       
    
    }
    
}
