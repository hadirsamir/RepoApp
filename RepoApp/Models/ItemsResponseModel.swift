//
//  ItemsResponseModel.swift
//  RepoApp
//
//  Created by Mac on 12/9/20.
//

import Foundation
import  ObjectMapper
class  ItemsResponseModel : Mappable{
    var name : String = ""
    var created_at : String = ""
    var owner : OwnerResponseModel!
    required init?(map: Map) {
  
    }
    
    
    func mapping(map: Map) {
        name <- map["name"]
        created_at <- map["created_at"]
        owner <- map["owner"]
    }
    
    
}
