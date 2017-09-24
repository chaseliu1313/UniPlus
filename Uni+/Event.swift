//
//  Event.swift
//  Uni+
//
//  Created by Chase on 24/9/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import Foundation



//event type enum
enum objType{
    
    case TimeTable
    case CalendarEvent
    case Notes
    
}

//base protocal for all object type
protocol Event {
    
    
    var date: Date {get set}
    var description : String {get set}
    var type: objType{get}
    
    func setDescription(input: String)
    func setDate(date:Date)
    func getType() -> objType
    func getDate() -> Date
    func getDescription()-> String
    func parseDate() -> String
    
    
}

//decorator for calendar event and timetable item
protocol DateEventDecorator: Event {
    
    
    func setEndDate(endDate: Date)
    func setPeople(people: String)
    func getEndDate()->Date
    func getPeople()-> String
    
}

//notes object
class Note: Event{
    
    var date:Date
    var description: String
    var type: objType = objType.Notes
    
    init(date:Date, description: String) {
        
        self.date = date
        self.description = description
    }
    
    func setDescription(input: String) {
        self.description = input
    }
    
    func setDate(date: Date) {
        self.date = date
        
    }
    
    func getType() -> objType {
        return type
    }
    
    func getDate() -> Date {
        return date
    }
    func getDescription() -> String {
        return description
    }
    func parseDate() -> String {
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy"
        let year = formatter.string(from: self.date)
        formatter.dateFormat = "MMMM"
        let month = formatter.string(from: self.date)
        formatter.dateFormat = "dd"
        let day = formatter.string(from: self.date)
        formatter.dateFormat = "EEEE"
        let weekday = formatter.string(from: self.date)
        
        return year+month+day+weekday
    }
    
    
    
    
}
//clendar event object
class CalendarEvent:DateEventDecorator{
    
    var date:Date
    var description: String
    var type: objType = objType.CalendarEvent
    var endDate:Date
    var people: String = ""
    
    
    init(date:Date,endDate:Date, description: String) {
        
        self.date = date
        self.endDate = endDate
        self.description = description
    }
    
    func setDescription(input: String) {
        self.description = input
    }
    
    func setDate(date: Date) {
        self.date = date
        
    }
    
    func getType() -> objType {
        return type
    }
    
    func getDate() -> Date {
        return date
    }
    func getDescription() -> String {
        return description
    }
    
    func setPeople(people: String) {
        
        self.people = people
        
    }
    func getPeople()-> String{
        return self.people
    }
    
    
    func setEndDate(endDate: Date) {
        
        self.endDate = endDate
    }
    
    func getEndDate()-> Date{
        
        
        return self.endDate
    }
    
    func parseDate() -> String {
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy"
        let year = formatter.string(from: self.date)
        formatter.dateFormat = "MMMM"
        let month = formatter.string(from: self.date)
        formatter.dateFormat = "dd"
        let day = formatter.string(from: self.date)
        formatter.dateFormat = "EEEE"
        let weekday = formatter.string(from: self.date)
        
        return year+month+day+weekday
        
    }
}

//timetable item object
class TimetableEvent:DateEventDecorator{
    
    
    var date:Date
    var description: String
    var type: objType = objType.TimeTable
    var endDate:Date
    var people: String = ""
    
    
    init(date:Date,endDate:Date, description: String) {
        
        self.date = date
        self.endDate = endDate
        self.description = description
    }
    
    func setDescription(input: String) {
        self.description = input
    }
    
    func setDate(date: Date) {
        self.date = date
        
    }
    
    func getType() -> objType {
        return type
    }
    
    func getDate() -> Date {
        return date
    }
    func getDescription() -> String {
        return description
    }
    
    func setPeople(people: String) {
        
        self.people = people
        
    }
    func getPeople()-> String{
        return self.people
    }
    
    
    func setEndDate(endDate: Date) {
        
        self.endDate = endDate
    }
    
    func getEndDate()-> Date{
        
        
        return self.endDate
    }
    
    func parseDate() -> String {
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy"
        let year = formatter.string(from: self.date)
        formatter.dateFormat = "MMMM"
        let month = formatter.string(from: self.date)
        formatter.dateFormat = "dd"
        let day = formatter.string(from: self.date)
        formatter.dateFormat = "EEEE"
        let weekday = formatter.string(from: self.date)
        
        return year+month+day+weekday
        
        
    }}
