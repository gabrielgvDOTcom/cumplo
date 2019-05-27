//
//  InvestmentRouter.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import weeKGKit

class InvestmentRouter: InvestmentProtocolRouter {
    
    var viewController: UIViewController?

    static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Investment", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "InvestmentStoryBoard") as! InvestmentProtocolView & UIViewController
        let presenter: InvestmentProtocolPresenter & InvestmentProtocolInteractorOutput = InvestmentPresenter()
        let interactor: InvestmentProtocolInteractorInput = InvestmentInteractor(remote: InvestmentFetch())
        let router: InvestmentProtocolRouter = InvestmentRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
