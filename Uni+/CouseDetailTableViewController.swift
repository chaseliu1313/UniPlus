//
//  CouseDetailTableViewController.swift
//  Uni+
//
//  Created by Chase on 6/10/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import UIKit

class CouseDetailTableViewController: UITableViewController {
    
    @IBOutlet weak var name: UILabel!

    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var weekdays: UILabel!

    var courseID: Int?
    
    @IBOutlet var courseDetail: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        courseDetail.backgroundView = UIImageView(image: UIImage(named: "blueBackGround"))
        UITableViewCell.appearance().backgroundColor = UIColor.clear
        courseDetail.separatorColor = UIColor.clear
        self.loadCourse()

    }
    
    
    func loadCourse(){
    
        if let course = TimeTableViewModel.shared.getCourse(id: courseID!) {
        
            self.name.text = course.description
            self.location.text = course.place
            self.startTime.text = "\(course.startTime) O'clock"
            self.endTime.text = "\(course.endTime)  O'clock"
            self.weekdays.text = course.date
        
        }
        
        else {
        return
        }
        
        
    
    
    
    
    }
   

    @IBAction func Delete(_ sender: UIButton) {
        
        
        if let id = self.courseID {
        
            if TimeTableViewModel.shared.deleteCouse(couseID: id) {
            self.notifyUser(["Course deleted!"])
            
            }
            else {self.notifyUser(["Deletion faild"])}
        
        }
        
        else {
        
        self.notifyUser(["Invlid Course Info"])
        }
        
        
       
        
        
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
