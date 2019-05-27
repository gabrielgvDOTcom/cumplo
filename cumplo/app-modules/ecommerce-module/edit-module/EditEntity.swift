//
//  EditEntity.swift
//  weeKGEdit
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import ObjectMapper

struct EditEntity {
    
    var id: Int!
}
extension EditEntity: Mappable {

    init?(map: Map) {}
    mutating func mapping(map: Map) {
        
        self.id <-  map["id"]
    }
}
