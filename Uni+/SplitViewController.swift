//
//  SplitViewController.swift
//  Uni+
//
//  Created by Chase on 23/9/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import UIKit

class SplitViewController: UISplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       self.splitViewController?.preferredDisplayMode = UISplitViewControllerDisplayMode.allVisible
    self.extendedLayoutIncludesOpaqueBars = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    override func collapseSecondaryViewController(_ secondaryViewController: UIViewController, for splitViewController: UISplitViewController) {
        
        
    }
    
    
    
   
}
