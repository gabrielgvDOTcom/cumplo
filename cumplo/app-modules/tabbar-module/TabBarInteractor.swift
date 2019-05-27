//
//  TabBarInteractor.swift
//  TabBar
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import Foundation

class TabBarInteractor: TabBarProtocolInteractorInput {
    
    //MARK: - VARs
    var presenter: TabBarProtocolInteractorOutput?
    var remote: TabBarProtocolFetchInput?
    
    //MARK: - Init
    init(remote: TabBarProtocolFetchInput) {
        self.remote = remote
    }
    
    //MARK: - Functions
    //MARK: Interactor
    func setModule() {}
    func unsetModule() {}
    
    //MARK: Random
    func getTabs() {
        remote?.getTabs(response: { (data, error) -> (Void) in
            if let array = data {
                self.presenter?.didRetrieve(tabs: array)
                return
            }
        })
    }
}
