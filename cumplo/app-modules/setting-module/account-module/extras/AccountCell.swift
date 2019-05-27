//
//  AccountCell.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 4/8/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import UIKit

class AccountCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        textField.delegate = self
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func display(item: CPTextFieldEntity) {
        titleLabel.isHidden = true
        
        if let title = item.title {
            titleLabel.text = title
            titleLabel.isHidden = false
        }
        if let placeholder = item.placeholder {
            textField.placeholder = placeholder
        }
    }
}
extension AccountCell: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return true
    }
}
