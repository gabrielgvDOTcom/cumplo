//
//  PointEcommerce.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 5/19/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import UIKit

class PointEcommerce: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.style(Style.Table.Cell.Inversion.Title)
        subtitleLabel.style(Style.Table.Cell.Inversion.Subtitle)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
