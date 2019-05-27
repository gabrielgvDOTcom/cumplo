//
//  FilterPresenter.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import Foundation

class FilterPresenter: FilterProtocolPresenter {
    
    let closeBarButton = UIButton().timesButton
    
    //MARK: - VARs
    var view: FilterProtocolView?
    var router: FilterProtocolRouter?
    var interactor: FilterProtocolInteractorInput?
    
    //MARK: - Init
    init() {}
    
    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad() {
        closeBarButton.addTarget(self, action: #selector(close(sender:)), for: .touchUpInside)

        view?.style()
        view?.title(str: "Filtros")
        view?.deliver(leftButtons: [UIBarButtonItem(customView: closeBarButton)])
        view?.deliver(rightButtons: [
            UIBarButtonItem(
                title: "Limpiar",
                style: .plain,
                target: self,
                action: #selector(clean(sender:))
            )
        ])
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.definesPresentationContext = true
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.searchBarStyle = .prominent
        searchController.hidesNavigationBarDuringPresentation = false
        if let textfield = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            textfield.placeholder = "Nombre Solicitante"
            if let backgroundview = textfield.subviews.first {
                backgroundview.backgroundColor = UIColor.init(white: 1, alpha: 0.5)
                backgroundview.layer.cornerRadius = 10
                backgroundview.clipsToBounds = true
            }
        }
        view?.deliver(searchControllerObject: searchController)

        interactor?.getFilters()
    }
    func viewWillAppear() {
        (view as! UIViewController).navigationItem.hidesSearchBarWhenScrolling = false
    }
    func viewDidAppear() {
        (view as! UIViewController).navigationItem.hidesSearchBarWhenScrolling = true
        interactor?.setModule()
    }
    func viewWillDisappear() {
        interactor?.unsetModule()
    }
    func viewDidDisappear() {}

    //MARK: Target
    @objc func close(sender: UIButton) {
        router?.dismissFilterView()
    }
    @objc func clean(sender: UIBarButtonItem) {
        
    }
    
    //MARK: Transition
    func dismissFilterView() {
        
    }
    
    //MARK: Random
    func getBusiness() {
        view?.load(message: nil)
        interactor?.getBusiness()
    }
}
extension FilterPresenter: FilterProtocolInteractorOutput {

    func scrollView(moveTo inset: UIEdgeInsets) {
        view?.keyboard(inset: inset)
    }

    func didRetrieve(filters data: [FilterEntity]) {
        view?.resume()
        view?.deliver(filters: data)
    }
    func didRetrieve(business data: [BusinessEntity]) {
        view?.resume()
        view?.deliver(business: data)
    }
    func didRetrieve(alertWithTitle title: String, andMessage message: String) {
        view?.resume()
        router?.presentAlertController(AlertEntity(
            title: title,
            message: message,
            style: .alert,
            actions: [UIAlertAction(title: "Aceptar", style: .default, handler: nil)]
        ))
    }
}
