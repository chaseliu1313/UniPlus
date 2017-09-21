//
//  NoteModel.swift
//  Uni+
//
//  Created by Chase on 27/8/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import Foundation


struct NoteModel{
    var notes:[String] = []
    
    
    
    func getString() ->[String]
    {
        
        return notes
        
    }
    
    mutating func getNote(index: Int) -> String
    {
        let note: String = notes[index]
        return note
        
    }
    
    mutating func remove(index: Int)
    {
        notes.remove(at: index)
    }
    
    mutating func insert(line: String, index: Int)
    {
     notes.insert(line, at: index)
        
    }
    
}

    


    





