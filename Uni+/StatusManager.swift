//
//  StatusManager.swift
//  Uni+
//
//  Created by Chase on 17/9/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import Foundation

struct StatusManager {

 

    static func setLogin () -> Bool{
        
        
        
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        UserDefaults.standard.synchronize()
        
        let isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
        return isLoggedIn
    
    
    }
    
    
    static func setLogout () {
        
        
        
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        UserDefaults.standard.synchronize()
        
        
        
        
    }
    
    static func setNewUser(){
    
        UserDefaults.standard.set(true, forKey: "isNewUser")
        UserDefaults.standard.synchronize()
       
        
        
    
    }
    
    static func notNew(){
    
        UserDefaults.standard.set(false, forKey: "isNewUser")
        UserDefaults.standard.synchronize()
        
    }
    
    static func isNewUser() -> Bool{
        
       let isNewUser = UserDefaults.standard.bool(forKey: "isNewUser")
       
        
        return isNewUser
    }
    
    

}
