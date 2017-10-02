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
    
    let calVM = CalendarViewModel()
    
    @IBOutlet weak var people: UITextField!
    @IBOutlet weak var popup: UIView!
    @IBOutlet weak var reminder: UITextView!
    var date = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.reminder.layer.cornerRadius = 5
        self.popup.layer.cornerRadius = 15
        
        
    }

  
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        
        if people.text == "" {
        
            people.text = User.shared.name
        
        }
        else {
            
            if reminder.text == "" {
            
                reminder.text = " set reminder here "
            
            }
       
        }
        
        let cal = calVM.formCal(date: date, people: people.text!, description: reminder.text!)
    
        if calVM.addCalendar(cal: cal){
        print("added calendar event")
        }
        
        else {
        return
        }
        
    }

}
