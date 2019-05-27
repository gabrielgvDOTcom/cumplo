//
//  OrderAccountInteractor.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import Foundation

class OrderAccountInteractor: OrderAccountProtocolInteractorInput {
    
    //MARK: - VARs
    var presenter: OrderAccountProtocolInteractorOutput?
    var remote: OrderAccountProtocolFetchInput?
    
    //MARK: - Init
    init(remote: OrderAccountProtocolFetchInput) {
        self.remote = remote
    }

    //MARK: - Functions
    //MARK: Interactor
    func setModule() {}
    func unsetModule() {}

    //MARK: Random
    func getAccounts() {
        remote?.getAccounts(response: { (data, error) -> (Void) in
            if let array = data {
                self.presenter?.didRetrieve(accounts: array)
                return
            }
        })
    }
    func orderStart(accountSelected account: BankAccountEntity?) {
        
    }
}
