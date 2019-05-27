//
//  FooterText.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 5/6/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import UIKit

class FooterText: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        titleLabel.style(Style.Table.Footer.Title)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
