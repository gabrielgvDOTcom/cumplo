//
//  RegisterCell.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 3/21/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import UIKit

class RegisterCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        textField.delegate = self
        titleLabel.style(Style.Table.Cell.Title)
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
extension RegisterCell: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.endEditing(true)
        return true
    }
}
