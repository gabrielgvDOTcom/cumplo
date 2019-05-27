//
//  OpportunityInteractor.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import Foundation

class OpportunityInteractor: OpportunityProtocolInteractorInput {
    
    //MARK: - VARs
    var presenter: OpportunityProtocolInteractorOutput?
    var remote: OpportunityProtocolFetchInput?
    
    //MARK: - Init
    init(remote: OpportunityProtocolFetchInput) {
        self.remote = remote
    }
    
    //MARK: - Functions
    //MARK: Interactor
    func setModule() {}
    func unsetModule() {}
    
    //MARK: Random
    func getFilters() {

        remote?.getFilters(response: { (data, error) -> (Void) in
            
        })
    }
    func getOpportunities() {
        remote?.getOpportunities(response: { (data, error) -> (Void) in
            if let array = data {
                self.presenter?.didRetrieve(opportunities: array)
                return
            }
        })
    }
}
