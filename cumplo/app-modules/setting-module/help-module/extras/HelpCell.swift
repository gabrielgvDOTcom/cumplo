//
//  HelpCell.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 4/8/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import UIKit

class HelpCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.style(Style.Help.Title)
        subtitleLabel.style(Style.Help.SubTitle)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func display(item: IconTextEntity) {
        titleLabel.text = item.title
        subtitleLabel.text = item.message

        if let icon = item.icon {
            iconImage.image = UIImage(named: icon)
        }
    }
}
