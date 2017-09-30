//
//  LoginRegViewModel.swift
//  Uni+
//
//  Created by Chase on 30/9/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import Foundation

class LoginViewModel{
    
    
     // login fields verification funcs
    func verifiy(email: String?, password: String?)-> (Bool, [String]) {
    
    
        if email == "" || password == ""{
        
            return(false, ["Don't be lazy, fill them all in!"])
        
        }
    
        else {
            if password!.characters.count < 6 {
            
            return(false, ["Password seems too short, Pal!"])
            
            }
            
            else if (self.validateEmail(email: email!)) == false{
            
            return(false, ["Are you sure that's your email?"])
            }
            else {return (true,[""])}
        
        }
    
    
    }
    
    //emial verification
    func validateEmail(email: String) -> Bool{
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
        
    }
    
    func login(email: String?, password: String?) -> (Bool, User){
        
        guard let userEmail = email, let pass = password
        
    else{
        return (false, User.shared)
        
        }
        
       guard let userID = DbManager.shared.matchUser(email: userEmail, password: pass)
        
        else{
            
            return (false, User.shared)
        }
        
        User.shared.id  = userID
        User.shared.email = userEmail
        
        return(true, User.shared)
    
        
    }
    



}


class RegiViewModel{








}
