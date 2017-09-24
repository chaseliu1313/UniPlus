//
//  TimeTablePopoverViewController.swift
//  Uni+
//
//  Created by Chase on 24/9/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import UIKit

class TimeTablePopoverViewController: UIViewController {

    @IBOutlet weak var Popover: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       Popover.backgroundView = UIImageView(image: UIImage(named: "Rectangle"))
        
       Popover.backgroundView?.contentMode = .scaleAspectFill
        
        UITableViewCell.appearance().backgroundColor = UIColor.clear
        
        Popover.layer.cornerRadius = 25
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBOutlet weak var `return`: UIButton!

    
    @IBAction func `return`(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
