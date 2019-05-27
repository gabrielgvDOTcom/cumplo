//
//  OrderAccountCell.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 5/9/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import UIKit

class OrderAccountCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        iconImage.isHighlighted = selected
    }
    
    func display(item: BankAccountEntity) {
        titleLabel.text = item.account
        subtitleLabel.text = "\(item.account_number!) / \(item.bank!)"
    }
}
