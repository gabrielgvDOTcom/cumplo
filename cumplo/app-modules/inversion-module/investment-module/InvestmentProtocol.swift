//
//  InvestmentProtocol.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

protocol InvestmentProtocolView: class {

    //MARK: - VARs
    var presenter: InvestmentProtocolPresenter? { get set }

    //MARK: - Functions
    //MARK: Data
    func deliver(array data: NSArray)
    
    //MARK: Random
    func resume()
    func load(message: String?)

    func style()
    func title(str: String)
}
protocol InvestmentProtocolInteractorInput: class {

    //MARK: - Init
    var presenter: InvestmentProtocolInteractorOutput? { get set }
    var remote: InvestmentProtocolFetchInput? { get set }

    //MARK: - Functions
    //MARK: Interactor
    func setModule()
    func unsetModule()

    //MARK: Random
}
protocol InvestmentProtocolInteractorOutput: class {

    func didRetrieve(viewWithTitle title: String, andMessage message: String)
    func didRetrieve(alertWithTitle title: String, andMessage message: String)
}
protocol InvestmentProtocolPresenter: class {

    //MARK: - Init
    var view: InvestmentProtocolView? { get set }
    var router: InvestmentProtocolRouter? { get set }
    var interactor: InvestmentProtocolInteractorInput? { get set }

    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
    
    //MARK: Random
}
protocol InvestmentProtocolRouter: class {
    
    var viewController: UIViewController? { get set }
}
protocol InvestmentProtocolFetchInput {

    
}
