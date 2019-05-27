//
//  PreviewCell.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 5/17/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import UIKit

class PreviewCell: UITableViewCell {

    @IBOutlet weak var ecommerceImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var creditLabel: UILabel!
    @IBOutlet weak var amountTitleLabel: UILabel!
    @IBOutlet weak var amountSubtitleLabel: UILabel!
    @IBOutlet weak var termTitleLabel: UILabel!
    @IBOutlet weak var termSubtitleLabel: UILabel!
    @IBOutlet weak var tirTitleLabel: UILabel!
    @IBOutlet weak var tirSubtitleLabel: UILabel!
    @IBOutlet weak var dangerTitleLabel: UILabel!
    @IBOutlet weak var dangerSubtitleLabel: UILabel!
    @IBOutlet weak var bussinesTitleLabel: UILabel!
    @IBOutlet weak var bussinesSubtitleLabel: UILabel!
    @IBOutlet weak var barView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()

        self.layer.cornerRadius = 5.0
        self.layer.masksToBounds = true

        let footerTitle: [UILabel] = [
            amountTitleLabel, termTitleLabel,
            tirTitleLabel, dangerTitleLabel
        ]
        let footerSubtitle: [UILabel] = [
            amountSubtitleLabel, termSubtitleLabel,
            tirSubtitleLabel, dangerSubtitleLabel
        ]

        titleLabel.style(Style.Opportunity.Header.Title)
        bussinesTitleLabel.style(Style.Opportunity.Bussines.Title)
        bussinesSubtitleLabel.style(Style.Opportunity.Bussines.Subtitle)
        creditLabel.style(Style.Opportunity.Credit.Title)
        
        footerTitle.forEach { (item) in
            item.style(Style.Opportunity.Footer.Title)
        }
        footerSubtitle.forEach { (item) in
            item.style(Style.Opportunity.Footer.Subtitle)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
