//
//  HelpInteractor.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import Foundation

class HelpInteractor: HelpProtocolInteractorInput {
    
    //MARK: - VARs
    var presenter: HelpProtocolInteractorOutput?
    var remote: HelpProtocolFetchInput?
    
    //MARK: - Init
    init(remote: HelpProtocolFetchInput) {
        self.remote = remote
    }
    
    //MARK: - Functions
    //MARK: Interactor
    func setModule() {}
    func unsetModule() {}
    
    //MARK: Random
    func getSettings() {
        remote?.getSettings(response: { (data, array) -> (Void) in
            if let array = data {
                self.presenter?.didRetrieve(helpSettings: array)
                return
            }
        })
    }
}
