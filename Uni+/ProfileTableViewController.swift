//
//  ProfileTableViewController.swift
//  Uni+
//
//  Created by Chase on 18/9/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {

    @IBOutlet var ProfileTable: UITableView!
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirm: UITextField!
    @IBOutlet weak var warning: UILabel!
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProfileTable.backgroundView = UIImageView(image: UIImage(named: "SideMenu-1"))
        
        ProfileTable.backgroundView?.contentMode = .scaleAspectFill
        
        UITableViewCell.appearance().backgroundColor = UIColor.clear
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
       self.warning.text = " "
        
        self.userName.placeholder = User.shared.name
        self.email.placeholder = User.shared.email
        
        
        
    }
    
    
    @IBAction func updatePassword(_ sender: UIButton) {
        
        if (password.text?.isEmpty)! || (confirm.text?.isEmpty)! {
        
            self.warning.textColor = UIColor.red
            warning.text = "Plese enter and confirm your password"
        
        }
        else {
            
            let pass1 = password.text!
            let pass2 = confirm.text!
            
            let result2 = ProfileViewModel.shared.verifyPassword(password: pass1, confirm: pass2)
            
            if result2.0 {
                
                if ProfileViewModel.shared.updatePassword(pass: pass1) {
                    
                    self.warning.textColor = UIColor.white
                    self.warning.text = "New info Updated"
                    
                }
                
                
            }
            else {
                self.warning.textColor = UIColor.red
                warning.text = result2.1
            }
        
        }
        
    }
    

    @IBAction func update(_ sender: UIButton) {
        
        var newUserName = ""
        var newEmail = ""
        
        
        if (userName.text?.isEmpty)! && (email.text?.isEmpty)!  {
            
        self.warning.textColor = UIColor.red
        warning.text = "At least give me something?"
        
        }
        
        else {
            
                
                
            if userName.text! == "" {
            
             newUserName = User.shared.name
            }
            else {
            
             newUserName = userName.text!
            }
            
            if email.text! == "" {
            
             newUserName = User.shared.email
                
            }
            else {
              newEmail = email.text!
            }
             
                let result1 =  ProfileViewModel.shared.verifiy(email: newEmail, name: newUserName)
                
                if result1.0 {
                    
                    if ProfileViewModel.shared.update(Newemail: newEmail, Newname: newUserName){
                        self.warning.textColor = UIColor.white
                    self.warning.text = "New info Updated"
                    }
                    else {
                    self.warning.text = "Update Failed"
                    }
                
                
                }
                else {
                self.warning.textColor = UIColor.red
                self.warning.text = result1.1
                }
        
        
        }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func `return`(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
