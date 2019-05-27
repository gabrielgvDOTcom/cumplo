//
//  PreviewEntity.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import ObjectMapper

struct PreviewEntity {
    
    var id: Int!
}
extension PreviewEntity: Mappable {

    init?(map: Map) {}
    mutating func mapping(map: Map) {
        
        self.id <-  map["id"]
    }
}
