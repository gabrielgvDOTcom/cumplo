//
//  CPTextFieldEntity.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 3/21/19.
//  Copyright © 2019 IONIX. All rights reserved.
//

import ObjectMapper

struct CPTextFieldEntity {
    
    var title: String?
    var placeholder: String?
}
extension CPTextFieldEntity: Mappable {

    init?(map: Map) {}
    mutating func mapping(map: Map) {
        
        self.title          <-  map["title"]
        self.placeholder    <-  map["placeholder"]
    }
}
