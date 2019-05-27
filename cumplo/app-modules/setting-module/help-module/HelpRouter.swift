//
//  HelpRouter.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class HelpRouter: HelpProtocolRouter {
    
    var viewController: UIViewController?
    
    static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Help", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "HelpStoryBoard") as! HelpProtocolView & UIViewController
        let presenter: HelpProtocolPresenter & HelpProtocolInteractorOutput = HelpPresenter()
        let interactor: HelpProtocolInteractorInput = HelpInteractor(remote: HelpFetch())
        let router: HelpProtocolRouter = HelpRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
