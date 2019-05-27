//
//  EcommerceRouter.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class EcommerceRouter: EcommerceProtocolRouter {
    
    var viewController: UIViewController?
    
    static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Ecommerce", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "EcommerceStoryBoard") as! EcommerceProtocolView & UIViewController
        let presenter: EcommerceProtocolPresenter & EcommerceProtocolInteractorOutput = EcommercePresenter()
        let interactor: EcommerceProtocolInteractorInput = EcommerceInteractor(remote: EcommerceFetch())
        let router: EcommerceProtocolRouter = EcommerceRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    func pushToPreOrderView() {
        viewController?.navigationController?.pushViewController(PreOrderRouter.build(), animated: true)
    }
    func presentEditView(id: Int) {
        let navigation = UINavigationController(rootViewController: EditRouter.build(id: id))
        navigation.modalPresentationStyle = .overFullScreen
        viewController?.navigationController?.present(navigation, animated: true, completion: nil)
    }
    func presentAlertController(withObject object: AlertEntity) {
        
        let alert = UIAlertController(title: object.title, message: object.message, preferredStyle: object.style)
        object.actions.forEach() { item in alert.addAction(item) }
        viewController?.present(alert, animated: true, completion: nil)
    }
}
