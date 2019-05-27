//
//  UIButton+Extension.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 3/20/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import UIKit

extension UIButton {
    
    var plusButton: UIButton {
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage().plusIcon, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        return button
    }
    var timesButton: UIButton {
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage(named: "close_icon"), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        button.tintColor = UIColor.darkGray
        return button
    }
    var ecommerceButton: UIButton {
        let button = UIButton.init(type: .custom)
        button.setImage(UIImage().ecommerceIcon, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
        return button
    }

    func style(_ style: Style.Button) {
        
        self.tintColor = style.tintColor
        self.titleLabel?.font = style.font
        self.backgroundColor = style.bgColor
    }
}
