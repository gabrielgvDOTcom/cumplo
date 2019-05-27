//
//  PreviewPresenter.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import Foundation

class PreviewPresenter: PreviewProtocolPresenter {
    
    //MARK: - VARs
    var opportunity: OpportunityEntity?
    
    var view: PreviewProtocolView?
    var router: PreviewProtocolRouter?
    var interactor: PreviewProtocolInteractorInput?
    
    //MARK: - Init
    init() {}
    
    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad() {
        view?.style()
        view?.deliver(opportunity: opportunity!)
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
    func pushTo() {
        
    }
}
extension PreviewPresenter: PreviewProtocolInteractorOutput {

    func didRetrieve(viewWithTitle title: String, andMessage message: String) {
        view?.resume()
        view?.message(viewWithTitle: title, andMessage: message)
    }
    func didRetrieve(alertWithTitle title: String, andMessage message: String) {
        view?.resume()
    }
}
