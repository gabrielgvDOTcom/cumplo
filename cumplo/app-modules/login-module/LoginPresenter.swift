//
//  LoginPresenter.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import Foundation

class LoginPresenter: LoginProtocolPresenter {
    
    //MARK: - VARs
    var view: LoginProtocolView?
    var router: LoginProtocolRouter?
    var interactor: LoginProtocolInteractorInput?
    
    //MARK: - Init
    init() {}
    
    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad() {
        view?.style()
    }
    func viewWillAppear() {
        view?.navigation(show: false)
    }
    func viewDidAppear() {
        interactor?.setModule()
    }
    func viewWillDisappear() {
        interactor?.unsetModule()
        view?.navigation(show: true)
    }
    func viewDidDisappear() {}
    
    //MARK: Transition
    func pushToRegisterView() {
        router?.pushToRegisterView()
    }
    func pushToOpportunityView() {
        router?.pushToTabBarView()
    }

    //MARK: Random
    func login(email: String, password: String) {
        let form: [[String : Any]] = [
            ["field": email, "label": "correo electrónico", "rules": ["required", "valid_email"]],
            ["field": password, "label": "contraseña", "rules": ["required", "min_length=6"]],
        ]
        FGForm(form: form).validate { (response) in
            if let error = response as? NSError {
                self.didRetrieve(alertWithTitle: "Formulario", andMessage: error.localizedDescription)
                return
            }
            self.view?.load(message: nil)
            self.interactor?.login(request: LoginRequest(email: email, password: password))
        }
    }
}
extension LoginPresenter: LoginProtocolInteractorOutput {

    func scrollView(moveTo inset: UIEdgeInsets) {
        view?.keyboard(inset: inset)
    }

    func didRetrieve(user data: UserEntity) {
        view?.resume()
        router?.pushToTabBarView()
    }
    func didRetrieve(alertWithTitle title: String, andMessage message: String) {
        view?.resume()
        view?.resume()
        router?.presentAlertController(withObject: AlertEntity(
            title: title,
            message: message,
            style: .alert,
            actions: [UIAlertAction(title: "Aceptar", style: .default, handler: nil)]
        ))
    }
}
