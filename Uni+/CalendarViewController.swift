//
//  CalendarViewController.swift
//  Uni+
//
//  Created by Chase on 27/8/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarViewController: UIViewController {
    
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var month: UILabel!
    @IBOutlet weak var calenaerView: JTAppleCalendarView!
    

 
    

    
   
    @IBOutlet weak var menuButton: UIBarButtonItem!
    private var collapseMaster = true
       
    @IBOutlet weak var addbutton: UIBarButtonItem!
    
    
    
    let formatter = DateFormatter()
    let outsideMonthColor = UIColor.darkGray
    let monthColor = UIColor.black
    
    var selected = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    
        
        
        if UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft || UIDevice.current.orientation == UIDeviceOrientation.landscapeRight {
            
        
            
        }
        
    
       //setting navigation bar button and function
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
      
        UITableViewCell.appearance().backgroundColor = UIColor.clear
        splitViewController?.delegate = self
        
        //open sidemenu
        sideMenu()
        //setupcalendarViewUI
        setupCalendarView()
        
        calenaerView.scrollToDate(Date.init())
        
    }
    
    @IBAction func add(_ sender: UIBarButtonItem) {
        
        
        if UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft || UIDevice.current.orientation == UIDeviceOrientation.landscapeRight {
            
            self.notifyUser(["Please add calender event in portrait"])
        }
        else if self.selected == "" {
           
            self.notifyUser(["Please select a date"])
        
        }
        else {
        
        self.performSegue(withIdentifier: "addCalendarEvent", sender: self)
        }
        
        
        
        
        
    }
    func setupCalendarView(){
        calenaerView.minimumLineSpacing = 0
        calenaerView.minimumInteritemSpacing = 0
        calenaerView.visibleDates { (dates) in
          self.setupInitialInfo(data: dates)
        }
    }
    

    // send selected date to detail add calendar view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.destination is addClendarEventViewController {
        
            let addVC = segue.destination as? addClendarEventViewController
            addVC?.date = self.selected
        
        }
        else if segue.destination is SplitDetailViewController{
        
        let detail = segue.destination as? SplitDetailViewController
            
            detail?.date = self.selected
        
        }
        
    }
    
    
    //open side menu
    func sideMenu()
    {
        
        if revealViewController() != nil{
            
            menuButton.target = self.revealViewController()
            
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
           
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
            
        }
        
    }
    
    
    @IBAction func showDetail(_ sender: Any) {
        
        self.performSegue(withIdentifier: "showDetail", sender: self)
    }
    
    
}




//calendar view extensions

extension CalendarViewController:  JTAppleCalendarViewDataSource{
    
    //initialize calendar
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        
        
        formatter.dateFormat = "yyyy MM dd EEEE"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let startDate = formatter.date(from:"2000 01 01 Sat")!
        let endDate = formatter.date(from:"2100 01 01 Fri")!
        
        let parameter = ConfigurationParameters(startDate: startDate, endDate: endDate)
        self.calenaerView.scrollingMode = ScrollingMode.stopAtEachCalendarFrameWidth
        
        return parameter
    }
    
 
    
    
}

extension CalendarViewController: JTAppleCalendarViewDelegate{
    
    func handleCellTextColor(view: JTAppleCell?, cellState: CellState){
        guard let vaildCell = view as? CustomCell else {
            return
        }
        if cellState.dateBelongsTo == .thisMonth{
            vaildCell.dateLabel.textColor = monthColor
        }else{
            vaildCell.dateLabel.textColor = outsideMonthColor
        }
        
    }

    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier:"Customcell",  for:indexPath)as! CustomCell
        cell.dateLabel.text = cellState.text
        if cellState.isSelected{
            cell.selectedView.isHidden = false
        }else{
            cell.selectedView.isHidden = true
            
        }
        
        cell.dateLabel.textColor = UIColor.gray
        handleCellTextColor(view: cell, cellState: cellState)
        
        return cell
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState){
        guard let vaildCell = cell as? CustomCell else {
            
            
            return
        }
        vaildCell.selectedView.isHidden = false
        
        formatter.dateFormat = "yyyy"
        let year = formatter.string(from: date)
        formatter.dateFormat = "MM"
        let month = formatter.string(from: date)
        formatter.dateFormat = "dd"
        let day = formatter.string(from: date)
        formatter.dateFormat = "EEEE"
        let weekday = formatter.string(from: date)
        
        self.selected = "\(year)-\(month)-\(day)-\(weekday)"
       
        let notificationName = Notification.Name(rawValue:notificationKey)
        
        let dataForPass = ["date": self.selected]
        
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: dataForPass)
        

        
        
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        
            guard let vaildCell = cell as? CustomCell else {
                return
            }
            vaildCell.selectedView.isHidden = true
       
            
        
        
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo){
        
        self.setupInitialInfo(data: visibleDates)
        
    }
    
    func setupInitialInfo(data visibleDates: DateSegmentInfo) {
    
        let date = visibleDates.monthDates.first!.date
        formatter.dateFormat = "yyyy"
        
        year.text = formatter.string(from: date)
        
        formatter.dateFormat = "MMMM"
        month.text = formatter.string(from: date)

        
    
    }
    
  
    
}



//split view configuration
extension CalendarViewController : UISplitViewControllerDelegate {
    
//show the master view by default
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        
        return true
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


