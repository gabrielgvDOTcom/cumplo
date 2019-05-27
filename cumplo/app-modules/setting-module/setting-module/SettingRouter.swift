//
//  SettingRouter.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
class SettingRouter: SettingProtocolRouter {
    
    var viewController: UIViewController?
    
    static func build() -> UIViewController {
        let storyboard = UIStoryboard(name: "Setting", bundle: Bundle.main)
        let view = storyboard.instantiateViewController(withIdentifier: "SettingStoryBoard") as! SettingProtocolView & UIViewController
        let presenter: SettingProtocolPresenter & SettingProtocolInteractorOutput = SettingPresenter()
        let interactor: SettingProtocolInteractorInput = SettingInteractor(remote: SettingFetch())
        let router: SettingProtocolRouter = SettingRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
