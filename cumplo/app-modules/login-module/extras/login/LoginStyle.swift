//
//  LoginStyle.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 5/13/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import Foundation

extension Style {
    
    struct Login {
        
        static let SubTitle = Style.Text(
            font: UIFont(size: 13, weight: .regular),
            color: UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1.0)
        )
        static let PasswordButton = Style.Button(
            font: UIFont(size: 13, weight: .regular),
            bgColor: UIColor.clear,
            tintColor: UIColor(named: "green")!,
            corner: 0,
            image: nil
        )
    }
}
