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
//    var noteCache: [String] = []
  
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
        note.date = SystemManager.getCurrentDate()
        
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
    
    
    func formNote(content: String) -> Note {
    
    
        
        let date = SystemManager.getCurrentDate()
        let note = Note.init(date: date, description: content)
    
    return note
    }




}
