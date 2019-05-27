//
//  BankPresenter.swift
//  weeKGBank
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import Foundation

class BankPresenter: BankProtocolPresenter {
    
    //MARK: - VARs
    var view: BankProtocolView?
    var router: BankProtocolRouter?
    var interactor: BankProtocolInteractorInput?
    
    //MARK: - Init
    init() {}
    
    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad() {
        view?.style()
        interactor?.getAccounts()
    }
    func viewWillAppear() {}
    func viewDidAppear() {
        interactor?.setModule()
    }
    func viewWillDisappear() {
        interactor?.unsetModule()
    }
    func viewDidDisappear() {}
    
    //MARK: Random
}
extension BankPresenter: BankProtocolInteractorOutput {

    func didRetrieve(bankSettings data: [BankEntity]) {
        view?.resume()
        view?.deliver(bankSettings: data)
    }
    func didRetrieve(alertWithTitle title: String, andMessage message: String) {
        view?.resume()
    }
}
