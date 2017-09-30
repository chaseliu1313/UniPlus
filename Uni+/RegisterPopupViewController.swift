//
//  RegisterPopupViewController.swift
//  Uni+
//
//  Created by Chase on 30/9/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import UIKit


class RegisterPopupViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirm: UITextField!
    @IBOutlet weak var notification: UILabel!
    
    let regi = RegiViewModel()
    
    @IBOutlet weak var popupView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        popupView.layer.cornerRadius = 15
        popupView.layer.masksToBounds = true
        name.delegate = self
        email.delegate = self
        password.delegate = self
        confirm.delegate  = self
        
    }

    @IBAction func close(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
 
    @IBAction func register(_ sender: UIButton) {
        
        let name = self.name.text
        let email = self.email.text
        let password = self.password.text
        let confirm = self.confirm.text
        
        let verify = self.regi.verifyRege(name: name, email: email, password: password, confirm: confirm)
        
        if  verify.0 {
            
            let result = self.regi.register(email: email, name: name, password: password)
            self.notification.text = " "
            
            if result.0 {
                
                self.notification.textColor = UIColor.white
                self.notification.text = "You Are All Set, Logging in now"
                
                let when = DispatchTime.now() + 5
                DispatchQueue.main.asyncAfter(deadline: when) {
                    
                    self.performSegue(withIdentifier: "RegiLogin", sender: self)
                   
                }
            
            }
            else {
                self.notification.textColor = UIColor.red
                self.notification.text = "Registration Failed, Please Try Again"
            
            }
            
            
            
           
            
        }
        else {
        
        self.notification.textColor = UIColor.red
        self.notification.text = verify.1[0]
            
        }
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        name.resignFirstResponder()
        email.resignFirstResponder()
        password.resignFirstResponder()
        confirm.resignFirstResponder()
        
        
        
        
        
    }
    
    
}
