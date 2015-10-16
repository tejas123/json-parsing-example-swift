//
//  TableViewCell.swift
//  JSONDemo
//
//  Created by TheAppGuruz-New-6 on 31/07/14.
//  Copyright (c) 2014 TheAppGuruz-New-6. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lbDetails: UILabel!
//    init(style: UITableViewCellStyle, reuseIdentifier: String)
//    {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        // Initialization code
//    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
