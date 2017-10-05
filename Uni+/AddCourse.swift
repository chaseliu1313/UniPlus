//
//  AddCourse.swift
//  Uni+
//
//  Created by Geng Xu on 2017/10/6.
//  Copyright © 2017年 Chase Liu. All rights reserved.
//

import UIKit

class AddCourse: UIViewController {

    
    @IBOutlet weak var people: UITextField!
    
    @IBOutlet weak var date: UITextField!
    
    @IBOutlet weak var endDate: UITextField!
    @IBOutlet weak var detail: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func save(_ sender: Any) {
        if detail.text.isEmpty {
            self.notifyUser(["Please give me something to remind you"])
        }
        
        

    }

    
    func notifyUser( _ message: [String] ) -> Void
    {
        let meg: String = message[0]
        let alert = UIAlertController(title: "Uni+", message: meg, preferredStyle: UIAlertControllerStyle.alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
        
    }    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
