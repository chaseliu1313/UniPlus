//
//  addClendarEventViewController.swift
//  Uni+
//
//  Created by Chase on 2/10/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import UIKit

class addClendarEventViewController:
UIViewController {
    
    let calVM = CalendarViewModel.shared
    
    @IBOutlet weak var people: UITextField!

    @IBOutlet weak var reminder: UITextView!
    
    var date = ""

    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.reminder.layer.cornerRadius = 5
        
       
        
    }


    
    @IBAction func save(_ sender: UIButton) {
        
        
        if reminder.text.isEmpty {
         self.notifyUser(["Please give me something to remind you"])
        }
        
        
        if people.text == "" {
            
            people.text = User.shared.name
            
        }
        
        
        let cal = calVM.formCal(date: date, people: people.text!, description: reminder.text!)
        
        if calVM.addCalendar(cal: cal){
            
           self.notifyUser(["New Calendar Event Saved"])
        }
            
        else {
            return
        }
    }
    
    //customized alert view function
    func notifyUser( _ message: [String] ) -> Void
    {
        let meg: String = "\(message[0])"
        let alert = UIAlertController(title: "Uni+", message: meg, preferredStyle: UIAlertControllerStyle.alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
        
    }
    
    

}
