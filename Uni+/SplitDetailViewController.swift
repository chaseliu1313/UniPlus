//
//  SplitDetailViewController.swift
//  Uni+
//
//  Created by Chase on 23/9/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import UIKit

class SplitDetailViewController: UIViewController {
    
    @IBOutlet weak var detailTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        detailTable.backgroundView = UIImageView(image: UIImage(named: "Rectangle 3"))
        detailTable.backgroundView?.contentMode = .scaleAspectFill
        UITableViewCell.appearance().backgroundColor = UIColor.clear

        
    }

  

    

}