//
//  BusinessEntity.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 3/17/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import ObjectMapper

struct BusinessEntity {
    
    var id:         Int!
    var title:      String!
    var subtitle:   String?
    var image:      String?
}
extension BusinessEntity: Mappable {
    
    init?(map: Map) {}
    mutating func mapping(map: Map) {
        
        self.id         <-  map["id"]
        self.title      <-  map["title"]
        self.subtitle   <-  map["subtitle"]
        self.image      <-  map["image"]
    }
}
