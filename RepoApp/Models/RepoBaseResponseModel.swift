//
//  RepoBaseResponseModel.swift
//  RepoApp
//
//  Created by Mac on 12/9/20.
//

import Foundation
import ObjectMapper
class RepoBaseResponseModel : Mappable{
    
    var total_count :Int = 0
    var incomplete_results : Bool = false
    var items :[ItemsResponseModel]!
    
    required init?(map: Map) {
        
    }
    
   
    func mapping(map: Map) {
        total_count <- map["total_count"]
        incomplete_results <- map["incomplete_results"]
        items <- map["items"]
    }
    
    
}
