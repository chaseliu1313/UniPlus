//
//  AddCourseTableViewController.swift
//  Uni+
//
//  Created by Chase on 6/10/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import UIKit

class AddCourseTableViewController: UITableViewController {

    @IBOutlet var addCourse: UITableView!
    @IBOutlet weak var weekdays: UIPickerView!
    @IBOutlet weak var startTime: UIPickerView!
    @IBOutlet weak var endTime: UIPickerView!
    @IBOutlet weak var Coursedescription: UITextField!
    @IBOutlet weak var place: UITextField!
    
    
    var selectStartTime: Int?
    var selectEndTime: Int?
    var selectWeekday: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()

        addCourse.backgroundView = UIImageView(image: UIImage(named: "blueBackGround"))
        self.initiatePickers()
         addCourse.separatorColor = UIColor.clear
        UITableViewCell.appearance().backgroundColor = UIColor.clear
     
    }
    
    @IBAction func save(_ sender: UIButton) {
        
        if Coursedescription.text == "" || place.text == "" {
        
            self.notifyUser(["Please tell me the course name and location"])
            
        
        
        }
        else{
        
            if selectEndTime! <= selectStartTime! {
            
            self.notifyUser(["Please select the correct time"])
            
            
            }
            
            else {
                
                guard let date = selectWeekday,
                let place = self.place.text
                ,let description = self.Coursedescription.text
                else {
                 notifyUser(["There was an error adding your course, please try again"])
                    return
                }
                
                let newCourse = TimeTableViewModel.shared.formCourse(date: date, place: place, startTime: selectStartTime!, endTime: selectEndTime!, description: description)
            
                if TimeTableViewModel.shared.addCouse(couse: newCourse){
                
                 notifyUser(["Yeah! New Course added!","Your timetable will be updated next time login"])
                    
                }
                else {
                
                notifyUser(["There was an error adding your course, please try again"])
                }
            
            
            }
            
            
            
        
        }
        
        
    }
    
    
    @IBAction func cancel(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }

    
}

extension AddCourseTableViewController: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == weekdays {
        
            return TimeTableViewModel.shared.weekdays.count
        
        }
        else if pickerView == startTime{
            return TimeTableViewModel.shared.startTime.count
        
        }
        else   {
        
            return TimeTableViewModel.shared.endTime.count
        
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == weekdays {
            
            return TimeTableViewModel.shared.weekdays[row]
            
        }
        else if pickerView == startTime{
            return TimeTableViewModel.shared.startTime[row]
            
        }
        else  {
            return TimeTableViewModel.shared.endTime[row]
            
            
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        if pickerView == weekdays {
            self.selectWeekday = TimeTableViewModel.shared.weekdays[row]
            
        }
        else if pickerView == startTime{
            self.selectStartTime = Int(TimeTableViewModel.shared.startTime[row])
            
        }
        else if pickerView == endTime {
            self.selectEndTime = Int(TimeTableViewModel.shared.endTime[row])
            
            
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel = view as? UILabel;
        
        if (pickerLabel == nil)
        {
            pickerLabel = UILabel()
            pickerLabel!.textAlignment = NSTextAlignment.center
            pickerLabel!.textColor = UIColor.white
        }
        if  weekdays == pickerView{
            pickerLabel?.text = TimeTableViewModel.shared.weekdays[row]
        }else if startTime == pickerView{
            pickerLabel?.text = TimeTableViewModel.shared.startTime[row]
            
        }else{
            pickerLabel?.text = TimeTableViewModel.shared.endTime[row]
        }
        return pickerLabel!
    }
    
    
    


    
    func initiatePickers(){
    
        weekdays.delegate = self
        startTime.delegate = self
        endTime.delegate = self
    
        
    
    }
    
    //customized alert view function
    func notifyUser( _ message: [String] ) -> Void
    {
        var messageForPrint = ""
        
        for meg in message {
            
            messageForPrint.append("\(meg) \n")
            
            
        }
        
        
        let alert = UIAlertController(title: "Uni+", message: messageForPrint, preferredStyle: UIAlertControllerStyle.alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
        
    }


}
