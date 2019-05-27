//
//  UILabel+Extension.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 3/15/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import UIKit

extension UILabel {
    
    func style(_ style: Style.Text) {

        self.font = style.font
        self.textColor = style.color
    }
}
