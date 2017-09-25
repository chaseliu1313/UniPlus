//
//  NewCell.swift
//  Uni+
//
//  Created by Chase on 26/8/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var campus: UILabel!
    @IBOutlet weak var datentime: UILabel!
    @IBOutlet weak var Temp: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var weatherDescip: UILabel!
    
    
   
    var im : UIImage?{
    
        didSet{
        
        self.updateUI()
        }
        
    }
    func updateUI(){
    
       imageV?.image = im
    
    }
    
    

}
