//
//  RegisterEntity.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import ObjectMapper

struct RegisterEntity {
    
    var title: String?
    var height: CGFloat! = 60
    var fields: [CPTextFieldEntity]!
}
extension RegisterEntity: Mappable {

    init?(map: Map) {}
    mutating func mapping(map: Map) {
        
        self.title  <-  map["title"]
        self.fields <-  map["fields"]
        self.height <-  map["height"]
    }
}
