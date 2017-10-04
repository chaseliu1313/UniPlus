//
//  CalendarEventTableViewCell.swift
//  Uni+
//
//  Created by Chase on 2/10/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import UIKit

class CalendarEventTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var people: UILabel!
    @IBOutlet weak var notes: UITextView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
