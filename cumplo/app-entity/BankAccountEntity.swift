//
//  BankAccountEntity.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 5/15/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import ObjectMapper

struct BankAccountEntity {
    
    var id:             Int!
    var bank:           String!
    var account:        String!
    var account_number: String!
}
extension BankAccountEntity: Mappable {

    init?(map: Map) {}
    mutating func mapping(map: Map) {
        
        self.id             <-  map["id"]
        self.bank           <-  map["bank"]
        self.account        <-  map["account"]
        self.account_number <-  map["account_number"]
    }
}
