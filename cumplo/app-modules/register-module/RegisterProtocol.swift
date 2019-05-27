//
//  RegisterProtocol.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

protocol RegisterProtocolView: class {

    //MARK: - VARs
    var presenter: RegisterProtocolPresenter? { get set }

    //MARK: - Functions
    //MARK: Data
    func deliver(form data: [RegisterEntity])
    
    //MARK: Random
    func resume()
    func load(message: String?)

    func style()
    func endediting()
    func title(str: String)
    func keyboard(inset: UIEdgeInsets)
    func navigation(show status: Bool)
    func message(viewWithTitle title: String, andMessage message: String)
}
protocol RegisterProtocolInteractorInput: class {

    //MARK: - Init
    var presenter: RegisterProtocolInteractorOutput? { get set }
    var remote: RegisterProtocolFetchInput? { get set }

    //MARK: - Functions
    func setModule()
    func unsetModule()

    //MARK: Random
    func createForm()
}
protocol RegisterProtocolInteractorOutput: class {

    func scrollView(moveTo inset: UIEdgeInsets)

    func didRetrieve(form data: [RegisterEntity])
    func didRetrieve(viewWithTitle title: String, andMessage message: String)
    func didRetrieve(alertWithTitle title: String, andMessage message: String)
}
protocol RegisterProtocolPresenter: class {

    //MARK: - Init
    var view: RegisterProtocolView? { get set }
    var router: RegisterProtocolRouter? { get set }
    var interactor: RegisterProtocolInteractorInput? { get set }

    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
    
    //MARK: Transition
}
protocol RegisterProtocolRouter: class {
    
    var viewController: UIViewController? { get set }

    func pushToTabbarView()
    func presentAlertController(withObject object: AlertEntity)
}
protocol RegisterProtocolFetchInput {

    
}
