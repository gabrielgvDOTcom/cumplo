//
//  PreOrderInteractor.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import Foundation

class PreOrderInteractor: PreOrderProtocolInteractorInput {
    
    //MARK: - VARs
    var presenter: PreOrderProtocolInteractorOutput?
    var remote: PreOrderProtocolFetchInput?
    
    //MARK: - Init
    init(remote: PreOrderProtocolFetchInput) {
        self.remote = remote
    }
    
    //MARK: - Functions
    //MARK: Interactor
    func setModule() {}
    func unsetModule() {}
}
