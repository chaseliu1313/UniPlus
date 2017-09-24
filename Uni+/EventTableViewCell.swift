//
//  EventTableViewCell.swift
//  Uni+
//
//  Created by Chase on 24/9/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    @IBOutlet weak var name1: UILabel!
    @IBOutlet weak var Time1: UILabel!
    @IBOutlet weak var name2: UILabel!
    @IBOutlet weak var time2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
