//
//  MyDayViewModel.swift
//  Uni+
//
//  Created by Chase on 23/9/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import Foundation


class WeatherModelViewItem {
    
    
    var tempArray = ["F","C"]
    var campusArray = ["City Campus", "Bundoora Campus", "Brunswick Campus"]
    
    static let shared = WeatherModelViewItem()
    
    private init(){
        self.updateWeather()
    }

    
    let weatherModel = Weather()
    
    var isCel = true
    
   
    
    var date: String = ""
    var icon: UIImage = UIImage()
    var temp: String = ""
    var weatherDes: String = ""
    var campus: String = ""
    
    
    

    //load static value from model and retrieve instant value from weather api
    
    func updateWeather(){
        
        self.campus = MydayModel.shared.campus
        self.isCel = MydayModel.shared.isCel
        
       let u = MydayModel.shared.getCoordinates()
        
        self.date = MydayModel.shared.getCurrentTime()
        
        
    ConnectionManager.getJSON(url: u) { (success, json) in
        
        
        if(success){
            
            let weather : [String: Any] = json["currently"].dictionaryObject!
            
           self.weatherDes = weather["summary"] as! String
            self.icon = self.weatherModel.getIcon(weather: self.weatherDes)
            let temper = weather["apparentTemperature"] as! Double
            
            
            if self.isCel {
            
            self.temp = String(Int(MydayModel.shared.getCelsius(fara: temper))) + "  °C"
            }
            else {
            
                self.temp = String(temper) + "  °F"
            
            }
            
            
        }
        else{
            print("error")
            
            
        }
        
        
        }
        
        }
    
   
    
    
    }


class TimetableFirstPageViewModel {

    
    static let shared = TimetableFirstPageViewModel()
    
    private init(){
        
        self.getCoursesOnDate()
        self.setCellData()
        print(courses.count)
    }
    
    var courses:[TimetableEvent]  = []
    var name1 = ""
    var time1 = ""
    var name2 = ""
    var time2 = ""
    
    func getCoursesOnDate(){
        
        let date = self.parseDate()
        let userID = User.shared.id

        self.courses = DbManager.shared.getCourseOn(date: date, userID: userID)
    
    
    
    }
    
    func setCellData(){
    
        let date = self.parseDate()

        if self.courses.count == 0 {
            
            
            if date == "Sunday" || date == "Saturday"{
                
                self.name1 = "     Have a good weekend!"
                
                
            }
            
            else {
                
              self.name1 = "     YEAH! You don't have any classes today"
            
            }
        
      
            
            
            
        
        }
        else {
            
            if self.courses.count == 1 && self.courses.count < 2 {
            
                self.name1 = "     \(courses[0].description) at \(courses[0].place)"
                self.time1 = "     On \(courses[0].date) From: \(courses[0].startTime) To: \(courses[0].endTime) "
            
            
            }
            else {
            
                self.name1 = "     \(courses[0].description) at \(courses[0].place)"
                self.time1 = "     On \(courses[0].date) From: \(courses[0].startTime) To: \(courses[0].endTime) \n"
                
                self.name2 = "     \(courses[1].description) at \(courses[1].place)"
                self.time2 = "     On \(courses[1].date) From: \(courses[1].startTime) To: \(courses[1].endTime) "
            
            }
            
        
        
        
        }
    
    
    
    }
    
    func parseDate() -> String {
        
        
        let date = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "EEEE"
        let weekday = formatter.string(from: date)
        
        return  weekday
        
        
    }
    
}


    


class NoteFirstPageViewModel {

    
    static let shared = NoteFirstPageViewModel()
    var notes: [Note] = []
    
    
    private init(){
        
        loadNotes()
        setData()
    }
    
    var name1 = ""
    var time1 = ""
    var name2 = ""
    var time2 = ""
    
    
    let userID = User.shared.id
    
    
    func loadNotes()
    {
        
        let load =  DbManager.shared.loadNote(id: self.userID)
        //let load = NoteViewModel().loadedNote
        
        if load.count <= 2 {
        
            self.notes = load
        
        }
        
        else {
        
            //get the last 2 items (the lastest ones)
            self.notes = Array(load.suffix(from: load.count-2))
        }
        print(self.notes.count)
        
    }
    
    func setData(){
    
    
        if self.notes.count == 0 {
        
            self.name1 = "     You don't have any notes, Go create one!"
        
        
        }
        
        else {
        
            if self.notes.count < 2{
            
            name1 = "     \(notes[0].date)"
            time1 = "     \(self.getTitle(content: notes[0].description))"
                
                
            }
            else {
                name1 = "     \(notes[0].date)"
                time1 = "     \(self.getTitle(content: notes[0].description)) \n"
                
                name1 = "     \(notes[1].date)"
                time1 = "     \(self.getTitle(content: notes[1].description))"
                
            
            
            }
        
        
        }
    
    
    }
    
    
    //get the first sentense or the fisrt 30 chars as title.
    
    func getTitle(content: String) -> String{
        
        var title: String
       
        
        if content.characters.count <= 10 {
            return content
        }
            
        else {
            
            if content.contains("."){
                
                title = content.components(separatedBy: ".").first!
                
            }
            else {
                let index = content.index(content.startIndex, offsetBy: content.characters.count/2 )
                title = content.substring(to: index)
                
                
            }
            
            return title
        }
        
    }
    

}

class CalendarFirstPageViewModel {
    
    
    static let shared = CalendarFirstPageViewModel()
    
    
    
    private init(){
        
        loadCal()
        setData()
    }
    
    var name1 = ""
    var time1 = ""
    var name2 = ""
    var time2 = ""
    
    var loadCalendarEvents: [CalendarEvent] = []
    
    func loadCal(){
        
        let date = self.parseDate()
        print(date)
        let userID = User.shared.id

        self.loadCalendarEvents =  DbManager.shared.loadCalEvents(id: userID, InputDate: date)
   
        print("calenders: \(self.loadCalendarEvents.count)")
        
    }
    
    func setData(){
        
        if loadCalendarEvents.count == 0 {
            
            name1 = "     You don't have anything on your calendar"
            
        }
        else {
            
            if loadCalendarEvents.count == 1 && loadCalendarEvents.count < 2 {
                
                name1 = "     \(loadCalendarEvents[0].date)"
                time1 = "     \(loadCalendarEvents[0].description)"
                
            }
                
            else {
                
                
                name1 = "     \(loadCalendarEvents[0].date)"
                time1 = "     \(loadCalendarEvents[0].description) \n"
                name2 = "     \(loadCalendarEvents[1].date)"
                time2 = "     \(loadCalendarEvents[1].description)"
                
                
                
                
            }
            
        }
        
        
    }
    
    
    func parseDate() -> String {
        
        let date = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy"
        let year = formatter.string(from: date)
        formatter.dateFormat = "MM"
        let month = formatter.string(from: date)
        formatter.dateFormat = "dd"
        let day = formatter.string(from: date)
        formatter.dateFormat = "EEEE"
        let weekday = formatter.string(from: date)
        
        return "\(year)-\(month)-\(day)-\(weekday)"
        
    }
}


