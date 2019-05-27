//
//  InvestorsRouter.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import weeKGKit

class InvestorsRouter: InvestorsProtocolRouter {
    
    var viewController: UIViewController?

    static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Investors", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "InvestorsStoryBoard") as! InvestorsProtocolView & UIViewController
        let presenter: InvestorsProtocolPresenter & InvestorsProtocolInteractorOutput = InvestorsPresenter()
        let interactor: InvestorsProtocolInteractorInput = InvestorsInteractor(remote: InvestorsFetch())
        let router: InvestorsProtocolRouter = InvestorsRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
