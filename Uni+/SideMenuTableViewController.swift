//
//  SideMenuTableViewController.swift
//  Uni+
//
//  Created by Chase on 17/9/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import UIKit

class SideMenuTableViewController: UITableViewController {

    @IBOutlet var sideMenuTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        sideMenuTable.backgroundView = UIImageView(image: UIImage(named: "SideMenu-1"))
        sideMenuTable.backgroundView?.contentMode = .scaleAspectFill
      
        UITableViewCell.appearance().backgroundColor = UIColor.clear
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func SnoozeButton(_ sender: Any) {
        print("something")
    }
  

}
