//
//  PreOrderPresenter.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import weeKGKit
import Foundation

class PreOrderPresenter: PreOrderProtocolPresenter {

    //MARK: - VARs
    var view: PreOrderProtocolView?
    var router: PreOrderProtocolRouter?
    var interactor: PreOrderProtocolInteractorInput?

    //MARK: - Init
    init() {}

    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad() {
        view?.style()
        view?.title(str: "Revisar Orden")
    }
    func viewWillAppear() {}
    func viewDidAppear() {
        interactor?.setModule()
    }
    func viewWillDisappear() {
        interactor?.unsetModule()
    }
    func viewDidDisappear() {}

    //MARK: Transition
    func pushOrderAccount() {
        router?.pushToOrderAccountView()
    }
}
extension PreOrderPresenter: PreOrderProtocolInteractorOutput {

    func didRetrieve(viewWithTitle title: String, andMessage message: String) {
        view?.resume()
        view?.message(viewWithTitle: title, andMessage: message)
    }
    func didRetrieve(alertWithTitle title: String, andMessage message: String) {
        view?.resume()
    }
}
