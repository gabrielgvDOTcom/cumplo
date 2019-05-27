//
//  LoginRouter.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class LoginRouter: LoginProtocolRouter {
    
    var viewController: UIViewController?

    class func build() -> UIViewController {

        let storyboard = UIStoryboard(name: "Login", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "LoginStoryBoard") as! LoginProtocolView & UIViewController
        let presenter: LoginProtocolPresenter & LoginProtocolInteractorOutput = LoginPresenter()
        let interactor: LoginProtocolInteractorInput = LoginInteractor(remote: LoginFetch())
        let router: LoginProtocolRouter = LoginRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }

    func pushToTabBarView() {
        viewController?.navigationController?.pushViewController(TabBarRouter.build(), animated: true)
    }
    func pushToRegisterView() {
        viewController?.navigationController?.pushViewController(RegisterRouter.build(), animated: true)
    }
    func presentAlertController(withObject object: AlertEntity) {

        let alert = UIAlertController(title: object.title, message: object.message, preferredStyle: object.style)
        object.actions.forEach() { item in alert.addAction(item) }
        viewController?.present(alert, animated: true, completion: nil)
    }
}
