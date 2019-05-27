//
//  BaseNavigation.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 3/22/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import UIKit

class BaseNavigation: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationBar.topItem?.title = "Atrás"
        self.view.backgroundColor = UIColor.white
    }
}
