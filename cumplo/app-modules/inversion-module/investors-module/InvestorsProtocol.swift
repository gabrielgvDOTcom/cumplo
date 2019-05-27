//
//  InvestorsProtocol.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

protocol InvestorsProtocolView: class {

    //MARK: - VARs
    var presenter: InvestorsProtocolPresenter? { get set }

    //MARK: - Functions
    //MARK: Data
    func deliver(array data: NSArray)
    
    //MARK: Random
    func resume()
    func load(message: String?)

    func style()
    func title(str: String)
}
protocol InvestorsProtocolInteractorInput: class {

    //MARK: - Init
    var presenter: InvestorsProtocolInteractorOutput? { get set }
    var remote: InvestorsProtocolFetchInput? { get set }

    //MARK: - Functions
    //MARK: Interactor
    func setModule()
    func unsetModule()

    //MARK: Random
}
protocol InvestorsProtocolInteractorOutput: class {

    func didRetrieve(viewWithTitle title: String, andMessage message: String)
    func didRetrieve(alertWithTitle title: String, andMessage message: String)
}
protocol InvestorsProtocolPresenter: class {

    //MARK: - Init
    var view: InvestorsProtocolView? { get set }
    var router: InvestorsProtocolRouter? { get set }
    var interactor: InvestorsProtocolInteractorInput? { get set }

    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
    
    //MARK: Random
}
protocol InvestorsProtocolRouter: class {
    
    var viewController: UIViewController? { get set }
}
protocol InvestorsProtocolFetchInput {

    
}
