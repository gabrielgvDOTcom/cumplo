//
//  InvestmentInteractor.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import Foundation

class InvestmentInteractor: InvestmentProtocolInteractorInput {
    
    //MARK: - VARs
    var presenter: InvestmentProtocolInteractorOutput?
    var remote: InvestmentProtocolFetchInput?
    
    //MARK: - Init
    init(remote: InvestmentProtocolFetchInput) {
        self.remote = remote
    }
    
    //MARK: - Functions
    //MARK: Interactor
    func setModule() {}
    func unsetModule() {}
}
