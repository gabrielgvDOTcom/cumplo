//
//  PreviewProtocol.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

protocol PreviewProtocolView: class {

    //MARK: - VARs
    var presenter: PreviewProtocolPresenter? { get set }

    //MARK: - Functions
    //MARK: Data
    func deliver(opportunity data: OpportunityEntity)

    //MARK: Random
    func resume()
    func load(message: String?)

    func style()
    func message(viewWithTitle title: String, andMessage message: String)
}
protocol PreviewProtocolInteractorInput: class {

    //MARK: - Init
    var presenter: PreviewProtocolInteractorOutput? { get set }
    var remote: PreviewProtocolFetchInput? { get set }

    //MARK: - Functions
    //MARK: Interactor
    func setModule()
    func unsetModule()

    //MARK: Random
}
protocol PreviewProtocolInteractorOutput: class {

    func didRetrieve(viewWithTitle title: String, andMessage message: String)
    func didRetrieve(alertWithTitle title: String, andMessage message: String)
}
protocol PreviewProtocolPresenter: class {

    //MARK: - Init
    var opportunity: OpportunityEntity? { get set }
    
    var view: PreviewProtocolView? { get set }
    var router: PreviewProtocolRouter? { get set }
    var interactor: PreviewProtocolInteractorInput? { get set }

    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
    
    //MARK: - Random
    func pushTo()
}
protocol PreviewProtocolRouter: class {
    
    var viewController: UIViewController? { get set }
    
    func pushToInvestorsView()
}
protocol PreviewProtocolFetchInput {
    
    
}
