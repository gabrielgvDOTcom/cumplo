//
//  TabBarPresenter.swift
//  TabBar
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import Foundation

class TabBarPresenter: TabBarProtocolPresenter {

    //MARK: - VARs
    var view: TabBarProtocolView?
    var router: TabBarProtocolRouter?
    var interactor: TabBarProtocolInteractorInput?

    //MARK: - Init
    init() {}

    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad() {
        view?.style()
        interactor?.getTabs()
    }
    func viewWillAppear() {}
    func viewDidAppear() {
        interactor?.setModule()
    }
    func viewWillDisappear() {
        interactor?.unsetModule()
    }
    func viewDidDisappear() {}

    //MARK: Transition
    func presentFilterView() {
        router?.presentFilterView()
    }
    func pushAlertSetView() {
        
    }
    func pushEcommerceView() {
        router?.pushEcommerceView()
    }

    //MARK: Random
    func getTabs() {
        view?.load(message: nil)
        interactor?.getTabs()
    }
}
extension TabBarPresenter: TabBarProtocolInteractorOutput {

    func didRetrieve(tabs data: [UIViewController]) {
        view?.resume()
        view?.deliver(tabs: data)
    }
    func didRetrieve(viewWithTitle title: String, andMessage message: String) {
        view?.resume()
        view?.message(viewWithTitle: title, andMessage: message)
    }
    func didRetrieve(alertWithTitle title: String, andMessage message: String) {
        view?.resume()
    }
}
