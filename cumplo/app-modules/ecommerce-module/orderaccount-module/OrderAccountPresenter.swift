//
//  OrderAccountPresenter.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import weeKGKit
import Foundation

class OrderAccountPresenter: OrderAccountProtocolPresenter {
    
    //MARK: - VARs
    var view: OrderAccountProtocolView?
    var router: OrderAccountProtocolRouter?
    var interactor: OrderAccountProtocolInteractorInput?
    
    //MARK: - Init
    init() {}
    
    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad() {
        view?.style()
        view?.title(str: "Proceso de Inversión Iniciado")
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
    func getAccounts() {
        
    }
    func orderStart(accountSelected account: BankAccountEntity?) {
        let form: [[String : Any]] = [
            ["field": account as Any, "label": "cuenta", "rules": ["required"]]
        ]
        FGForm(form: form).validate { (response) in
            if response is NSError {
                self.didRetrieve(alertWithTitle: "Aviso", andMessage: "Debes seleccionar al menos una cuenta de pago")
                return
            }
            self.view?.load(message: nil)
            self.interactor?.orderStart(accountSelected: account)
        }
    }
}
extension OrderAccountPresenter: OrderAccountProtocolInteractorOutput {

    func didRetrieve(accounts data: [BankAccountEntity]) {
        view?.resume()
        view?.deliver(accounts: data)
    }
    func didRetrieve(viewWithTitle title: String, andMessage message: String) {
        view?.resume()
        router?.presentErrorView()
    }
    func didRetrieve(alertWithTitle title: String, andMessage message: String) {
        view?.resume()
        router?.presentAlertController(withObject: AlertEntity(
            title: title,
            message: message,
            style: .alert,
            actions: [UIAlertAction(title: "Aceptar", style: .default, handler: nil)]
        ))
    }
}
