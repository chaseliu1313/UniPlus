//
//  StatusManager.swift
//  Uni+
//
//  Created by Chase on 17/9/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import Foundation

struct StatusManager {


    static func setLogin () {
        
        
        
        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        UserDefaults.standard.synchronize()
        
         
        
    
    
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

struct SystemManager{


    static func getCurrentDate() -> String {
        
        let formatter = DateFormatter()
        let date = Date()
        
        formatter.dateFormat = "yyyy"
        let year = formatter.string(from: date)
        formatter.dateFormat = "MM"
        let month = formatter.string(from: date)
        formatter.dateFormat = "dd"
        let day = formatter.string(from: date)
        formatter.dateFormat = "EEEE"
        let weekday = formatter.string(from: date)
        
        let currentDate = "\(year)-\(month)-\(day)-\(weekday)"
        
        return currentDate
        
    }








}
