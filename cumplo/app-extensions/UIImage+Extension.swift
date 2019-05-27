//
//  UIImage+Extension.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 3/15/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import UIKit

enum ImageSize {
    case icon
}
extension UIImage {

    var bellIcon: UIImage {
        return UIImage(named: "bell_icon")!
    }
    var plusIcon: UIImage {
        return UIImage(named: "add_icon")!
    }
    var timesIcon: UIImage {
        return UIImage(named: "close_icon")!
    }
    var dollarIcon: UIImage {
        return UIImage(named: "marked_icon")!
    }
    var ecommerceIcon: UIImage {
        return UIImage(named: "cart_icon")!
    }
    var userCircleIcon: UIImage {
        return UIImage(named: "usercircle_icon")!
    }
    var opportunityIcon: UIImage {
        return UIImage(named: "opportunity_icon")!
    }
}
