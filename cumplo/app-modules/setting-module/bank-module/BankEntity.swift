//
//  BankEntity.swift
//  weeKGBank
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import ObjectMapper

struct BankEntity {
    
    var id:         Int!
    var header:     CPHeaderEntity!
    var account:    BankAccountEntity!
}
extension BankEntity: Mappable {

    init?(map: Map) {}
    mutating func mapping(map: Map) {

        self.id         <-  map["id"]
        self.header     <-  map["header"]
    }
}
