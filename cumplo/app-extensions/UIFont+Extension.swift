//
//  UIFont+Extension.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 3/16/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import UIKit

extension UIFont {
    
    convenience init(size: CGFloat, weight: UIFont.Weight) {

        var font: String! = ""
        switch weight {
        case .thin: font = "Nunito-ExtraLight"
        case .light: font = "Nunito-Light"
        case .regular: font = "Nunito"
        case .medium: font = "Nunito-SemiBold"
        case .semibold: font = "Nunito-SemiBold"
        case .bold: font = "Nunito-Bold"
        default: font = "Nunito"
        }
        self.init(name: font, size: size)!
    }
}
