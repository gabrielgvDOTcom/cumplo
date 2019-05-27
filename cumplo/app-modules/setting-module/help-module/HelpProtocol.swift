//
//  HelpProtocol.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

protocol HelpProtocolView: class {

    //MARK: - VARs
    var presenter: HelpProtocolPresenter? { get set }

    //MARK: - Functions
    //MARK: Data
    func deliver(helpSettings data: [HelpEntity])

    //MARK: Random
    func resume()
    func load(message: String?)

    func style()
    func title(str: String)
}
protocol HelpProtocolInteractorInput: class {

    //MARK: - Init
    var presenter: HelpProtocolInteractorOutput? { get set }
    var remote: HelpProtocolFetchInput? { get set }

    //MARK: - Functions
    //MARK: Interactor
    func setModule()
    func unsetModule()

    //MARK: Random
    func getSettings()
}
protocol HelpProtocolInteractorOutput: class {

    func didRetrieve(helpSettings data: [HelpEntity])
    func didRetrieve(alertWithTitle title: String, andMessage message: String)
}
protocol HelpProtocolPresenter: class {

    //MARK: - Init
    var view: HelpProtocolView? { get set }
    var router: HelpProtocolRouter? { get set }
    var interactor: HelpProtocolInteractorInput? { get set }

    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
    
    //MARK: - Random
}
protocol HelpProtocolRouter: class {
    
    var viewController: UIViewController? { get set }
}
protocol HelpProtocolFetchInput {
    
    func getSettings(response: @escaping (_ data: [HelpEntity]?, _ error: NSError?) -> (Void))
}
