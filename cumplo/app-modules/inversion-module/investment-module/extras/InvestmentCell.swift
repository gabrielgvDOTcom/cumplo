//
//  InvestmentCell.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 5/17/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import UIKit

class InvestmentCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
