//
//  TabBarProtocol.swift
//  TabBar
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

protocol TabBarProtocolView: class {

    //MARK: - VARs
    var presenter: TabBarProtocolPresenter? { get set }

    //MARK: - Functions
    //MARK: Data
    func deliver(tabs data: [UIViewController])
    func deliver(barLeft button: [UIBarButtonItem])
    func deliver(barRight button: [UIBarButtonItem])

    //MARK: Random
    func resume()
    func load(message: String?)

    func style()
    func title(str: String)
    func message(viewWithTitle title: String, andMessage message: String)
}
protocol TabBarProtocolInteractorInput: class {

    //MARK: - Init
    var presenter: TabBarProtocolInteractorOutput? { get set }
    var remote: TabBarProtocolFetchInput? { get set }

    //MARK: - Functions
    func setModule()
    func unsetModule()

    //MARK: Random
    func getTabs()
}
protocol TabBarProtocolInteractorOutput: class {

    func didRetrieve(tabs data: [UIViewController])
    func didRetrieve(viewWithTitle title: String, andMessage message: String)
    func didRetrieve(alertWithTitle title: String, andMessage message: String)
}
protocol TabBarProtocolPresenter: class {

    //MARK: - Init
    var view: TabBarProtocolView? { get set }
    var router: TabBarProtocolRouter? { get set }
    var interactor: TabBarProtocolInteractorInput? { get set }

    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
    
    //MARK: Transition
    func presentFilterView()
    func pushAlertSetView()
    func pushEcommerceView()

    //MARK: Random
    func getTabs()
}
protocol TabBarProtocolRouter: class {
    
    var viewController: UIViewController? { get set }

    func pushEcommerceView()
    func presentFilterView()
}
protocol TabBarProtocolFetchInput {
    
    func getTabs(response: @escaping (_ data: [UIViewController]?, _ error: NSError?) -> (Void))
}
