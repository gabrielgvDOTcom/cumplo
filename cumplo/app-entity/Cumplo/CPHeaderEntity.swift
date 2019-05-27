//
//  CPHeaderEntity.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 5/6/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import ObjectMapper

struct CPHeaderEntity {
    
    var title: String!
    var height: CGFloat?
}
extension CPHeaderEntity: Mappable {

    init?(map: Map) {}
    mutating func mapping(map: Map) {
        
        self.title  <-  map["title"]
        self.height <-  map["height"]
    }
}
