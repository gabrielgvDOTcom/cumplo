//
//  OpportunityFilterCell.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 3/27/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import UIKit

class OpportunityFilterCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        self.layer.cornerRadius = 5.0
        self.layer.masksToBounds = true
        
        titleLabel.style(Style.Table.Filter.Title)
    }
}
