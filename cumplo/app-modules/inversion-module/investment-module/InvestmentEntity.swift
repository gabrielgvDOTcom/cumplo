//
//  InvestmentEntity.swift
//  weeKGInvestment
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import ObjectMapper

struct InvestmentEntity {
    
    var id: Int!
}
extension InvestmentEntity: Mappable {

    init?(map: Map) {}
    mutating func mapping(map: Map) {
        
        self.id <-  map["id"]
    }
}
