//
//  SettingPresenter.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import Foundation

class SettingPresenter: SettingProtocolPresenter {
    
    //MARK: - VARs
    var view: SettingProtocolView?
    var router: SettingProtocolRouter?
    var interactor: SettingProtocolInteractorInput?
    
    //MARK: - Init
    init() {}
    
    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad() {
        view?.style()
        view?.title(str: "Cuenta")
        interactor?.getModules()
    }
    func viewWillAppear() {}
    func viewDidAppear() {
        interactor?.setModule()
    }
    func viewWillDisappear() {
        interactor?.unsetModule()
    }
    func viewDidDisappear() {}
    
    //MARK: Random
}
extension SettingPresenter: SettingProtocolInteractorOutput {

    func didRetrieve(modules data: [PageEntity]) {
        view?.deliver(modules: data)
        view?.deliver(pageView: FGPage())
    }
}
