//
//  EditInteractor.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import Foundation

class EditInteractor: EditProtocolInteractorInput {
    
    //MARK: - VARs
    var presenter: EditProtocolInteractorOutput?
    var remote: EditProtocolFetchInput?
    
    //MARK: - Init
    init(remote: EditProtocolFetchInput) {
        self.remote = remote
    }
    
    //MARK: - Functions
    //MARK: Interactor
    func setModule() {}
    func unsetModule() {}
}
