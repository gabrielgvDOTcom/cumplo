//
//  PageStyle.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 4/15/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import Foundation

class PageStyle: FGPageStyle {
    
    override var title: Style.Text {
        return Style.Text(font: UIFont(size: 16, weight: .regular), color: UIColor.darkGray)
    }
    override var titleSelected: Style.Text {
        return Style.Text(font: UIFont(size: 16, weight: .regular), color: UIColor(named: "green")!)
    }
    override var minimumLineSpacing: CGFloat {
        return 0
    }
    override var headerBGSelected: UIColor {
        return UIColor(named: "green")!
    }
}
