//
//  UIStyle+Extension.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 3/20/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import UIKit

extension Style {
    
    struct UI {

        struct Button {
            
            static let Primary = Style.Button(
                font: UIFont(size: 17, weight: .bold),
                bgColor: UIColor(named: "green")!,
                tintColor: UIColor.white,
                corner: 2.5,
                image: nil
            )
            static let Secondary = Style.Button(
                font: UIFont(size: 18, weight: .bold),
                bgColor: UIColor(named: "lightBlack")!,
                tintColor: UIColor.white,
                corner: 2.5,
                image: nil
            )
            static let Facebook = Style.Button(
                font: UIFont(size: 14, weight: .bold),
                bgColor: UIColor(hex: "#3b5998"),
                tintColor: UIColor.white,
                corner: 2.5,
                image: nil
            )
            static let Google = Style.Button(
                font: UIFont(size: 14, weight: .bold),
                bgColor: UIColor.white,
                tintColor: UIColor.white,
                corner: 2.5,
                image: nil
            )
            static let Twitter = Style.Button(
                font: UIFont(size: 14, weight: .bold),
                bgColor: UIColor(hex: "#00aced"),
                tintColor: UIColor.white,
                corner: 2.5,
                image: nil
            )
            static let LinkedIn = Style.Button(
                font: UIFont(size: 14, weight: .bold),
                bgColor: UIColor(hex: "#0e76a8"),
                tintColor: UIColor.white,
                corner: 2.5,
                image: nil
            )
        }
    }
}
