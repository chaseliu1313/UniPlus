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
    let user_id = Expression<Int>("userID")
    let date = Expression<String>("date")
    let endDate = Expression<String>("endDate")
    let people = Expression<String>("people")
    let description = Expression<String>("description")
    
    //timetable Event Table
    let timeTTable = Table("timetable")
    
    let TTID = Expression<Int>("TTID")
    let user_id2 = Expression<Int>("userID")
    let TTdate = Expression<String>("date")
    let TTendDate = Expression<String>("endDate")
    let TTpeople = Expression<String>("people")
    let TTdescription = Expression<String>("description")
    
    //notesTable
    let noteTable = Table("calendar")
    
    let noteID = Expression<Int>("calID")
    let Nuser_id = Expression<Int>("userID")
    let Ndate = Expression<String>("date")
    let Ndescription = Expression<String>("description")
    
    
    init() {
        self.createDB()
        self.createTable()
    }
    
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
            table.column(self.TTendDate)
            table.column(self.TTpeople)
            table.column(self.TTdescription)
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
            try self.database.run(createTable2)
            try self.database.run(createTable3)
            try self.database.run(createTable4)
            print("create successful")
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
            print("inserted \(name) and \(email)")
            return true
            
        }
        catch{
            print(error)
            return false
            
        }
        
        
    }
    
    
    func matchUser(email: String, password: String) -> Int? {
        var userID : Int?
        
        let find = self.usersTable.select(id).filter(self.email == email).filter(self.password == password)
        
        do{
            
            for user in try self.database.prepare(find){
                
                userID = user[id]
                
                
            }
            
            
        }
        catch{
            
        }
        
        return userID
        
    }
    
    
    
    //calendar table functions
    func insertInfoCal(userID: Int, date: String, endDate: String, person: String, description: String ){
        
        
        let insert = self.calendarTable.insert(self.user_id <- userID, self.date <- date, self.endDate <- endDate, self.people <- person, self.description <- description)
        
        do {
            try self.database.run(insert)
            print("inserted \(userID) and \(date) and \(endDate) and \(endDate) and \(person) and \(description)")
        }
            
        catch {
            print(error)
            
            
        }
        
        
    }
    
    
    
    
    
    func showInfo(){
        
        do {
            let users = try self.database.prepare(self.usersTable)
            
            for user in users {
                
                print("userID : \(user[self.id]), name: \(user[self.name]), email: \(user[self.email])")
            }
            print(users)
        }
        catch {
            
            print(error)
        }
        
        
    }
    
    func update(){
        
        let userID = 1
        let name = "Jane"
        let email = "DOE@123.com"
        
        let user = self.usersTable.filter(self.id == userID)
        let update = user.update(self.name <- name, self.email <- email)
        
        
        do {
            try self.database.run(update)
        }
        catch{
            print(error)}
        
    }
    
    func delete(){
        
        let userID = 1
        let user = self.usersTable.filter(self.id == userID)
        let delete = user.delete()
        do{
            try self.database.run(delete)
        }
        catch{
            print(error)
        }
    }
    
    func drop(){
        
        
        do{
            try  self.database.run(self.usersTable.drop())}
            
        catch
        {
            print(error)
        }
        print("userTable has droped")
        
    }
    
    
    
    
    //note table functions
    
    func addNote(note: Note, id: Int){
    
    let userID = id
    let date = note.date
    let description = note.description
        
    let insert = self.noteTable.insert(self.Nuser_id <- userID, self.Ndate <- date, self.Ndescription <- description)
    
        do{
            try self.database.run(insert)
            print("inserted Note for \(userID)")
            
        }
        catch{
        
            print(error)
        }
    
    }
    
    func loadNote() -> [Note]{
    
        var notes: [Note] = []
        
        do{
        
            for note in try self.database.prepare(noteTable){
            
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
    
    
}
