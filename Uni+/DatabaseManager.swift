//
//  DatabaseManager.swift
//  Uni+
//
//  Created by Chase on 29/9/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//


import Foundation
import SQLite

 class DbManager{
    
   
   static let shared = DbManager()
    
    private init() {
        self.createDB()
        
    }
    
    //let user: User?
    var database : Connection!
    
    //userTable - parent table
    let usersTable = Table("user")
    
    let id = Expression<Int>("id")
    let name = Expression<String>("name")
    let email = Expression<String>("email")
    let password = Expression<String>("password")
    
    //clendarEventTable
    let calendarTable = Table("calendar")
    
    let calID = Expression<Int>("calID")
    let user_id = Expression<Int>("caluserID")
    let date = Expression<String>("date")
    let endDate = Expression<String>("endDate")
    let people = Expression<String>("people")
    let description = Expression<String>("description")
    
    //timetable Event Table
    let timeTTable = Table("timetable")
    
    let TTID = Expression<Int>("TTID")
    let user_id2 = Expression<Int>("userID2")
    let TTdate = Expression<String>("TTdate")
    let startTime = Expression<Int>("TTstartTime")
    let endTime = Expression<Int>("TTendTime")
    let place = Expression<String>("TTplace")
    let TTDescription = Expression<String>("TTDescription")
    
    //notesTable
    let noteTable = Table("notes")
    
    let noteID = Expression<Int>("noteID")
    let Nuser_id = Expression<Int>("NuserID")
    let Ndate = Expression<String>("noteDate")
    let Ndescription = Expression<String>("Ndescription")
    
    
   
    
    //create local storage
    func createDB() {
        
        
        
        do {
            
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileURL = documentDirectory.appendingPathComponent("users").appendingPathExtension("sqlite3")
            let database = try Connection(fileURL.path)
            self.database = database
            
        }
        catch {
            print(error)
        }
    }
    
    //create 4 tables
    
    func createTable(){
        
        let createTable = self.usersTable.create { (table) in
            
            table.column(self.id, primaryKey: .autoincrement)
            table.column(self.name)
            table.column(self.email, unique: true)
            table.column(self.password)
            
            
            
            
        }
        
        let createTable2 = self.calendarTable.create{(table) in
            
            table.column(self.calID, primaryKey: .autoincrement)
            table.column(self.user_id)
            table.column(self.date)
            table.column(self.endDate)
            table.column(self.people)
            table.column(self.description)
            table.foreignKey(self.user_id, references: usersTable, id, delete: nil)
            
            
            
            
        }
        
        let createTable3 = self.timeTTable.create{(table) in
        
            table.column(self.TTID, primaryKey: .autoincrement)
            table.column(self.user_id2)
            table.column(self.TTdate)
            table.column(self.startTime)
            table.column(self.endTime)
            table.column(self.place)
            table.column(self.TTDescription)
            table.foreignKey(self.user_id2, references: usersTable, id, delete: nil)
            
            
        
        }
        
        let createTable4 = self.noteTable.create{(table) in
            
            table.column(self.noteID, primaryKey: .autoincrement)
            table.column(self.Nuser_id)
            table.column(self.Ndate)
            table.column(self.Ndescription)
            table.foreignKey(self.Nuser_id, references: usersTable, id, delete: nil)
            
        
        }
        
        
        do {
            try self.database.run(createTable)
            
            
            
            print("create successful")
        }
        catch{
            
            print(error)
            
            
        }
        
        do {
            try self.database.run(createTable2)
          print("table2")
        }
        catch{
            print(error)
        
        }
        
        do{
        try self.database.run(createTable3)
            print("table3")
        }
        catch{
            print(error)
        
        }
        
        do{
        try self.database.run(createTable4)
            print("table4")
        }
        
        catch{
            print(error)
        }
        
        
    }
    
   
    //usertable functions
    
    func inserInfoUser(name: String, email: String, password: String) -> Bool{
        
        let insert = self.usersTable.insert(self.name <- name, self.email <- email, self.password <- password)
        
        
        do{
            try self.database.run(insert)
          
            
            return true
            
        }
        catch{
            print(error)
            return false
            
        }
        
        
    }
    
    
    func matchUser(email: String, password: String) -> Int? {
        var userID : Int?
        
        let find = self.usersTable.filter(self.email == email).filter(self.password == password)
        
        do{
            
            for user in try self.database.prepare(find){
                
                userID = user[id]
                User.shared.id = user[id]
                User.shared.name = user[name]
                
                
            }
            
            
        }
        catch{
            
        }
        
        return userID
        
    }
    
    func updateUser(Newemail: String, Newname: String,  userID: Int) -> Bool {
    
        
        let filter = self.usersTable.filter(self.id == userID)
        
        do
        {
        try self.database.run(filter.update(email <- Newemail, name <- Newname))
        
            return true
            
            
        }
        catch
        {
        print(error)
            return false
        }
    
    
    }
    
    func updateUserPassword(Newpassword: String, userID: Int) -> Bool {
        
        
        let filter = self.usersTable.filter(self.id == userID)
        
        do
        {
            try self.database.run(filter.update(password <- Newpassword))
            
            return true
            
            
        }
        catch
        {
            print(error)
            return false
        }
        
        
    }
    
    
    
    
    //calendar table functions
    func insertInfoCal(userID: Int, date: String, endDate: String, person: String, description: String ) -> Bool{
        
        
        let insert = self.calendarTable.insert(self.user_id <- userID, self.date <- date, self.endDate <- endDate, self.people <- person, self.description <- description)
        
        do {
            try self.database.run(insert)
            print("inserted \(userID) and \(date) and \(endDate) and \(person) and \(description)")
            return true
        }
            
        catch {
            
            print(error)
            
            return false
        }
        
        
    }
    
    func addCalEvent(cal: CalendarEvent) -> Bool {
    
    let userID = User.shared.id
    let date = cal.date
    let endDate = cal.endDate
    let person = cal.people
    let des = cal.description
    
        if self.insertInfoCal(userID: userID, date: date, endDate: endDate, person: person, description: des)
        
        {
        
            return true
        }
    
        else{
            
        return false
            
        }
    
    }
    
    
    func loadCalEvents(id: Int, InputDate: String) -> [CalendarEvent] {
    
        var events : [CalendarEvent] = []
        
        let filter = self.calendarTable.filter(self.user_id == id).filter(self.date == InputDate)
        
        do{
        
            for calevent in try self.database.prepare(filter) {
                
                let sid = calevent[calID]
                let sdate = calevent[date]
                let sendDate = calevent[endDate]
                let speople = calevent[people]
                let sdes = calevent[description]
               
            
                let calEvent = CalendarEvent.init(id: sid, date: sdate, endDate: sendDate, description: sdes, people: speople)
                
           events.append(calEvent)
                
                
            
            }
        }
        catch{
        
            print(error)
        
        }
    return events
    
    }
    
    func loadEvents() {
    
        

        do{
            for calevent in try self.database.prepare(calendarTable){
            
                
                
                
                print(calevent[people])
               
            }
        }
        catch {
        print(error)
        }
        
        
        
    }
    
    
    func deleteCal(id: Int) -> Bool
    {
    let target = calendarTable.filter(calID == id)
        
        do{
        
            try self.database.run(target.delete())
            return true
        
        
        }
        
        catch{
        
        print(error)
         return false
        }
    
    
    }

 //Timetable table function
    
    func addCourse(course: TimetableEvent, id: Int) -> Bool {
    
        let userID = id
        let date = course.date
        let startTime = course.startTime
        let endTime = course.endTime
        let place = course.place
        let description = course.description
        
        let insert = self.timeTTable.insert(self.user_id2 <- userID, self.TTdate <- date, self.startTime <- startTime, self.endTime <- endTime, self.place <- place, self.TTDescription <- description)
        
        do{
        
            try self.database.run(insert)
            print("insered new course \(description)")
        return true
        }
        
        catch{
        print(error)
            return false
        }
    
    }
   
    func getCourse(id: Int) -> TimetableEvent? {
    
        var Newcourse: TimetableEvent?
    
        let filtered = self.timeTTable.filter(TTID == id)
        
        do{
            
            for course in try self.database.prepare(filtered){
                
                 Newcourse = TimetableEvent.init(id: course[TTID], date: course[TTdate], place: course[place], startTime: course[startTime], endTime: course[endTime], description: course[TTDescription])
                
            }
        
        }
        catch {
        
        print(error)
        }
    
    
    return Newcourse
    
    
    }
    
    func getCourseOn(date: String, userID: Int)-> [TimetableEvent] {
    
        var courseOnDate: [TimetableEvent] = []
        
        let filtered = self.timeTTable.filter(user_id2 == userID).filter(self.TTdate == date)
        
        do{
            for course in try self.database.prepare(filtered)
            {
            
                 let Newcourse = TimetableEvent.init(id: course[TTID], date: course[TTdate], place: course[place], startTime: course[startTime], endTime: course[endTime], description: course[TTDescription])
                courseOnDate.append(Newcourse)
                
            
            }
        }
        catch {
        
        print(error)
        }
    
        return courseOnDate
    
    }
    
    
    func loadCourse(id: Int) -> [TimetableEvent] {
    
        var courseList : [TimetableEvent] = []
        let filtered = self.timeTTable.filter(user_id2 == id)
        
        do
        {
            for course in try self.database.prepare(filtered){
            
            let newCourse = TimetableEvent.init(id: course[TTID], date: course[TTdate], place: course[place], startTime: course[startTime], endTime: course[endTime], description: course[TTDescription])
                courseList.append(newCourse)
            }
        }
        
        catch
        {
            print(error)
            
        }
        return courseList
    
    }
    
    func deleteCourse(courseID : Int)-> Bool {
    
        let delete = timeTTable.filter(TTID == courseID)
        
        do {
            
            try self.database.run(delete.delete())
            return true
        }
            
        catch{
            
            print(error)
            return false
        }
    
    }
    
    
    //note table functions
    
    func addNote(note: Note, id: Int) -> Bool{
    
    let userID = id
    let date = note.date
    let description = note.description
        
    let insert = self.noteTable.insert(self.Nuser_id <- userID, self.Ndate <- date, self.Ndescription <- description)
    
        do{
            try self.database.run(insert)
            print("inserted Note for \(userID)")
            return true
            
        }
        catch{
        
            print(error)
            return false
        }
    
    }
    
    func loadNote(id: Int) -> [Note]{
    
        var notes: [Note] = []
        let filtered = self.noteTable.filter(Nuser_id == id)
        
        do{
        
            for note in try self.database.prepare(filtered){
            
                
                let newNote = Note.init(id: note[noteID], date: note[Ndate], description: note[Ndescription])
                notes.append(newNote)
            
            }
        }
        
        catch{
            print(error)
            
        
        }
    
    return notes
        
    
        
    }
    
    func updateNote(id: Int, description: String) -> Bool{
        
        let update = noteTable.filter(noteID == id)
        
        do{
        
            try self.database.run(update.update(Ndescription <- description))
            return true
            
        }
        
        catch{
            print(error)
            return false
        
        }
    
    
    }
    
    func deleteNote(id: Int) -> Bool {
        
        let delete = noteTable.filter(noteID == id)
        
        do {
        
            try self.database.run(delete.delete())
            return true
        }
        
        catch{
        
           print(error)
            return false
        }
        
    
    
    }
    
    //drop table 
    
    
    func drop(){
        
        
        do{
           
            try  self.database.run(self.timeTTable.drop())
            
        
        }
            
        catch
        {
            print(error)
        }
        print("calendar has droped")
        
    }
    
}
