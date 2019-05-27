//
//  AlertEntity.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 5/14/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import Foundation

struct AlertEntity {
    
    var title: String!
    var message: String!
    var style: UIAlertController.Style!
    var actions: [UIAlertAction]! = []
}
