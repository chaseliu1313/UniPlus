//
//  RegisterPopupViewController.swift
//  Uni+
//
//  Created by Chase on 30/9/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import UIKit

class RegisterPopupViewController: UIViewController {

    @IBOutlet weak var popupView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        popupView.layer.cornerRadius = 15
        popupView.layer.masksToBounds = true

        
    }

    @IBAction func close(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
 
    
}
