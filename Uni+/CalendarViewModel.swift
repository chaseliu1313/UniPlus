//
//  CalendarViewModel.swift
//  Uni+
//
//  Created by Chase on 23/9/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import Foundation

class CalendarViewModel{

    var loadCalendarEvents: [CalendarEvent] = []



    
    func loadCalendar(date: String){
    
    
        let userID = User.shared.id
        
        self.loadCalendarEvents = DbManager.shared.loadCalEvents(id: userID, InputDate: date)
    
    
    }
    
    
    
    func addCalendar(cal: CalendarEvent) -> Bool
    
    {
        let date = cal.date
    
       if DbManager.shared.addCalEvent(cal: cal)
       {
        self.loadCalendar(date: date)
        return true
        
        }
        
       else{
        return false
        
        }
    
    
    }
    
    
    func deleteCalendar(cal: CalendarEvent) -> Bool {
       
        let id = cal.id
        let date = cal.date
    
        if DbManager.shared.deleteCal(id: id) {
            
        self.loadCalendar(date: date)
        return true
        }
        
        else{
        
            return false
        
        }
        
    
    }

    
    
    func getSummary (content: String) -> String{
        
        var summary: String
        
        
        if content.characters.count <= 30 {
            
            summary = content
            return summary
        }
            
        else {
            
            if content.contains("."){
                
                summary = content.components(separatedBy: ".").first!
                
            }
            else {
                
                let index = content.index(content.startIndex, offsetBy: content.characters.count/2 )
                summary = content.substring(to: index) + "..."
                
                
            }
            
            return summary
        }
        
    }
    
    //instantiate a calendar event object 
    
    func formCal(date: String, people: String, description: String) -> CalendarEvent
    {
        let endDate = date
        let cal: CalendarEvent = CalendarEvent.init(date: date, endDate: endDate, description: description, people: people)
        
    
        return cal
    }
    

}
