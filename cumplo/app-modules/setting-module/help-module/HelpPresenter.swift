//
//  HelpPresenter.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import Foundation

class HelpPresenter: HelpProtocolPresenter {
    
    //MARK: - VARs
    var view: HelpProtocolView?
    var router: HelpProtocolRouter?
    var interactor: HelpProtocolInteractorInput?
    
    //MARK: - Init
    init() {}
    
    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad() {
        view?.style()
        interactor?.getSettings()
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
extension HelpPresenter: HelpProtocolInteractorOutput {

    func didRetrieve(helpSettings data: [HelpEntity]) {
        view?.resume()
        view?.deliver(helpSettings: data)
    }
    func didRetrieve(alertWithTitle title: String, andMessage message: String) {
        view?.resume()
    }
}
