//
//  SimulateInteractor.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import Foundation

class SimulateInteractor: SimulateProtocolInteractorInput {
    
    //MARK: - VARs
    var presenter: SimulateProtocolInteractorOutput?
    var remote: SimulateProtocolFetchInput?
    
    //MARK: - Init
    init(remote: SimulateProtocolFetchInput) {
        self.remote = remote
    }
    
    //MARK: - Functions
    //MARK: Interactor
    func setModule() {}
    func unsetModule() {}
}
