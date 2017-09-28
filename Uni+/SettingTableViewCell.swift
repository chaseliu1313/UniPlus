//
//  SettingTableViewCell.swift
//  Uni+
//
//  Created by Geng Xu on 2017/9/27.
//  Copyright © 2017年 Chase Liu. All rights reserved.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
      @IBOutlet weak var option: UIPickerView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
