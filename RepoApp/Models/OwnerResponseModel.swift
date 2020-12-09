//
//  OwnerResponseModel.swift
//  RepoApp
//
//  Created by Mac on 12/9/20.
//

import Foundation
import ObjectMapper
class OwnerResponseModel : Mappable{
    var avatar_url : String = ""
    var html_url : String = ""
    var login : String = ""
    required init?(map: Map) {
        
    }
  
    func mapping(map: Map) {
        avatar_url <- map["avatar_url"]
        html_url  <- map["html_url"]
        login <- map["login"]
    }
    
    
}
