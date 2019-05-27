//
//  CPFooterEntity.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 5/6/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import ObjectMapper

struct CPFooterEntity {
    
    var title: String!
    var height: CGFloat?
}
extension CPFooterEntity: Mappable {
    
    init?(map: Map) {}
    mutating func mapping(map: Map) {
        
        self.title  <-  map["title"]
        self.height <-  map["height"]
    }
}
