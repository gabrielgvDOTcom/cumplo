//
//  FilterProtocol.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit

protocol FilterProtocolView: class {

    //MARK: - VARs
    var presenter: FilterProtocolPresenter? { get set }

    //MARK: - Functions
    //MARK: Data
    func deliver(filters data: [FilterEntity])
    func deliver(business data: [BusinessEntity])
    func deliver(leftButtons buttons: [UIBarButtonItem])
    func deliver(rightButtons buttons: [UIBarButtonItem])
    func deliver(searchControllerObject object: UISearchController)

    //MARK: Random
    func resume()
    func load(message: String?)

    func style()
    func title(str: String)
    func keyboard(inset: UIEdgeInsets)
}
protocol FilterProtocolInteractorInput: class {

    //MARK: - Init
    var presenter: FilterProtocolInteractorOutput? { get set }
    var remote: FilterProtocolFetchInput? { get set }

    //MARK: - Functions
    func setModule()
    func unsetModule()

    //MARK: Random
    func getFilters()
    func getBusiness()
}
protocol FilterProtocolInteractorOutput: class {

    func scrollView(moveTo inset: UIEdgeInsets)

    func didRetrieve(filters data: [FilterEntity])
    func didRetrieve(business data: [BusinessEntity])
    func didRetrieve(alertWithTitle title: String, andMessage message: String)
}
protocol FilterProtocolPresenter: class {

    //MARK: - Init
    var view: FilterProtocolView? { get set }
    var router: FilterProtocolRouter? { get set }
    var interactor: FilterProtocolInteractorInput? { get set }

    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()

    //MARK: Transitions
    func dismissFilterView()
    
    //MARK: Random
    func getBusiness()
}
protocol FilterProtocolRouter: class {
    
    var viewController: UIViewController? { get set }
    
    func dismissFilterView()
    func presentAlertController(_ object: AlertEntity)
}
protocol FilterProtocolFetchInput {

    func getFilters(response: @escaping ([FilterEntity]?, NSError?) -> (Void))
    func getBusiness(response: @escaping ([BusinessEntity]?, NSError?) -> (Void))
}
