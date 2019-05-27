//
//  BankRouter.swift
//  weeKGBank
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class BankRouter: BankProtocolRouter {
    
    var viewController: UIViewController?
    
    static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Bank", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "BankStoryBoard") as! BankProtocolView & UIViewController
        let presenter: BankProtocolPresenter & BankProtocolInteractorOutput = BankPresenter()
        let interactor: BankProtocolInteractorInput = BankInteractor(remote: BankFetch())
        let router: BankProtocolRouter = BankRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
