//
//  SimulateRouter.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import weeKGKit

class SimulateRouter: SimulateProtocolRouter {
    
    var viewController: UIViewController?

    static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Simulate", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "SimulateStoryBoard") as! SimulateProtocolView & UIViewController
        let presenter: SimulateProtocolPresenter & SimulateProtocolInteractorOutput = SimulatePresenter()
        let interactor: SimulateProtocolInteractorInput = SimulateInteractor(remote: SimulateFetch())
        let router: SimulateProtocolRouter = SimulateRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
