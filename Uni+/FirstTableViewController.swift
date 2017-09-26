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
    
    
    let weatherVM = WeatherModelViewItem.init()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundView = UIImageView(image: UIImage(named: "Rectangle"))
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
        
        cell.setData(weather: self.weatherVM)
        
        
        cell.backgroundColor = UIColor.clear
         return cell
        }
       
       
       else {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell",for: indexPath) as! EventTableViewCell
        cell.backgroundColor = UIColor.clear
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
