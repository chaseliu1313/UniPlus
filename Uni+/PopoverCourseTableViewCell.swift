//
//  PopoverCourseTableViewCell.swift
//  Uni+
//
//  Created by Chase on 7/10/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import UIKit

class PopoverCourseTableViewCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var place: UILabel!
    @IBOutlet weak var time: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
