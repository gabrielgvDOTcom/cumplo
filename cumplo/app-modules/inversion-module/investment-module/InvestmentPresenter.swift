//
//  InvestmentPresenter.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import Foundation

class InvestmentPresenter: InvestmentProtocolPresenter {
    
    //MARK: - VARs
    var view: InvestmentProtocolView?
    var router: InvestmentProtocolRouter?
    var interactor: InvestmentProtocolInteractorInput?
    
    //MARK: - Init
    init() {}
    
    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad() {
        view?.style()
        view?.title(str: "Listado de Inversionistas")
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
extension InvestmentPresenter: InvestmentProtocolInteractorOutput {

    func didRetrieve(viewWithTitle title: String, andMessage message: String) {
        view?.resume()
    }
    func didRetrieve(alertWithTitle title: String, andMessage message: String) {
        view?.resume()
    }
}
