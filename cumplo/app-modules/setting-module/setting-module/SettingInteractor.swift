//
//  SettingInteractor.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import Foundation

class SettingInteractor: SettingProtocolInteractorInput {
    
    //MARK: - VARs
    var presenter: SettingProtocolInteractorOutput?
    var remote: SettingProtocolFetchInput?
    
    //MARK: - Init
    init(remote: SettingProtocolFetchInput) {
        self.remote = remote
    }
    
    //MARK: - Functions
    //MARK: Interactor
    func setModule() {}
    func unsetModule() {}
    
    //MARK: Random
    func getModules() {
        remote?.getModules(response: { (data, error) -> (Void) in
            if let array = data {
                self.presenter?.didRetrieve(modules: array)
                return
            }
        })
    }
}
