//
//  OpportunityAPIRest.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import Alamofire
import ObjectMapper

class OpportunityFetch: OpportunityProtocolFetchInput {
    
    //MARK: - Functions
    //MARK: CRUD
    func getFilters(response: @escaping ([FilterEntity]?, NSError?) -> (Void)) {
        
        
    }
    func getOpportunities(response: @escaping ([OpportunityEntity]?, NSError?) -> (Void)) {

        let path = Bundle.main.path(forResource: "opportunities", ofType: "json")
        Alamofire.request(URL(fileURLWithPath: path!)).responseJSON { (fetch) in
            switch fetch.result {
            case .success(let result):
                guard let json = result as? [String : Any], (json["error"] == nil) else {
                    response(nil, NSError(domain: "", code: 0, userInfo: [:]))
                    return
                }
                if let array = json["data"] as? [[String : Any]], !array.isEmpty {
                    response(Mapper<OpportunityEntity>().mapArray(JSONArray: array), nil)
                    return
                }
                //ERROR RANDOM
                
            case .failure(let error): response(nil, (error as NSError))
            }
        }
    }
}
