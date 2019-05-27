//
//  HelpStyle.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 4/12/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import UIKit

extension Style {
    
    struct Help {

        static let Title = Style.Text(
            font: UIFont(size: 16, weight: .medium),
            color: UIColor(named: "gray")!
        )
        static let SubTitle = Style.Text(
            font: UIFont(size: 18, weight: .regular),
            color: UIColor(named: "green")!
        )
    }
}
