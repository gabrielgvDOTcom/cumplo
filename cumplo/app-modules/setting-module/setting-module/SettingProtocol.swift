//
//  SettingProtocol.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

protocol SettingProtocolView: class {

    //MARK: - VARs
    var presenter: SettingProtocolPresenter? { get set }

    //MARK: - Functions
    //MARK: Data
    func deliver(pageView page: FGPage)
    func deliver(modules data: [PageEntity])

    //MARK: Random
    func style()
    func title(str: String)
}
protocol SettingProtocolInteractorInput: class {

    //MARK: - Init
    var presenter: SettingProtocolInteractorOutput? { get set }
    var remote: SettingProtocolFetchInput? { get set }

    //MARK: - Functions
    //MARK: Interactor
    func setModule()
    func unsetModule()

    //MARK: Random
    func getModules()
}
protocol SettingProtocolInteractorOutput: class {

    func didRetrieve(modules data: [PageEntity])
}
protocol SettingProtocolPresenter: class {

    //MARK: - Init
    var view: SettingProtocolView? { get set }
    var router: SettingProtocolRouter? { get set }
    var interactor: SettingProtocolInteractorInput? { get set }

    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
    
    //MARK: Transition
    //MARK: Random
}
protocol SettingProtocolRouter: class {
    
    var viewController: UIViewController? { get set }
}
protocol SettingProtocolFetchInput {

    func getModules(response: @escaping (_ data: [PageEntity]?, _ error: NSError?) -> (Void))
}
