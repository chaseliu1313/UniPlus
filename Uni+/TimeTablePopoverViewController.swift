//
//  TimeTablePopoverViewController.swift
//  Uni+
//
//  Created by Chase on 24/9/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import UIKit

class TimeTablePopoverViewController: UIViewController {
    
 

    @IBOutlet weak var Popover: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       Popover.backgroundView = UIImageView(image: UIImage(named: "blueBackGround"))
        
       Popover.backgroundView?.contentMode = .scaleAspectFill
        
        UITableViewCell.appearance().backgroundColor = UIColor.clear
        
        Popover.layer.cornerRadius = 25
        TimeTableViewModel.shared.loadAllCourses()
        Popover.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBOutlet weak var `return`: UIButton!

    
    @IBAction func `return`(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}

extension TimeTablePopoverViewController: UITableViewDelegate, UITableViewDataSource {


    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return TimeTableViewModel.shared.loadCourses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "popoverTTCell", for: indexPath) as! PopoverCourseTableViewCell
        
        cell.name.text = TimeTableViewModel.shared.loadCourses[indexPath.row].description
        cell.place.text = TimeTableViewModel.shared.loadCourses[indexPath.row].place
        
        cell.time.text = "On \(TimeTableViewModel.shared.loadCourses[indexPath.row].date)  From: \(TimeTableViewModel.shared.loadCourses[indexPath.row].startTime)  To: \(TimeTableViewModel.shared.loadCourses[indexPath.row].endTime)"
        
        
      
        
        return cell
        
        
    }




}
