//
//  PreviewInteractor.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import UIKit
import Foundation

class PreviewInteractor: PreviewProtocolInteractorInput {
    
    //MARK: - VARs
    var presenter: PreviewProtocolInteractorOutput?
    var remote: PreviewProtocolFetchInput?
    
    //MARK: - Init
    init(remote: PreviewProtocolFetchInput) {
        self.remote = remote
    }
    
    //MARK: - Functions
    //MARK: Interactor
    func setModule() {}
    func unsetModule() {}
}
