//
//  OrderAccountProtocol.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

protocol OrderAccountProtocolView: class {

    //MARK: - VARs
    var presenter: OrderAccountProtocolPresenter? { get set }

    //MARK: - Functions
    //MARK: Data
    func deliver(accounts data: [BankAccountEntity])

    //MARK: Random
    func resume()
    func load(message: String?)

    func style()
    func title(str: String)
}
protocol OrderAccountProtocolInteractorInput: class {

    //MARK: - Init
    var presenter: OrderAccountProtocolInteractorOutput? { get set }
    var remote: OrderAccountProtocolFetchInput? { get set }

    //MARK: - Functions
    //MARK: Interactor
    func setModule()
    func unsetModule()

    //MARK: Random
    func getAccounts()
    func orderStart(accountSelected account: BankAccountEntity?)
}
protocol OrderAccountProtocolInteractorOutput: class {

    func didRetrieve(accounts data: [BankAccountEntity])
    func didRetrieve(viewWithTitle title: String, andMessage message: String)
    func didRetrieve(alertWithTitle title: String, andMessage message: String)
}
protocol OrderAccountProtocolPresenter: class {

    //MARK: - Init
    var view: OrderAccountProtocolView? { get set }
    var router: OrderAccountProtocolRouter? { get set }
    var interactor: OrderAccountProtocolInteractorInput? { get set }

    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
    
    //MARK: Random
    func getAccounts()
    func orderStart(accountSelected account: BankAccountEntity?)
}
protocol OrderAccountProtocolRouter: class {
    
    var viewController: UIViewController? { get set }
    
    func presentErrorView()
    func presentAlertController(withObject object: AlertEntity)
}
protocol OrderAccountProtocolFetchInput {
    
    func getAccounts(response: @escaping (_ data: [BankAccountEntity]?, _ error: NSError?) -> (Void))
}
