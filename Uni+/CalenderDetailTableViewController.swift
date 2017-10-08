//
//  CalenderDetailTableViewController.swift
//  Uni+
//
//  Created by Chase on 4/10/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import UIKit

class CalenderDetailTableViewController: UITableViewController {
    
    @IBOutlet var detailTable: UITableView!
    var date = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
         detailTable.reloadData()
        detailTable.backgroundView = UIImageView(image: UIImage(named: "purpleBackGround"))
     CalendarViewModel.shared.loadCalendar(date: date)
        
        
    }



    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return CalendarViewModel.shared.loadCalendarEvents.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CalendarDetail", for: indexPath) as! CalendarEventTableViewCell
        
        let calenderEvent: CalendarEvent = CalendarViewModel.shared.loadCalendarEvents[indexPath.row]
        
        cell.title.text = calenderEvent.date
        cell.people.text = calenderEvent.people
        cell.notes.text = calenderEvent.description

        cell.notes.isEditable = false
        cell.notes.backgroundColor = UIColor.clear
        cell.notes.layer.cornerRadius = 5
     
        return cell
    }
 
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete{
            

            
            let cal = CalendarViewModel.shared.loadCalendarEvents[indexPath.row]
            if CalendarViewModel.shared.deleteCalendar(cal: cal){
            
                detailTable.reloadData()
            
            }
                
                
            }
            else{
                print("delete failed")
            }
            
            
            
        }
        
    
    

}
