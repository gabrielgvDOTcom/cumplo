//
//  FilterCell.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 4/4/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import UIKit

class FilterCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    
        titleLabel.style(Style.Table.Cell.Title)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
