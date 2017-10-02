//
//  SplitDetailViewController.swift
//  Uni+
//
//  Created by Chase on 23/9/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import UIKit

let notificationKey = "splitnotification"

class SplitDetailViewController: UIViewController {
    
    @IBOutlet weak var detailTable: UITableView!
    
    let key = Notification.Name(rawValue: notificationKey)
    var date:String = ""
  
    let calendarVM = CalendarViewModel()
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        detailTable.backgroundView = UIImageView(image: UIImage(named: "purpleBackGround"))
        detailTable.backgroundView?.contentMode = .scaleAspectFill
        UITableViewCell.appearance().backgroundColor = UIColor.clear
        
        self.navigationController?.setToolbarHidden(true, animated: true)
        
        if UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft || UIDevice.current.orientation == UIDeviceOrientation.landscapeRight {
            
            self.navigationController?.setToolbarHidden(true, animated: true)}
        
        self.addObserver()
        print("detail \(self.date)" )
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addObserver()
       
        self.load()
    }
    
    //observation and notification pattern
    func updateDate(notification: NSNotification){
    
       self.date = notification.userInfo?["date"] as! String
        
    }
    
    func addObserver(){
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateDate), name: key, object: nil)
    }
    
    
    func load(){
        
        if self.date == "" {
            
            self.date = SystemManager.getCurrentDate()
            
        }
        
        calendarVM.loadCalendar(date: self.date)
        
        
        self.detailTable.reloadData()
        
    }

    @IBAction func `return`(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
  

    

}

extension SplitDetailViewController: UITableViewDelegate, UITableViewDataSource {



    //tableview functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return calendarVM.loadCalendarEvents.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CalendarEventTableViewCell", for: indexPath) as! CalendarEventTableViewCell
        
        let cal = calendarVM.loadCalendarEvents[indexPath.row]
        
        
        cell.title.text = cal.date
        cell.people.text = cal.people
        cell.content.text = cal.description
        
       
        cell.textLabel?.textColor = UIColor.white
        cell.backgroundColor = UIColor.clear
        print(cell.title.text!)
        print(cell.content.text!)
        self.load()
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            let cal = calendarVM.loadCalendarEvents[indexPath.row]
            
            if calendarVM.deleteCalendar(cal: cal)
            {
                
                self.load()
                
                print("delete done")
                
            }
            else
            {
                print("delete error")
            }
            
        }
        
    }

}
