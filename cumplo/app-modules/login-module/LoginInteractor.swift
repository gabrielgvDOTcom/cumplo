//
//  LoginInteractor.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import Foundation

extension LoginInteractor {
    
    @objc fileprivate func willShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            presenter?.scrollView(moveTo: UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0))
        }
    }
    @objc fileprivate func willHide(_ notification: Notification) {
        presenter?.scrollView(moveTo: .zero)
    }
}
class LoginInteractor: LoginProtocolInteractorInput {
    
    //MARK: - VARs
    var presenter: LoginProtocolInteractorOutput?
    var remote: LoginProtocolFetchInput?

    //MARK: - Init
    init(remote: LoginProtocolFetchInput) {
        self.remote = remote
    }

    //MARK: - Functions
    //MARK: Interactor
    func setModule() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(willShow(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(willHide(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    func unsetModule() {
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: Random
    func login(request: LoginRequest) {
        remote?.login(request, response: { (data, error) -> (Void) in
            if let user = data {
                self.presenter?.didRetrieve(user: user)
                return
            }
            self.presenter?.didRetrieve(alertWithTitle: "error", andMessage: error!.localizedDescription)
        })
    }
}
