//
//  photographersVO.swift
//  Pickture
//
//  Created by Kiyong Shin on 02/07/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import Foundation
import ObjectMapper

class photographersVO : Mappable{
    
    
    var id : String?
    var location : String?
    var profile_url : String?
    var recent_photos : [String]?
    
    required init?(map: Map) {
        
    }
    
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.location <- map["location"]
        self.profile_url <- map["profile_url"]
        self.recent_photos <- map["recent_photos"]
    }
}
