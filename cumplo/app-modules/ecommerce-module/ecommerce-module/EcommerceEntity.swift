//
//  EcommerceEntity.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import ObjectMapper

struct EcommerceEntity {
    
    var id:         Int!
    var header:     CPHeaderEntity!
    var footer:     CPFooterEntity!
}
extension EcommerceEntity: Mappable {
    
    init?(map: Map) {}
    mutating func mapping(map: Map) {
        
        self.id         <-  map["id"]
        self.header     <-  map["header"]
        self.footer     <-  map["footer"]
    }
}
