//
//  ProfileViewModel.swift
//  Uni+
//
//  Created by Chase on 23/9/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import Foundation

class ProfileViewModel {
    
    static let shared = ProfileViewModel()
    
    private init (){
        
    }
    
    
    
    func update(Newemail: String, Newname: String) -> Bool
    {
    
        let userID = User.shared.id
        
       if DbManager.shared.updateUser(Newemail: Newemail, Newname: Newname, userID: userID)
       {
        
        return true
        }
        
        
       else {
        
        return false
        
        }
    
    
    
    }
    
    func updatePassword(pass: String) -> Bool {
        
        let userID = User.shared.id
    
        if DbManager.shared.updateUserPassword(Newpassword: pass, userID: userID) {
        return true
        
        }
        else {
        return false
        }
    
    }
    
    
    // login fields verification funcs
    func verifiy(email: String, name: String )-> (Bool, String) {
        
        
        
            if !validateUserName(name: name) {
                
                return(false, "No special chars in your name please")
                
            }
                
            else if (self.validateEmail(email: email)) == false{
                
                return(false, "Are you sure that's your email?")
            }
            else {return (true,"")}
            
        
        
        
    }
    
    func verifyPassword(password: String, confirm: String) -> (Bool, String ){
    
        
        if password.characters.count < 6 {
        
        return(false, "Password seems too short, Pal!")
        
        
        
        }
        else if password != confirm {
            
            return(false, "Your 2 passwords don't match")
            
        
        }
        else {
        return (true,"")
        }
    
    }
    
    
    func validateUserName(name: String) -> Bool{
        
        let RegEx = "^[0-9a-zA-Z\\_]{3,18}$"
        
        return NSPredicate(format: "SELF MATCHES %@", RegEx).evaluate(with: name)
        
    }

    
    //emial verification
    func validateEmail(email: String) -> Bool{
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
        
    }
    
}
