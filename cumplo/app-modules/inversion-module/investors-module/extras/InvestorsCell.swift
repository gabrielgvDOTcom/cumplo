//
//  InvestorsCell.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 5/17/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import UIKit

class InvestorsCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.style(Style.Investors.Title)
        subtitleLabel.style(Style.Investors.Subtitle)
        dateLabel.style(Style.Investors.Time)
        timeLabel.style(Style.Investors.Time)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
