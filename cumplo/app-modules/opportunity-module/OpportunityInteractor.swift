//
//  OpportunityInteractor.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import Foundation

extension OpportunityInteractor {
    
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
class OpportunityInteractor: OpportunityProtocolInteractorInput {
    
    //MARK: - VARs
    var presenter: OpportunityProtocolInteractorOutput?
    var remote: OpportunityProtocolFetchInput?
    
    //MARK: - Init
    init(remote: OpportunityProtocolFetchInput) {
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
    func getFilters() {

        remote?.getFilters(response: { (data, error) -> (Void) in
            
        })
    }
    func getOpportunities() {
        remote?.getOpportunities(response: { (data, error) -> (Void) in
            if let array = data {
                self.presenter?.didRetrieve(opportunities: array)
                return
            }
        })
    }
}
