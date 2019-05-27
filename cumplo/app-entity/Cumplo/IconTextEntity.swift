//
//  TextIconEntity.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 5/6/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import ObjectMapper

struct IconTextEntity {
    
    var id:         Int!
    var title:      String!
    var message:    String!
    var icon:       String!
}
extension IconTextEntity: Mappable {
    
    init?(map: Map) {}
    mutating func mapping(map: Map) {
        
        self.id         <-  map["id"]
        self.title      <-  map["title"]
        self.message    <-  map["message"]
        self.icon       <-  map["icon"]
    }
}
