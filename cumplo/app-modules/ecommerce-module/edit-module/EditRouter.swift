//
//  EditRouter.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import weeKGKit

class EditRouter: EditProtocolRouter {
    
    var viewController: UIViewController?

    static func build(id: Int) -> UIViewController {
        let storyboard = UIStoryboard(name: "Edit", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "EditStoryBoard") as! EditProtocolView & UIViewController
        let presenter: EditProtocolPresenter & EditProtocolInteractorOutput = EditPresenter()
        let interactor: EditProtocolInteractorInput = EditInteractor(remote: EditFetch())
        let router: EditProtocolRouter = EditRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
    
    func dismissEditView() {
        viewController?.dismiss(animated: true, completion: nil)
    }
    func presentAlertController(withObject object: AlertEntity) {
        
        let alert = UIAlertController(title: object.title, message: object.message, preferredStyle: object.style)
        object.actions.forEach() { item in alert.addAction(item) }
        viewController?.present(alert, animated: true, completion: nil)
    }
}
