//
//  AccountProtocol.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

protocol AccountProtocolView: class {

    //MARK: - VARs
    var presenter: AccountProtocolPresenter? { get set }

    //MARK: - Functions
    //MARK: Data
    func deliver(accountSettings data: [AccountEntity])

    //MARK: Random
    func resume()
    func load(message: String?)

    func style()
    func endediting()
    func title(str: String)
    func keyboard(inset: UIEdgeInsets)
}
protocol AccountProtocolInteractorInput: class {

    //MARK: - Init
    var presenter: AccountProtocolInteractorOutput? { get set }
    var remote: AccountProtocolFetchInput? { get set }

    //MARK: - Functions
    //MARK: Interactor
    func setModule()
    func unsetModule()

    //MARK: Random
    func getSettings()
}
protocol AccountProtocolInteractorOutput: class {

    func scrollView(moveTo inset: UIEdgeInsets)

    func didRetrieve(accountSettings data: [AccountEntity])
    func didRetrieve(alertWithTitle title: String, andMessage message: String)
}
protocol AccountProtocolPresenter: class {

    //MARK: - Init
    var view: AccountProtocolView? { get set }
    var router: AccountProtocolRouter? { get set }
    var interactor: AccountProtocolInteractorInput? { get set }

    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
    
    //MARK: - Random
}
protocol AccountProtocolRouter: class {
    
    var viewController: UIViewController? { get set }
}
protocol AccountProtocolFetchInput {

    func getSettings(response: @escaping (_ data: [AccountEntity]?, _ error: NSError?) -> (Void))
}
