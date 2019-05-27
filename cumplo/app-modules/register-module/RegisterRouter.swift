//
//  RegisterRouter.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class RegisterRouter: RegisterProtocolRouter {
    
    var viewController: UIViewController?

    static func build() -> UIViewController {

        let storyboard = UIStoryboard(name: "Register", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "RegisterStoryBoard") as! RegisterProtocolView & UIViewController
        let presenter: RegisterProtocolPresenter & RegisterProtocolInteractorOutput = RegisterPresenter()
        let interactor: RegisterProtocolInteractorInput = RegisterInteractor(remote: RegisterFetch())
        let router: RegisterProtocolRouter = RegisterRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }

    func pushToTabbarView() {
        viewController?.navigationController?.pushViewController(TabBarRouter.build(), animated: true)
    }
    func presentAlertController(withObject object: AlertEntity) {
        
        let alert = UIAlertController(title: object.title, message: object.message, preferredStyle: object.style)
        object.actions.forEach() { item in alert.addAction(item) }
        viewController?.present(alert, animated: true, completion: nil)
    }
}
