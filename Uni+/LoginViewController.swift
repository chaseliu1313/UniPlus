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
    
    let login = LoginViewModel()

    
    @IBAction func login(_ sender: Any) {
        
          self.performSegue(withIdentifier: "autologin", sender: self)
        
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
                
                login.saveLogin(email: email!, password: password!)
                 self.performSegue(withIdentifier: "login", sender: self)
               
                
//                 instantiate side menu
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let reviewController = storyboard.instantiateViewController(withIdentifier: "revealViewController")
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = reviewController
                
            
            }
            else {
            
            self.notifyUser(["Please check your email or password, and try again!"])
                
            }
            
            
           
        
        }
        
        
        
        
        
    }
    
    override func viewDidLoad() {
       
        
        
        DbManager.shared.createTable()
        
       
    
        let autoLogin = UserDefaults.standard.bool(forKey: "isLoggedIn")
        if autoLogin && login.autoLogin() {
            
            
            
        
        self.performSegue(withIdentifier: "autologin", sender: self)
            print(User.shared.id)
            print(User.shared.email)
            
        }
       
        
        super.viewDidLoad()
        textField.delegate = self
        textField2.delegate = self
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
       
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.resignFirstResponder()
        textField2.resignFirstResponder()
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
