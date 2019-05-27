//
//  PreOrderProtocol.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

protocol PreOrderProtocolView: class {

    //MARK: - VARs
    var presenter: PreOrderProtocolPresenter? { get set }

    //MARK: - Functions
    //MARK: Data
    func deliver(array data: NSArray)
    
    //MARK: Random
    func resume()
    func load(message: String?)

    func style()
    func title(str: String)
    func message(viewWithTitle title: String, andMessage message: String)
}
protocol PreOrderProtocolInteractorInput: class {

    //MARK: - Init
    var presenter: PreOrderProtocolInteractorOutput? { get set }
    var remote: PreOrderProtocolFetchInput? { get set }

    //MARK: - Functions
    //MARK: Interactor
    func setModule()
    func unsetModule()

    //MARK: Random
}
protocol PreOrderProtocolInteractorOutput: class {

    func didRetrieve(viewWithTitle title: String, andMessage message: String)
    func didRetrieve(alertWithTitle title: String, andMessage message: String)
}
protocol PreOrderProtocolPresenter: class {

    //MARK: - Init
    var view: PreOrderProtocolView? { get set }
    var router: PreOrderProtocolRouter? { get set }
    var interactor: PreOrderProtocolInteractorInput? { get set }

    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
    
    //MARK: Transition
    func pushOrderAccount()
}
protocol PreOrderProtocolRouter: class {
    
    var viewController: UIViewController? { get set }

    func pushToOrderAccountView()
}
protocol PreOrderProtocolFetchInput {

    
}
