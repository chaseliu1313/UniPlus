//
//  StatusManager.swift
//  Uni+
//
//  Created by Chase on 17/9/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import Foundation

struct StatusManager {


    static var isLoggedIn: Bool = false
    
    

    static func setLogin () -> Bool{
        
        
        
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        UserDefaults.standard.synchronize()
        
        self.isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
        return isLoggedIn
    
    
    }
    
    
    static func setLogout () {
        
        
        
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        UserDefaults.standard.synchronize()
        
        self.isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
        
        
        
    }
    
    

}
