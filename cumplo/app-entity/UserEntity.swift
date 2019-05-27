//
//  UserEntity.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 5/13/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import ObjectMapper

struct UserEntity {
    
    var id: String!
}
extension UserEntity: Mappable {

    init?(map: Map) {}
    mutating func mapping(map: Map) {
        
        self.id <-  map["id"]
    }
}
