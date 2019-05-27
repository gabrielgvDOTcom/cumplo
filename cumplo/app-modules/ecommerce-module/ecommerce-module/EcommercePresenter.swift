//
//  EcommercePresenter.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import Foundation

class EcommercePresenter: EcommerceProtocolPresenter {

    //MARK: - VARs
    var view: EcommerceProtocolView?
    var router: EcommerceProtocolRouter?
    var interactor: EcommerceProtocolInteractorInput?
    
    //MARK: - Init
    init() {}
    
    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad() {
        view?.style()
        view?.title(str: "Carro de Inversión")
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
    func pushPreOrder() {
        router?.pushToPreOrderView()
    }
    func presentEditView(id: Int) {
        router?.presentEditView(id: id)
    }
}
extension EcommercePresenter: EcommerceProtocolInteractorOutput {

    func didRetrieve(viewWithTitle title: String, andMessage message: String) {
        view?.resume()
        view?.message(viewWithTitle: title, andMessage: message)
    }
    func didRetrieve(alertWithTitle title: String, andMessage message: String) {
        view?.resume()
    }
}
