//
//  T4TableViewCell.swift
//  Training4
//
//  Created by dinh trong thang on 7/18/16.
//  Copyright © 2016 dinh trong thang. All rights reserved.
//

import UIKit

class T4TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBOutlet var t4ImageView : UIImageView!
    @IBOutlet var t4Date : UILabel!
    @IBOutlet var t4avValue : UILabel!
    @IBOutlet var t4loviValue : UILabel!

}
