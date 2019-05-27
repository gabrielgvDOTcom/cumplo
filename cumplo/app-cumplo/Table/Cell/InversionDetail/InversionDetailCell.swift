//
//  InversionDetailCell.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 5/19/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import UIKit

class InversionDetailCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    @IBOutlet weak var inversionTitleLabel: UILabel!
    @IBOutlet weak var inversionSubtitleLabel: UILabel!
    @IBOutlet weak var timeTitleLabel: UILabel!
    @IBOutlet weak var timeSubtitleLabel: UILabel!
    @IBOutlet weak var payerTitleLabel: UILabel!
    @IBOutlet weak var payerSubtitleLabel: UILabel!
    @IBOutlet weak var scoreTitleLabel: UILabel!
    @IBOutlet weak var scoreSubtitleLabel: UILabel!
    @IBOutlet weak var tirTitleLabel: UILabel!
    @IBOutlet weak var tirSubtitleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        titleLabel.style(Style.Table.Cell.Title)
        subtitleLabel.style(Style.Table.Cell.Subtitle)

        inversionTitleLabel.style(Style.Table.Cell.Inversion.Title)
        inversionSubtitleLabel.style(Style.Table.Cell.Inversion.Subtitle)
        timeTitleLabel.style(Style.Table.Cell.Inversion.Title)
        timeSubtitleLabel.style(Style.Table.Cell.Inversion.Subtitle)
        payerTitleLabel.style(Style.Table.Cell.Inversion.Title)
        payerSubtitleLabel.style(Style.Table.Cell.Inversion.Subtitle)
        scoreTitleLabel.style(Style.Table.Cell.Inversion.Title)
        scoreSubtitleLabel.style(Style.Table.Cell.Inversion.Subtitle)
        tirTitleLabel.style(Style.Table.Cell.Inversion.Title)
        tirSubtitleLabel.style(Style.Table.Cell.Inversion.Subtitle)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
