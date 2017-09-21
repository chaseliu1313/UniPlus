//
//  ClendarDetailTableViewCell.swift
//  Uni+
//
//  Created by Chase on 17/9/17.
//  Copyright © 2017 Chase Liu. All rights reserved.
//

import UIKit

class ClendarDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var indicationIMG: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var content: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
