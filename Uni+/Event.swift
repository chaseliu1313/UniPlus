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
    
    
    var date: String {get set}
    var description : String {get set}
    var type: objType{get}
    var id: Int{get}
    
    func setDescription(input: String)
    func setDate(date:String)
    func getType() -> objType
    func getDate() -> String
    func getDescription()-> String
    func parseDate(date:Date) -> String
    
    
}

//decorator for calendar event and timetable item
protocol DateEventDecorator: Event {
    
    
    func setEndDate(endDate: String)
    func setPeople(people: String)
    func getEndDate()->String
    func getPeople()-> String
    
}

protocol TimetableDecorator: Event {

    var place: String {get set}
    var startTime: Int  {get set}
    var endTime: Int  {get set}
    

}

//notes object
class Note: Event{
    
    var id: Int
    var date: String
    var description: String
    var type: objType = objType.Notes
    
    init( date:String, description: String) {
        
        self.id = 0
        self.date = date
        self.description = description
    }
    
    init(id: Int, date:String, description: String){
    
        self.id = id
        self.date = date
        self.description = description
    }
    
    func setDescription(input: String) {
        self.description = input
    }
    
    func setDate(date: String) {
        self.date = date
        
    }
    
    func getType() -> objType {
        return type
    }
    
    func getDate() -> String {
        return date
    }
    func getDescription() -> String {
        return description
    }
    func parseDate(date:Date) -> String {
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy"
        let year = formatter.string(from: date)
        formatter.dateFormat = "MMMM"
        let month = formatter.string(from: date)
        formatter.dateFormat = "dd"
        let day = formatter.string(from: date)
        formatter.dateFormat = "EEEE"
        let weekday = formatter.string(from: date)
        
        return year+month+day+weekday
    }
    
    
    
    
}
//clendar event object
class CalendarEvent:DateEventDecorator{
    
    var id: Int
    var date: String
    var description: String
    var type: objType = objType.CalendarEvent
    var endDate:String
    var people: String
    
    
    init(date:String,endDate:String, description: String,people: String) {
        self.id = 0
        self.date = date
        self.endDate = endDate
        self.description = description
        self.people = people
    }
    
    
    init(id: Int, date:String, endDate:String, description: String,people: String) {
        
        self.id = id
        self.date = date
        self.endDate = endDate
        self.description = description
        self.people = people
    }
    
    func setDescription(input: String) {
        self.description = input
    }
    
    func setDate(date: String) {
        self.date = date
        
    }
    
    func getType() -> objType {
        return type
    }
    
    func getDate() -> String {
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
    
    
    func setEndDate(endDate: String) {
        
        self.endDate = endDate
    }
    
    func getEndDate()-> String{
        
        
        return self.endDate
    }
    
    func parseDate(date:Date) -> String {
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy"
        let year = formatter.string(from: date)
        formatter.dateFormat = "MMMM"
        let month = formatter.string(from: date)
        formatter.dateFormat = "dd"
        let day = formatter.string(from: date)
        formatter.dateFormat = "EEEE"
        let weekday = formatter.string(from: date)
    
        return year+month+day+weekday
        
    }
}

//timetable item object
class TimetableEvent:TimetableDecorator{
    
    var id: Int
    var date:String
    var description: String
    var type: objType = objType.TimeTable
    var place:String
    var startTime: Int
    var endTime: Int
    var detail: Event
    
    
    
    init(id: Int, date:String, place: String, startTime: Int, endTime: Int, description:String) {
        
        self.id = id
        self.date = date
        self.place = place
        self.startTime = startTime
        self.endTime = endTime
        self.description = description
        self.detail = Note.init(date: date, description: description)
        
    }
    
    init(date:String, place: String, startTime: Int, endTime: Int, description:String) {
    
        self.id = 0
        self.date = date
        self.place = place
        self.startTime = startTime
        self.endTime = endTime
        self.description = description
        self.detail = Note.init(date: date, description: description)
    
    }
    
    
    init(event: Event, place: String, startTime: Int, endTime: Int) {
        
        self.detail = event
        self.date = event.date
        self.description = event.description
        self.place = place
        self.startTime = startTime
        self.endTime = endTime
        self.id = 0
        
    }
    
    func setDescription(input: String) {
        self.description = input
    }
    
    func setDate(date: String) {
        self.date = date
        
    }
    
    func getType() -> objType {
        return type
    }
    
    func getDate() -> String {
        return date
    }
    func getDescription() -> String {
        return description
    }
    
 
    func parseDate(date:Date) -> String {
        
        let formatter = DateFormatter()
      
        formatter.dateFormat = "EEEE"
        let weekday = formatter.string(from: date)
        
        return  weekday
        
        
    }}



