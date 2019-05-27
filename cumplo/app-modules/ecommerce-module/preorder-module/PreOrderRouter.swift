//
//  PreOrderRouter.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import weeKGKit

class PreOrderRouter: PreOrderProtocolRouter {
    
    var viewController: UIViewController?

    static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "PreOrder", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "PreOrderStoryBoard") as! PreOrderProtocolView & UIViewController
        let presenter: PreOrderProtocolPresenter & PreOrderProtocolInteractorOutput = PreOrderPresenter()
        let interactor: PreOrderProtocolInteractorInput = PreOrderInteractor(remote: PreOrderFetch())
        let router: PreOrderProtocolRouter = PreOrderRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }

    func pushToOrderAccountView() {
        viewController?.navigationController?.pushViewController(OrderAccountRouter.build(), animated: true)
    }
}
