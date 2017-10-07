//
//  FirstTableViewController.swift
//  Uni+
//
//  Created by Chase on 26/8/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import UIKit

class FirstTableViewController: UITableViewController {
    
    @IBOutlet var myDayTable: UITableView!
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    
   
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundView = UIImageView(image: UIImage(named: "blueBackGround"))
        tableView.backgroundView?.contentMode = .scaleAspectFill
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        sideMenu()
    
        
    }
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        
        
      
        
       if indexPath.row == 0
        
       { let cell = tableView.dequeueReusableCell(withIdentifier: "firstcell",for: indexPath) as! WeatherCell
        //myDayTable.reloadData()
        
        cell.setData(weather: WeatherModelViewItem.shared)
        
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        cell.backgroundColor = UIColor.clear
         return cell
        }
       
       
       else if indexPath.row == 1 {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell",for: indexPath) as! EventTableViewCell
        
        cell.name1.text = TimetableFirstPageViewModel.shared.name1
        cell.name2.text = TimetableFirstPageViewModel.shared.name2
        cell.Time1.text = TimetableFirstPageViewModel.shared.time1
        cell.time2.text = TimetableFirstPageViewModel.shared.time2
        
        cell.backgroundColor = UIColor.clear
        return cell
        
        }
        
       else if indexPath.row == 2 {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell",for: indexPath) as! EventTableViewCell
        cell.name1.text = CalendarFirstPageViewModel.shared.name1
        cell.Time1.text = CalendarFirstPageViewModel.shared.time1
        cell.name2.text = CalendarFirstPageViewModel.shared.name2
        cell.time2.text = CalendarFirstPageViewModel.shared.time2
        
        cell.backgroundColor = UIColor.clear
        return cell
        }
       else {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell",for: indexPath) as! EventTableViewCell
        cell.backgroundColor = UIColor.clear
        
        
        cell.name1.text = NoteFirstPageViewModel.shared.name1
        cell.Time1.text = NoteFirstPageViewModel.shared.time1
        cell.name2.text = NoteFirstPageViewModel.shared.name2
        cell.time2.text = NoteFirstPageViewModel.shared.time2
        
        return cell
        
        }
       
        
        
        
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 1{
            self.performSegue(withIdentifier: "TimetableDetail", sender: self)}
        else if indexPath.row == 2 {
        
        self.performSegue(withIdentifier: "CalDetail", sender: self)
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
    

}
