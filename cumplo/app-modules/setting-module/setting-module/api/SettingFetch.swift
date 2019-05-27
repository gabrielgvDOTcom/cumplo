//
//  SettingAPIRest.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import Alamofire
import ObjectMapper

class SettingFetch: SettingProtocolFetchInput {

    //MARK: - Functions
    //MARK: CRUD
    func getModules(response: @escaping ([PageEntity]?, NSError?) -> (Void)) {
        
        response([
            PageEntity(title: "Personal", controller: AccountRouter.build()),
            PageEntity(title: "Bancario", controller: BankRouter.build()),
            //PageEntity(title: "Seguridad", controller: SecurityRouter.build()),
            //PageEntity(title: "Notificaciones", controller: AlertSetRouter.build()),
            PageEntity(title: "Ayuda", controller: HelpRouter.build())
        ], nil)
    }
}
