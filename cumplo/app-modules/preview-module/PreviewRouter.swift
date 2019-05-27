//
//  PreviewRouter.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class PreviewRouter: PreviewProtocolRouter {
    
    var viewController: UIViewController?
    
    static func build(opportunity: OpportunityEntity) -> UIViewController {
        let storyboard = UIStoryboard(name: "Preview", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "PreviewStoryBoard") as! PreviewProtocolView & UIViewController
        let presenter: PreviewProtocolPresenter & PreviewProtocolInteractorOutput = PreviewPresenter()
        let interactor: PreviewProtocolInteractorInput = PreviewInteractor(remote: PreviewFetch())
        let router: PreviewProtocolRouter = PreviewRouter()
        
        view.presenter = presenter
        presenter.opportunity = opportunity
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }

    func pushToInvestorsView() {
        viewController?.navigationController?.pushViewController(InvestorsRouter.build(), animated: true)
    }
}
