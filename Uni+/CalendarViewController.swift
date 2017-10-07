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
    @IBOutlet weak var selectionView: UIView!
    

 
    

    
   
    @IBOutlet weak var menuButton: UIBarButtonItem!
    private var collapseMaster = true
       
    @IBOutlet weak var addbutton: UIBarButtonItem!
    
    
    
    let formatter = DateFormatter()
    let outsideMonthColor = UIColor.darkGray
    let monthColor = UIColor.black
    
    var selected = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.calenaerView.scrollToDate(Date.init())
        
        
       
        
    
       //setting navigation bar button and function
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
      
        UITableViewCell.appearance().backgroundColor = UIColor.clear
        
        
        //open sidemenu
        sideMenu()
        //setupcalendarViewUI
        setupCalendarView()
        
       
        
    }
    
    
    @IBAction func addCal(_ sender: UIBarButtonItem) {
        
        if self.selected == ""{
        
        self.notifyUser(["Please Select a Date"])
        }
        else {
        
            self.performSegue(withIdentifier: "addCal", sender: self)
        }
    }
    
    
    @IBAction func checkDetail(_ sender: UIButton) {
        
        
        if self.selected == ""{
            
            self.notifyUser(["Please Select a Date"])
        }
        else {
            self.performSegue(withIdentifier: "showCalDetail", sender: self)
        
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
        else if segue.destination is CalenderDetailTableViewController{
        
        let detail = segue.destination as? CalenderDetailTableViewController
            
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
    
    
  
    
    
  
    
}




//calendar view extensions

extension CalendarViewController:  JTAppleCalendarViewDataSource{
    
    //initialize calendar
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        
        
        formatter.dateFormat = "yyyy MM dd EEEE"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let startDate = formatter.date(from:"2010 01 01 Fri")!
        let endDate = formatter.date(from:"2100 01 01 Fri")!
        
        let parameter = ConfigurationParameters(startDate: startDate, endDate: endDate)
        self.calenaerView.scrollingMode = ScrollingMode.stopAtEachCalendarFrameWidth
        self.calenaerView.scrollToDate(Date.init())
        
    
       
        
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
        cell.selectedView.layer.cornerRadius = 25
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
    
    func notifyUser( _ message: [String] ) -> Void
    {
        let meg: String = message[0]
        let alert = UIAlertController(title: "Uni+", message: meg, preferredStyle: UIAlertControllerStyle.alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
        
    }
    
}





