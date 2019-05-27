//
//  EditProtocol.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

protocol EditProtocolView: class {

    //MARK: - VARs
    var presenter: EditProtocolPresenter? { get set }

    //MARK: - Functions
    //MARK: Data
    func deliver(array data: NSArray)
    
    //MARK: Random
    func resume()
    func load(message: String?)

    func style()
    func title(str: String)
}
protocol EditProtocolInteractorInput: class {

    //MARK: - Init
    var presenter: EditProtocolInteractorOutput? { get set }
    var remote: EditProtocolFetchInput? { get set }

    //MARK: - Functions
    //MARK: Interactor
    func setModule()
    func unsetModule()

    //MARK: Random
}
protocol EditProtocolInteractorOutput: class {

    func didRetrieve(viewWithTitle title: String, andMessage message: String)
    func didRetrieve(alertWithTitle title: String, andMessage message: String)
}
protocol EditProtocolPresenter: class {

    //MARK: - Init
    var view: EditProtocolView? { get set }
    var router: EditProtocolRouter? { get set }
    var interactor: EditProtocolInteractorInput? { get set }

    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
    
    //MARK: Transition
    func dismissEditView()

    //MARK: Random
    func trashInversion()
}
protocol EditProtocolRouter: class {
    
    var viewController: UIViewController? { get set }
    
    func dismissEditView()
    func presentAlertController(withObject object: AlertEntity)
}
protocol EditProtocolFetchInput {

    
}
