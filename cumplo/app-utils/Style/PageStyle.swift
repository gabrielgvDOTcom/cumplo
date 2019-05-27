//
//  PageStyle.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 4/17/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

class PageStyle: FGPageStyle {
    
    /*override var title: Style.Text {
        return Style.Text(
            font: UIFont(size: 14, weight: .regular),
            color: UIColor.darkGray
        )
    }
    override var titleSelected: Style.Text {
        return Style.Text(
            font: UIFont(size: 14, weight: .medium),
            color: UIColor(named: "green")!
        )
    }*/

    override var headerBGColor: UIColor {
        return UIColor.white
    }
    override var headerBGSelected: UIColor {
        return UIColor(named: "green")!
    }
    override var minimumLineSpacing: CGFloat {
        return 0
    }
}
