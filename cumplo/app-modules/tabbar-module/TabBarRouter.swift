//
//  TabBarRouter.swift
//  TabBar
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class TabBarRouter: TabBarProtocolRouter {
    
    var viewController: UIViewController?
    
    static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "TabBar", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "TabBarStoryBoard") as! TabBarProtocolView & UIViewController
        let presenter: TabBarProtocolPresenter & TabBarProtocolInteractorOutput = TabBarPresenter()
        let interactor: TabBarProtocolInteractorInput = TabBarInteractor(remote: TabBarFetch())
        let router: TabBarProtocolRouter = TabBarRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }

    func pushEcommerceView() {
        viewController?.navigationController?.pushViewController(EcommerceRouter.build(), animated: true)
    }
    func presentFilterView() {
        let navigation = UINavigationController(rootViewController: FilterRouter.build())
        navigation.modalPresentationStyle = .overFullScreen
        viewController?.navigationController?.present(navigation, animated: true, completion: nil)
    }
}
