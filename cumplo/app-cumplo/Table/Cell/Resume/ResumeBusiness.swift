//
//  ResumeBusinessCell.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 5/18/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import UIKit

class ResumeBusiness: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var accessoryButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        titleLabel.style(Style.Table.Cell.Title)
        subtitleLabel.style(Style.Table.Cell.Subtitle)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func display(item: BusinessEntity) {
        subtitleLabel.isHidden = true

        titleLabel.text = item.title
        if let sub = item.subtitle {
            subtitleLabel.text = sub
            subtitleLabel.isHidden = false
        }
    }
}
