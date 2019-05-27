//
//  InvestorsInteractor.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import Foundation

class InvestorsInteractor: InvestorsProtocolInteractorInput {
    
    //MARK: - VARs
    var presenter: InvestorsProtocolInteractorOutput?
    var remote: InvestorsProtocolFetchInput?
    
    //MARK: - Init
    init(remote: InvestorsProtocolFetchInput) {
        self.remote = remote
    }
    
    //MARK: - Functions
    //MARK: Interactor
    func setModule() {}
    func unsetModule() {}
}
