//
//  EcommerceInteractor.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import Foundation

class EcommerceInteractor: EcommerceProtocolInteractorInput {
    
    //MARK: - VARs
    var presenter: EcommerceProtocolInteractorOutput?
    var remote: EcommerceProtocolFetchInput?
    
    //MARK: - Init
    init(remote: EcommerceProtocolFetchInput) {
        self.remote = remote
    }
    
    //MARK: - Functions
    func setModule() {}
    func unsetModule() {}
}
