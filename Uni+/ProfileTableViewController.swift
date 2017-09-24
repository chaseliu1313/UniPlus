//
//  ProfileTableViewController.swift
//  Uni+
//
//  Created by Chase on 18/9/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {

    @IBOutlet var ProfileTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProfileTable.backgroundView = UIImageView(image: UIImage(named: "SideMenu-1"))
        
        ProfileTable.backgroundView?.contentMode = .scaleAspectFill
        
        UITableViewCell.appearance().backgroundColor = UIColor.clear
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func `return`(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
