//
//  LoginProtocol.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

protocol LoginProtocolView: class {

    //MARK: - VARs
    var presenter: LoginProtocolPresenter? { get set }

    //MARK: - Functions
    //MARK: Random
    func resume()
    func load(message: String?)

    func style()
    func endediting()
    func keyboard(inset: UIEdgeInsets)
    func navigation(show status: Bool)
}
protocol LoginProtocolInteractorInput: class {

    //MARK: - Init
    var presenter: LoginProtocolInteractorOutput? { get set }
    var remote: LoginProtocolFetchInput? { get set }

    //MARK: - Functions
    func setModule()
    func unsetModule()

    //MARK: Random
    func login(request: LoginRequest)
}
protocol LoginProtocolInteractorOutput: class {

    
    func scrollView(moveTo inset: UIEdgeInsets)

    func didRetrieve(user data: UserEntity)
    func didRetrieve(alertWithTitle title: String, andMessage message: String)
}
protocol LoginProtocolPresenter: class {

    //MARK: - Init
    var view: LoginProtocolView? { get set }
    var router: LoginProtocolRouter? { get set }
    var interactor: LoginProtocolInteractorInput? { get set }

    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
    
    //MARK: Transition
    func pushToRegisterView()
    func pushToOpportunityView()
    
    //MARK: Random
    func login(email: String, password: String)
}
protocol LoginProtocolRouter: class {

    var viewController: UIViewController? { get set }

    func pushToTabBarView()
    func pushToRegisterView()
    func presentAlertController(withObject object: AlertEntity)
}
protocol LoginProtocolFetchInput {

    func login(_ request: LoginRequest, response: @escaping (_ data: UserEntity?, _ error: NSError?) -> (Void))
}
protocol LoginProtocolAPIRemoteOutput {

    func retrieved(user data: UserEntity)
    func retrieved(alertWithTitle title: String, andMessage message: String)
}
