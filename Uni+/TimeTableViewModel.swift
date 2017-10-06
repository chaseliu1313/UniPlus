//
//  TimeTableViewModel.swift
//  Uni+
//
//  Created by Chase on 23/9/17.
//  Copyright © 2017 Chase Liu. All rights reserved.



import Foundation
import CurriculaTable

class TimeTableViewModel{

    static var shared = TimeTableViewModel()
    
    private init(){
        
        
    }
   
    let weekdays = ["Monday", "Tuesday" ,"Wednesday", "Thursday", "Friday","Saturday","Sunday"]
    
    let startTime = ["6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22"]
    
    let endTime = ["6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22"]
    
    
    var handler = { (curriculum: CurriculaTableItem) in
     
     
    }

    var loadCourses : [TimetableEvent] = []
    


    func loadAllCourses()
    {
        
    let userID = User.shared.id
    self.loadCourses = DbManager.shared.loadCourse(id: userID)
    
       
    
    }
    
    
    func addCouse(couse: TimetableEvent) -> Bool{
    
    let userID = User.shared.id
        if DbManager.shared.addCourse(course: couse, id: userID) {
            
            self.loadAllCourses()
            return true
        
        
        }
        else {
        
            
            return false
        
        }
    
    }
    
    func deleteCouse(couseID: Int) -> Bool {
    
    
        if DbManager.shared.deleteCourse(courseID: couseID) {
        
        self.loadAllCourses()
            return true
        }
        else {
        return false
        }
    
    
    }
    
    func getCourse(id: Int) -> TimetableEvent? {
    
        var findCourse: TimetableEvent?
    
    
    
       if let course =  DbManager.shared.getCourse(id: id)
       {
        
        findCourse = course
        
        }
       else {
        
        print("retrive course failed")
        }
    
    return findCourse
    
    }
    
    
    func formCourse(date:String, place: String, startTime: Int, endTime: Int, description:String) -> TimetableEvent{
        
       
        let newCourse = TimetableEvent.init(date: date, place: place, startTime: startTime, endTime: endTime, description: description)
        
        return newCourse
    
    
    
    
    }

   
   
    
    //return the object type that is required in the CurriculaTable
    func getWeekday(day: String) -> CurriculaTableWeekday {
        
        
        if day == "Monday" {return CurriculaTableWeekday.monday}
        else if day == "Tuesday" {return CurriculaTableWeekday.tuesday}
        else if day == "Wednesday" {return CurriculaTableWeekday.wednesday}
        else if day == "Thursday" { return CurriculaTableWeekday.thursday}
        else if day == "Friday" {return CurriculaTableWeekday.friday}
        else if day == "Saturday" {return CurriculaTableWeekday.saturday}
        else {return CurriculaTableWeekday.sunday}
        
    
    
    }
    
    
    
    
    
    //return random couse background color
    func getColor()-> UIColor
        
    {
        let colors :[Int: UIColor]  = [1: UIColor.black, 2: UIColor.blue, 3: UIColor.brown, 4: UIColor.cyan, 5:UIColor.darkGray, 6:UIColor.green, 7:UIColor.red, 8:UIColor.yellow, 9: UIColor.purple, 10: UIColor.orange]
        
        let random: Int = Int(arc4random_uniform(10)+1)
        
        let color: UIColor = colors[random]!
        
        return color
        
        
    }



}


