//
//  CoinbaseUserCell.swift
//  viper-tutorial
//
//  Created by Kelvin Lee on 10/7/18.
//  Copyright © 2018 Kelvin Lee. All rights reserved.
//

import UIKit
import Reusable

class CoinbaseUserCell: UITableViewCell, NibReusable {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
