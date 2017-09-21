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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let handler = { (curriculum: CurriculaTableItem) in
            print(curriculum.name, curriculum.identifier)
        }
        let infoSecA = CurriculaTableItem(name: "iPhone Enginerring", place: "Building 80", weekday: .monday, startPeriod: 1, endPeriod: 2, textColor: UIColor.white, bgColor: UIColor(red: 1.0, green: 0.73, blue: 0.0, alpha: 1.0), identifier: "(2015-2016-2)-21190850", tapHandler: handler)
        let infoSecB = CurriculaTableItem(name: "Graduate Project", place: "XVLab", weekday: .wednesday, startPeriod: 9, endPeriod: 10, textColor: UIColor.white, bgColor: UIColor(red: 1.0, green: 0.73, blue: 0.0, alpha: 1.0), identifier: "(2015-2016-2)-21190850", tapHandler: handler)
        
        curriculaTable.curricula = [infoSecA, infoSecB]
        
        curriculaTable.bgColor = UIColor(red: 0.94, green: 0.94, blue: 0.94, alpha: 1.0)
        curriculaTable.borderWidth = 0.5
        curriculaTable.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.9)
        curriculaTable.cornerRadius = 5
        curriculaTable.textEdgeInsets = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        curriculaTable.maximumNameLength = 12
        
        let bt = UIBarButtonItem.init(barButtonSystemItem: .bookmarks, target: self, action: #selector(doSomething))
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.rightBarButtonItem = bt
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        
        curriculaTable.bgColor = UIColor.clear
        
        sideMenu()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func doSomething(){
        print("function not ready")
    
    
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

}

