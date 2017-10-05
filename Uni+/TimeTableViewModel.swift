//
//  TimeTableViewModel.swift
//  Uni+
//
//  Created by Chase on 23/9/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//let infoSecA = CurriculaTableItem(name: "iPhone Enginerring", place: "Building 80", weekday: .monday, startPeriod: 12, endPeriod: 14, textColor: UIColor.white, bgColor: UIColor.gray, identifier: "(2015-2016-2)-21190850", tapHandler: handler)


import Foundation
import CurriculaTable

class TimeTableViewModel{

    static var shared = TimeTableViewModel()
    
    private init(){
        
        
    }
   
    
    var handler = { (curriculum: CurriculaTableItem) in
     
        
    }

    var loadCourses : [TimetableEvent] = []
    var loadCurricular :[CurriculaTableItem] = []


    func loadAllCourses()
    {
        
    let userID = User.shared.id
    self.loadCourses = DbManager.shared.loadCourse(id: userID)
    
        for course in self.loadCourses {
        
        
        let corricular = CurriculaTableItem(name: course.description, place: course.place, weekday: getWeekday(day: course.date), startPeriod:course.startTime, endPeriod: course.endTime , textColor: UIColor.white, bgColor: UIColor.gray, identifier: String(course.id), tapHandler: handler)
            
            loadCurricular.append(corricular)
        
        }
    
    
    
    }

   
    func getWeekday(day: String) -> CurriculaTableWeekday {
        
        
        if day == "Monday" {return CurriculaTableWeekday.monday}
        else if day == "Tuesday" {return CurriculaTableWeekday.tuesday}
        else if day == "Wednesday" {return CurriculaTableWeekday.wednesday}
        else if day == "Thursday" { return CurriculaTableWeekday.thursday}
        else if day == "Friday" {return CurriculaTableWeekday.friday}
        else if day == "Saturday" {return CurriculaTableWeekday.saturday}
        else {return CurriculaTableWeekday.sunday}
        
    
    
    }


}
