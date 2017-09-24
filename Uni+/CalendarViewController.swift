//
//  CalendarViewController.swift
//  Uni+
//
//  Created by Chase on 27/8/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import UIKit
import JTAppleCalendar

class CalendarViewController: UIViewController{
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var month: UILabel!
    @IBOutlet weak var calenaerView: JTAppleCalendarView!
    
    @IBOutlet weak var detailTable: UITableView!
    
   // navigationController?.navigationBar.shadowImage = UIImage()
    
   
    @IBOutlet weak var menuButton: UIBarButtonItem!
    private var collapseMaster = true
   
    
    
    
    
    let formatter = DateFormatter()
    let outsideMonthColor = UIColor.darkGray
    let monthColor = UIColor.black
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    
        
        
    
       //setting navigation bar button and function
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        let addB = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addDate))
        
        self.navigationItem.rightBarButtonItem = addB
        
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        detailTable.backgroundColor = UIColor.clear
        UITableViewCell.appearance().backgroundColor = UIColor.clear
        splitViewController?.delegate = self
        
        //open sidemenu
        sideMenu()
        //setupcalendarViewUI
        setupCalendarView()
        
    }
    
    func setupCalendarView(){
        calenaerView.minimumLineSpacing = 0
        calenaerView.minimumInteritemSpacing = 0
        calenaerView.visibleDates { (dates) in
          self.setupInitialInfo(data: dates)
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    func addDate(){
        print("functions not ready yet")
    }
    
    
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




//calendar view extensions

extension CalendarViewController:  JTAppleCalendarViewDataSource{
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        
        
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let startDate = formatter.date(from:"2017 01 01")!
        let endDate = formatter.date(from:"2017 12 31")!
        
        let parameter = ConfigurationParameters(startDate: startDate, endDate: endDate)
        self.calenaerView.scrollingMode = ScrollingMode.stopAtEachCalendarFrameWidth
        
        return parameter
    }
    
//    func configureCell(cell: JTAppleCell? cellState: CellState)
//    
//    {
//    
//        //guard let myCell = cell as? CalendarDetail
//    
//    }
//    
    
    
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
        
//        self.performSegue(withIdentifier: "CalDetail", sender: self)
        
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


extension CalendarViewController : UISplitViewControllerDelegate {
    
//show the master view by default
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
    
    
}


