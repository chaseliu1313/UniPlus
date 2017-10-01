//
//  NotesViewModel.swift
//  Uni+
//
//  Created by Chase on 23/9/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import Foundation

class NoteViewModel{
    
    
    var loadedNote :[Note] = []
  
    var note1 = Note.init(date: "2017-09-29", description: "firstNote")
    var note2 = Note.init(date: "2017009-09", description: "secondNote")
    
    let userID = User.shared.id
    
    
    func loadNotes()
    {
    
   self.loadedNote =  DbManager.shared.loadNote(id: self.userID)
    
    }
    
    
    func addNote(note: Note) -> Bool
    
    {
        let id = User.shared.id
        
        if DbManager.shared.addNote(note: note, id: id) {
        self.loadNotes()
            
            return true
        
        }
        
        else {
            return false
        
        }
    
    
    }
    
    
    func edit(note: Note) -> Bool {
    
        let id = note.id
        let description = note.description
        note.date = self.getCurrentDate()
        
        if DbManager.shared.updateNote(id: id, description: description){
        self.loadNotes()
            return true
        }
        
        else{
            return false
        
        }
    
    }
    
    
    func delete(note: Note) -> Bool {
    
        let id = note.id
        
        if DbManager.shared.deleteNote(id: id) {
            self.loadNotes()
            return true
        }
        
        else {
            self.loadNotes()
            return true
        }
    
    
    }
    
    //get the first sentense or the fisrt 30 chars as title.
    
    func getTitle(content: String) -> String{
        
        var title: String
        
        if content.contains("."){
        
        title = content.components(separatedBy: ".").first!
        
        }
        else {
        let index = content.index(content.startIndex, offsetBy: 30)
        title = content.substring(to: index)
        
        
        }
        
        return title
    
    
    }
    
    
    func getCurrentDate() -> String {
    
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
    
    func formNote(content: String) -> Note {
    
    
        
        let date = self.getCurrentDate()
        let note = Note.init(date: date, description: content)
    
    return note
    }




}
