//
//  OpportunityPresenter.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import Foundation

class OpportunityPresenter: OpportunityProtocolPresenter {
    
    //MARK: - VARs
    var view: OpportunityProtocolView?
    var router: OpportunityProtocolRouter?
    var interactor: OpportunityProtocolInteractorInput?
    
    //MARK: - Init
    init() {}
    
    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad() {
        view?.style()
        view?.title(str: "Oportunidades")

        view?.load(message: nil)
        interactor?.getFilters()
        interactor?.getOpportunities()
    }
    func viewWillAppear() {}
    func viewDidAppear() {
        interactor?.setModule()
    }
    func viewWillDisappear() {
        interactor?.unsetModule()
    }
    func viewDidDisappear() {}
    
    //MARK: Transition
    func presentFilterView() {
        router?.presentFilterView()
    }
    func pushPreviewView(opportunity: OpportunityEntity) {
        router?.pushToPreviewView(withData: opportunity)
    }
    
    //MARK: Random
    func getOpportunities() {
        view?.load(message: nil)
    }
}
extension OpportunityPresenter: OpportunityProtocolInteractorOutput {

    //MARK: - Functions
    //MARK: Random
    func scrollView(moveTo inset: UIEdgeInsets) {
        view?.keyboard(inset: inset)
    }

    //MARK: Data
    func didRetrieve(filters data: [FilterEntity]) {
        view?.resume()
        view?.deliver(filters: data)
    }
    func didRetrieve(opportunities data: [OpportunityEntity]) {
        view?.resume()
        view?.deliver(opportunities: data)
    }
    func didRetrieve(viewWithTitle title: String, andMessage message: String) {
        view?.resume()
        view?.message(viewWithTitle: title, andMessage: message)
    }
    func didRetrieve(alertWithTitle title: String, andMessage message: String) {
        view?.resume()
    }
}
