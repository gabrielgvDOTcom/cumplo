//
//  OpportunityEntity.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import ObjectMapper

struct OpportunityEntity {
    
    var id:         Int!
    var title:      String!
    var subtitle:   String!
    var image:      String!
    var amount:     String!
    var term:       String!
    var tir:        String!
    var danger:     String!
    var business:   BusinessEntity?
}
extension OpportunityEntity: Mappable {
    
    init?(map: Map) {}
    mutating func mapping(map: Map) {
        
        self.id         <-  map["id"]
        self.title      <-  map["title"]
        self.subtitle   <-  map["subtitle"]
        self.image      <-  map["image"]
        self.amount     <-  map["footer.amount"]
        self.term       <-  map["footer.term"]
        self.tir        <-  map["footer.tir"]
        self.danger     <-  map["footer.danger"]
        self.business   <-  map["business"]
    }
}
