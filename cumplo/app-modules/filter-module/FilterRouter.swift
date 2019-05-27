//
//  FilterRouter.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

class FilterRouter: FilterProtocolRouter {
    
    var viewController: UIViewController?
    
    static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Filter", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "FilterStoryBoard") as! FilterProtocolView & UIViewController
        let presenter: FilterProtocolPresenter & FilterProtocolInteractorOutput = FilterPresenter()
        let interactor: FilterProtocolInteractorInput = FilterInteractor(remote: FilterFetch())
        let router: FilterProtocolRouter = FilterRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    func dismissFilterView() {
        viewController?.dismiss(animated: true, completion: nil)
    }
    func presentAlertController(_ object: AlertEntity) {
        if let view = viewController {
            let alert = UIAlertController(title: object.title, message: object.message, preferredStyle: object.style)
            object.actions.forEach() { item in alert.addAction(item) }
            view.present(alert, animated: true, completion: nil)
        }
    }
}
