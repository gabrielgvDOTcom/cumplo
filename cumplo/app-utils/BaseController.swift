//
//  BaseController.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 3/14/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import UIKit

class BaseController: UIViewController {

    var loader: FGLoader = {
        return FGLoader()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationItem.backBarButtonItem?.title = "Atrás"
    }
}
