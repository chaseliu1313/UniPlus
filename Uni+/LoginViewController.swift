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
    let db = DbManager()

    
    @IBAction func login(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        
        let reviewController = storyboard.instantiateViewController(withIdentifier: "revealViewController")
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        appDelegate.window?.rootViewController = reviewController
        
        self.performSegue(withIdentifier: "login", sender: self)
        
        
        
    }
    
    override func viewDidLoad() {
        
        
        db.createDB()
        db.createTable()
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
    
    
    
}
