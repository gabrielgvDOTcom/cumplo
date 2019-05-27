//
//  AccountRouter.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class AccountRouter: AccountProtocolRouter {
    
    var viewController: UIViewController?
    
    static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Account", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "AccountStoryBoard") as! AccountProtocolView & UIViewController
        let presenter: AccountProtocolPresenter & AccountProtocolInteractorOutput = AccountPresenter()
        let interactor: AccountProtocolInteractorInput = AccountInteractor(remote: AccountFetch())
        let router: AccountProtocolRouter = AccountRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
