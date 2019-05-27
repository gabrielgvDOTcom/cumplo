//
//  LoginAPIRest.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import ObjectMapper

class LoginFetch: LoginProtocolFetchInput {

    //MARK: - Functions
    //MARK: CRUD
    func login(_ request: LoginRequest, response: @escaping (UserEntity?, NSError?) -> (Void)) {
        response(UserEntity(), nil)
    }
}
