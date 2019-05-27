//
//  AccountPresenter.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import Foundation

class AccountPresenter: AccountProtocolPresenter {
    
    //MARK: - VARs
    var view: AccountProtocolView?
    var router: AccountProtocolRouter?
    var interactor: AccountProtocolInteractorInput?
    
    //MARK: - Init
    init() {}
    
    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad() {
        view?.style()
        interactor?.getSettings()
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
extension AccountPresenter: AccountProtocolInteractorOutput {

    func scrollView(moveTo inset: UIEdgeInsets) {
        view?.keyboard(inset: inset)
    }

    func didRetrieve(accountSettings data: [AccountEntity]) {
        view?.resume()
        view?.deliver(accountSettings: data)
    }
    func didRetrieve(alertWithTitle title: String, andMessage message: String) {
        view?.resume()
    }
}
