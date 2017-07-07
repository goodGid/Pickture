//
//  PograpListFromCate.swift
//  Pickture
//
//  Created by Kiyong Shin on 01/07/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import Foundation
import ObjectMapper

class PhograpListFromCateRpVO : Mappable{
    
    var result : Bool?
    var _photographersList : [photographersVO]?
    
    
    required init?(map: Map) {
        
    }
    
    
    func mapping(map: Map) {
        self.result <- map["result"]
        self._photographersList <- map["photographers"]
    }
}



class photographersVO : Mappable{
    var id : String?
    var profile_url : String?
    var location : String?
    
    
    var recent_photos : [String]?
    
    var picked : Bool?
    var hashtag : String?
    required init?(map: Map) {
        
    }
    
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.profile_url <- map["profile_url"]
        self.location <- map["location"]
        
        self.recent_photos <- map["recent_photos"]
        
        self.picked <- map["picked"]
        self.hashtag <- map["hashtag"]
    }
}
