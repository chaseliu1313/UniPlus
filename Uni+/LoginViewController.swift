//
//  LoginController.swift
//  Uni+
//
//  Created by Shuyang Liu on 8/14/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

//universal instance of database manager



import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textField2: UITextField!
    
    @IBOutlet weak var textFields: UIStackView!
    let login = LoginViewModel()

    
    
    @IBAction func login(_ sender: Any) {
        
        
        let email = textField2.text
        let password = textField.text
        
        let verify = self.login.verifiy(email: email, password: password)
        
        if verify.0 == false {
        
            self.notifyUser(verify.1)
        
        }
        
        else {
        
            let result = login.login(email: email, password: password)
            
            
            if result.0{
                
                 StatusManager.setLogin()
                
                 self.performSegue(withIdentifier: "login", sender: self)
               
                
              
            
            }
            else {
            
            self.notifyUser(["Please check your email or password, and try again!"])
                
            }
            
            
           
        
        }
        
        
        
        
        
    }
    
    override func viewDidLoad() {
       
  
        
        DbManager.shared.createTable()
        
        let nfCenter: NotificationCenter = NotificationCenter.default
        nfCenter.addObserver(self, selector: #selector(keyboardDidShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        nfCenter.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    
       
        
        super.viewDidLoad()
        textField.delegate = self
        textField2.delegate = self
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
       
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
          NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
   
    
    //UItextfield and keyboad configuration functions
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.resignFirstResponder()
        textField2.resignFirstResponder()
    }
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        textField2.resignFirstResponder()
        return true
    }
    
    //move the whole frame up above the keyboard
    func keyboardDidShow(notification: NSNotification) {
    
        let notifyInfo: NSDictionary = notification.userInfo! as NSDictionary
        
        let keyboardFrame = (notifyInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        
        let yposistion = self.view.frame.height - keyboardFrame.height
       
        
        let beingEditingY: CGFloat! = self.textFields.frame.origin.y
        
        
        if self.view.frame.origin.y >= 0{
        
        if beingEditingY > yposistion - 100 {
        
        
            UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseIn, animations: {
                self.view.frame = CGRect(x:0, y:self.view.frame.origin.y - (beingEditingY - (yposistion-100)), width: self.view.bounds.width, height: self.view.bounds.height)
            }, completion: nil)
        
        }}

        
    
    }
    //return frame back to original
    func keyboardWillHide(notification: NSNotification) {
        
        UIView.animate(withDuration: 0.1, delay: 0.0, options: .curveEaseIn, animations: { 
            self.view.frame = CGRect(x:0, y:0, width: self.view.bounds.width, height: self.view.bounds.height)
        }, completion: nil)
        
    }
    
    //customized alert view function
    func notifyUser( _ message: [String] ) -> Void
    {
        let meg: String = message[0]
        let alert = UIAlertController(title: "Uni+", message: meg, preferredStyle: UIAlertControllerStyle.alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
        
    }
    
}
