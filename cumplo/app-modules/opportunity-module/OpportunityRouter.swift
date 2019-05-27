//
//  OpportunityRouter.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class OpportunityRouter: OpportunityProtocolRouter {
    
    var viewController: UIViewController?
    
    static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Opportunity", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "OpportunityStoryBoard") as! OpportunityProtocolView & UIViewController
        let presenter: OpportunityProtocolPresenter & OpportunityProtocolInteractorOutput = OpportunityPresenter()
        let interactor: OpportunityProtocolInteractorInput = OpportunityInteractor(remote: OpportunityFetch())
        let router: OpportunityProtocolRouter = OpportunityRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    func presentFilterView() {
        let navigation = UINavigationController(rootViewController: FilterRouter.build())
        navigation.modalPresentationStyle = .overCurrentContext
        viewController?.present(navigation, animated: true, completion: nil)
    }
    func presentAlertController(withObject object: AlertEntity) {
        
    }
    func pushToPreviewView(withData opportunity: OpportunityEntity) {
        viewController?.navigationController?.pushViewController(PreviewRouter.build(opportunity: opportunity), animated: true)
    }
}
