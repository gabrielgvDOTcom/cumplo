//
//  PreOrderEntity.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import ObjectMapper

struct PreOrderEntity {
    
    var id: Int!
}
extension PreOrderEntity: Mappable {

    init?(map: Map) {}
    mutating func mapping(map: Map) {
        
        self.id <-  map["id"]
    }
}
