//
//  OpportunityProtocol.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

protocol OpportunityProtocolView: class {

    //MARK: - VARs
    var presenter: OpportunityProtocolPresenter? { get set }

    //MARK: - Functions
    //MARK: Data
    func deliver(filters data: [FilterEntity])
    func deliver(opportunities data: [OpportunityEntity])

    //MARK: Random
    func resume()
    func load(message: String?)

    func style()
    func title(str: String)
    func message(viewWithTitle title: String, andMessage message: String)
}
protocol OpportunityProtocolInteractorInput: class {

    var presenter: OpportunityProtocolInteractorOutput? { get set }
    var remote: OpportunityProtocolFetchInput? { get set }

    //MARK: - Functions
    func setModule()
    func unsetModule()

    //MARK: Random
    func getFilters()
    func getOpportunities()
}
protocol OpportunityProtocolInteractorOutput: class {

    func didRetrieve(filters data: [FilterEntity])
    func didRetrieve(opportunities data: [OpportunityEntity])
    func didRetrieve(viewWithTitle title: String, andMessage message: String)
    func didRetrieve(alertWithTitle title: String, andMessage message: String)
}
protocol OpportunityProtocolPresenter: class {

    //MARK: - Init
    var view: OpportunityProtocolView? { get set }
    var router: OpportunityProtocolRouter? { get set }
    var interactor: OpportunityProtocolInteractorInput? { get set }

    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()

    //MARK: Transition
    func presentFilterView()
    func pushPreviewView(opportunity: OpportunityEntity)
    
    //MARK: Random
    func getOpportunities()
}
protocol OpportunityProtocolRouter: class {
    
    var viewController: UIViewController? { get set }

    func presentFilterView()
    func presentAlertController(withObject object: AlertEntity)
    func pushToPreviewView(withData opportunity: OpportunityEntity)
}
protocol OpportunityProtocolFetchInput {
    
    func getFilters(response: @escaping (_ data: [FilterEntity]?, _ error: NSError?) -> (Void))
    func getOpportunities(response: @escaping (_ data: [OpportunityEntity]?, _ error: NSError?) -> (Void))
}
