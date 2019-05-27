//
//  BankProtocol.swift
//  weeKGBank
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

protocol BankProtocolView: class {

    //MARK: - VARs
    var presenter: BankProtocolPresenter? { get set }

    //MARK: - Functions
    //MARK: Data
    func deliver(bankSettings data: [BankEntity])

    //MARK: Random
    func resume()
    func load(message: String?)

    func style()
    func title(str: String)
}
protocol BankProtocolInteractorInput: class {

    //MARK: - Init
    var presenter: BankProtocolInteractorOutput? { get set }
    var remote: BankProtocolFetchInput? { get set }

    //MARK: - Functions
    //MARK: Interactor
    func setModule()
    func unsetModule()

    //MARK: Random
    func getAccounts()
}
protocol BankProtocolInteractorOutput: class {

    func didRetrieve(bankSettings data: [BankEntity])
    func didRetrieve(alertWithTitle title: String, andMessage message: String)
}
protocol BankProtocolPresenter: class {

    //MARK: - Init
    var view: BankProtocolView? { get set }
    var router: BankProtocolRouter? { get set }
    var interactor: BankProtocolInteractorInput? { get set }

    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
    
    //MARK: - Random
}
protocol BankProtocolRouter: class {
    
    var viewController: UIViewController? { get set }
}
protocol BankProtocolFetchInput {
    
    func getAccounts(response: @escaping (_ data: [BankEntity]?, _ error: NSError?) -> (Void))
}
