//
//  CollectionStyle+Extension.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 3/16/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import UIKit

extension Style {
    
    struct Opportunity {
        
        struct Header {
            
            static let Title = Style.Text(
                font: UIFont(size: 18, weight: .medium),
                color: UIColor(named: "gray")!
            )
        }
        struct Bussines {
            
            static let Title = Style.Text(
                font: UIFont(size: 15, weight: .regular),
                color: UIColor.black.withAlphaComponent(0.87)
            )
            static let Subtitle = Style.Text(
                font: UIFont(size: 13, weight: .semibold),
                color: UIColor.black.withAlphaComponent(0.6)
            )
        }
        struct Credit {
            
            static let Title = Style.Text(
                font: UIFont(size: 13, weight: .semibold),
                color: UIColor.black.withAlphaComponent(0.6)
            )
        }
        struct Footer {

            static let Title = Style.Text(
                font: UIFont(size: 15, weight: .regular),
                color: UIColor(named: "green")!
            )
            static let Subtitle = Style.Text(
                font: UIFont(size: 13, weight: .semibold),
                color: UIColor.black.withAlphaComponent(0.6)
            )
        }
    }
}
