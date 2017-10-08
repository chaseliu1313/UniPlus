//
//  SecondViewController.swift
//  Uni+
//
//  Created by Chase Liu on 5/8/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import UIKit
import CurriculaTable

class SecondViewController: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    @IBOutlet weak var curriculaTable: CurriculaTable!
    
    var loadCurricular :[CurriculaTableItem] = []
    var courseID: Int = 0
    
    var handler  = {(curriculum: CurriculaTableItem) in
        
        
    }
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        //tap handler for course
        self.handler = {(curriculum: CurriculaTableItem) in
            
            
            self.courseID = Int(curriculum.identifier)!
            print(self.courseID)
            self.performSegue(withIdentifier: "courseDetail", sender: self)
            
        }
        
        //loadtimeTable
        self.loadCorriluar()
       curriculaTable.curricula = self.loadCurricular
        
        curriculaTable.drawCurricula()

        //customize timetable
        curriculaTable.bgColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1.0)
        curriculaTable.borderWidth = 0.5
        curriculaTable.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.9)
        curriculaTable.cornerRadius = 5
        curriculaTable.textEdgeInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        curriculaTable.maximumNameLength = 24
        curriculaTable.numberOfPeriods = 22
        
       
        //customize navagation bar
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        
        curriculaTable.bgColor = UIColor.clear
        
        sideMenu()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
    
        self.loadCorriluar()
        curriculaTable.drawCurricula()
    }

    func loadCorriluar(){
    
    
        TimeTableViewModel.shared.loadAllCourses()
        
        for course in TimeTableViewModel.shared.loadCourses {
        
            let corricular = CurriculaTableItem(name: course.description, place: course.place, weekday: TimeTableViewModel.shared.getWeekday(day: course.date), startPeriod:course.startTime, endPeriod: course.endTime , textColor: UIColor.white, bgColor: TimeTableViewModel.shared.getColor(), identifier: String(course.id), tapHandler: handler)
            
            loadCurricular.append(corricular)
        
        
        }
        
        
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.destination is CouseDetailTableViewController {
        
            let vc = segue.destination as? CouseDetailTableViewController
            
            vc?.courseID = self.courseID
        
        }
        
        
    }
    
    
    
    //open side menu
    func sideMenu()
    {
        
        if revealViewController() != nil{
            
            menuButton.target = self.revealViewController()
            
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            //revealViewController().rightViewRevealWidth = 160
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            
        }
        
    }
    @IBAction func addCourse(_ sender: Any) {
        
    }


    
 
}



