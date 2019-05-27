//
//  Style+Extension.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 3/15/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import UIKit

extension Style {
    
    struct Table {
        
        struct Header {
            
            static let Title = Style.Text(
                font: UIFont(size: 13, weight: .regular),
                color: UIColor(red: 109/255, green: 109/255, blue: 114/255, alpha: 1.0)
            )
        }
        struct Cell {
            
            //DEFAULT
            static let Title = Style.Text(
                font: UIFont(size: 16, weight: .medium),
                color: UIColor(named: "darkgray")!
            )
            static let Subtitle = Style.Text(
                font: UIFont(size: 14, weight: .regular),
                color: UIColor(named: "darkgray")!
            )
            
            struct Inversion {
                
                static let Title = Style.Text(
                    font: UIFont(size: 15, weight: .medium),
                    color: UIColor(named: "darkgray")!
                )
                static let Subtitle = Style.Text(
                    font: UIFont(size: 15, weight: .bold),
                    color: .black
                )
            }
        }
        struct Footer {
            
            static let Title = Style.Text(
                font: UIFont(size: 14, weight: .regular),
                color: UIColor(named: "gray")!
            )
        }
        struct Filter {
            
            static let Title = Style.Text(
                font: UIFont(size: 14, weight: .semibold),
                color: UIColor(hex: "#3b454e")
            )
        }
    }
}
