//
//  EditPresenter.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import Foundation

class EditPresenter: EditProtocolPresenter {
    
    //MARK: - VARs
    var view: EditProtocolView?
    var router: EditProtocolRouter?
    var interactor: EditProtocolInteractorInput?
    
    //MARK: - Init
    init() {}
    
    //MARK: - Functions
    //MARK: Notify
    func viewDidLoad() {
        view?.style()
        view?.title(str: "Editando Inversión")
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
    func dismissEditView() {
        router?.dismissEditView()
    }

    //MARK: Random
    func trashInversion() {
        view?.resume()
        router?.presentAlertController(withObject: AlertEntity(
            title: "¿Eliminar?",
            message: "¿Desea realmente Eliminar?",
            style: .alert,
            actions: [
                UIAlertAction(title: "Cancelar", style: .cancel, handler: nil),
                UIAlertAction(title: "Eliminar", style: .destructive, handler: { (action) in
                    self.router?.dismissEditView()
                })
            ]
        ))
    }
}
extension EditPresenter: EditProtocolInteractorOutput {

    func didRetrieve(viewWithTitle title: String, andMessage message: String) {
        view?.resume()
    }
    func didRetrieve(alertWithTitle title: String, andMessage message: String) {
        view?.resume()
    }
}
