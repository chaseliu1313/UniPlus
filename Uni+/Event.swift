//
//  Event.swift
//  Uni+
//
//  Created by Chase on 24/9/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import Foundation

struct currentDate{


   static let date = Date()
   static let cal = Calendar.current
    
    static func getCurrentDate(){
        
        let year = self.cal.component(.year, from: date)
        let month = self.cal.component(.month, from: date)
        let day  = self.cal.component(.day, from:date)
        let weekday = self.cal.component(.weekday, from: date)
        
        

    
    }

}
