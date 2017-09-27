//
//  SettingsTableViewController.swift
//  Uni+
//
//  Created by Chase on 18/9/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    @IBOutlet var SettingTable: UITableView!
    
    
    let settingTitle = ["Week Start On:", "show Temperature As:", "Choose Campus"]
    
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return (settingTitle.count)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        SettingTable.backgroundView = UIImageView(image: UIImage(named: "SideMenu-1"))
        SettingTable.backgroundView?.contentMode = .scaleAspectFill
        
        UITableViewCell.appearance().backgroundColor = UIColor.clear
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    
    @IBAction func `return`(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
