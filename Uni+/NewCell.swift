//
//  NewCell.swift
//  Uni+
//
//  Created by Chase on 26/8/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import UIKit

class NewCell: UITableViewCell {

    
    @IBOutlet weak var imageV: UIImageView!
    
    
   
    var im : UIImage?{
    
        didSet{
        
        self.updateUI()
        }
        
    }
    func updateUI(){
    
       imageV?.image = im
    
    }
    
    

}
