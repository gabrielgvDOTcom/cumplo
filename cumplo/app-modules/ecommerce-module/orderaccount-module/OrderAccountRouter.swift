//
//  OrderAccountRouter.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import weeKGKit

class OrderAccountRouter: OrderAccountProtocolRouter {

    var viewController: UIViewController?

    static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "OrderAccount", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "OrderAccountStoryBoard") as! OrderAccountProtocolView & UIViewController
        let presenter: OrderAccountProtocolPresenter & OrderAccountProtocolInteractorOutput = OrderAccountPresenter()
        let interactor: OrderAccountProtocolInteractorInput = OrderAccountInteractor(remote: OrderAccountFetch())
        let router: OrderAccountProtocolRouter = OrderAccountRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }

    func presentErrorView() {
        
    }
    func presentAlertController(withObject object: AlertEntity) {

        let alert = UIAlertController(title: object.title, message: object.message, preferredStyle: object.style)
        object.actions.forEach() { item in alert.addAction(item) }
        viewController?.present(alert, animated: true, completion: nil)
    }
}
