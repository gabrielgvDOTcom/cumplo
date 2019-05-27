//
//  FilterAPIRest.swift
//  Cumplo
//
//  Created by Gabriel Gárate Vivanco on 2/4/19.
//  Copyright © 2019 weeKG. All rights reserved.
//

import Alamofire
import ObjectMapper

class FilterFetch: FilterProtocolFetchInput {
    
    //MARK: - Functions
    //MARK: CRUD
    func getFilters(response: @escaping ([FilterEntity]?, NSError?) -> (Void)) {
        
        let path = Bundle.main.path(forResource: "filter", ofType: "json")
        Alamofire.request(URL(fileURLWithPath: path!)).responseJSON { (fetch) in
            switch fetch.result {
            case .success(let result):
                guard let json = result as? [String : Any], (json["error"] == nil) else {
                    //self.handler?.retrieved(alert: "¡ERROR!", error: Util.error(message: ""))
                    return
                }
                if let array = json["data"] as? [[String : Any]], !array.isEmpty {
                    response(Mapper<FilterEntity>().mapArray(JSONArray: array), nil)
                    return
                }
                //ERROR RANDOM
                
            case .failure(let error):
                debugPrint(error)
                response(nil, error as NSError)
            }
        }
    }
    func getBusiness(response: @escaping ([BusinessEntity]?, NSError?) -> (Void)) {
        response([
            BusinessEntity(id: 1, title: "Hola", subtitle: nil, image: nil),
            BusinessEntity(id: 2, title: "que", subtitle: nil, image: nil),
            BusinessEntity(id: 3, title: "hace", subtitle: nil, image: nil)
        ], nil)
    }
    
    //MARK: CoreData
}
