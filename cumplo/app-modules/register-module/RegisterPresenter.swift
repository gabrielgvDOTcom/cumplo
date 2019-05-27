//
//  RegisterPresenter.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import Foundation

class RegisterPresenter: RegisterProtocolPresenter {
    
    //MARK: - VARs
    var view: RegisterProtocolView?
    var router: RegisterProtocolRouter?
    var interactor: RegisterProtocolInteractorInput?
    
    //MARK: - Init
    init() {}
    
    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad() {
        view?.style()
        view?.title(str: "Crear Cuenta")
        interactor?.createForm()
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
extension RegisterPresenter: RegisterProtocolInteractorOutput {

    func scrollView(moveTo inset: UIEdgeInsets) {
        view?.keyboard(inset: inset)
    }

    func didRetrieve(form data: [RegisterEntity]) {
        view?.resume()
        view?.deliver(form: data)
    }
    func didRetrieve(viewWithTitle title: String, andMessage message: String) {
        view?.resume()
        view?.message(viewWithTitle: title, andMessage: message)
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
