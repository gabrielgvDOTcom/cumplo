//
//  SimulateProtocol.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

protocol SimulateProtocolView: class {

    //MARK: - VARs
    var presenter: SimulateProtocolPresenter? { get set }

    //MARK: - Functions
    //MARK: Data
    func deliver(array data: NSArray)
    
    //MARK: Random
    func resume()
    func load(message: String?)

    func style()
    func title(str: String)
}
protocol SimulateProtocolInteractorInput: class {

    //MARK: - Init
    var presenter: SimulateProtocolInteractorOutput? { get set }
    var remote: SimulateProtocolFetchInput? { get set }

    //MARK: - Functions
    //MARK: Interactor
    func setModule()
    func unsetModule()

    //MARK: Random
}
protocol SimulateProtocolInteractorOutput: class {

    func didRetrieve(viewWithTitle title: String, andMessage message: String)
    func didRetrieve(alertWithTitle title: String, andMessage message: String)
}
protocol SimulateProtocolPresenter: class {

    //MARK: - Init
    var view: SimulateProtocolView? { get set }
    var router: SimulateProtocolRouter? { get set }
    var interactor: SimulateProtocolInteractorInput? { get set }

    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
    
    //MARK: Random
}
protocol SimulateProtocolRouter: class {
    
    var viewController: UIViewController? { get set }
}
protocol SimulateProtocolFetchInput {

    
}
