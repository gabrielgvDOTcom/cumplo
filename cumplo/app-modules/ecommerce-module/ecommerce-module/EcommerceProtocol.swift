//
//  EcommerceProtocol.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

protocol EcommerceProtocolView: class {

    //MARK: - VARs
    var presenter: EcommerceProtocolPresenter? { get set }

    //MARK: - Functions
    //MARK: Random
    func resume()
    func load(message: String?)

    func style()
    func title(str: String)
    func message(viewWithTitle title: String, andMessage message: String)
}
protocol EcommerceProtocolInteractorInput: class {

    //MARK: - Init
    var presenter: EcommerceProtocolInteractorOutput? { get set }
    var remote: EcommerceProtocolFetchInput? { get set }

    //MARK: - Functions
    func setModule()
    func unsetModule()

    //MARK: Random
}
protocol EcommerceProtocolInteractorOutput: class {

    func didRetrieve(viewWithTitle title: String, andMessage message: String)
    func didRetrieve(alertWithTitle title: String, andMessage message: String)
}
protocol EcommerceProtocolPresenter: class {

    //MARK: - Init
    var view: EcommerceProtocolView? { get set }
    var router: EcommerceProtocolRouter? { get set }
    var interactor: EcommerceProtocolInteractorInput? { get set }

    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
    
    //MARK: Transition
    func pushPreOrder()
    func presentEditView(id: Int)
}
protocol EcommerceProtocolRouter: class {
    
    var viewController: UIViewController? { get set }

    func pushToPreOrderView()
    func presentEditView(id: Int)
    func presentAlertController(withObject object: AlertEntity)
}
protocol EcommerceProtocolFetchInput {

    
}
