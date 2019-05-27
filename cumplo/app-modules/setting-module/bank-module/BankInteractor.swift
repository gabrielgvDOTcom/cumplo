//
//  BankInteractor.swift
//  weeKGBank
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import Foundation

class BankInteractor: BankProtocolInteractorInput {

    //MARK: - VARs
    var presenter: BankProtocolInteractorOutput?
    var remote: BankProtocolFetchInput?

    //MARK: - Init
    init(remote: BankProtocolFetchInput) {
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
                self.presenter?.didRetrieve(bankSettings: array)
                return
            }
        })
    }
}
