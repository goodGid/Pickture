//
//  File.swift
//  Pickture
//
//  Created by Kiyong Shin on 30/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import Foundation
import ObjectMapper

class BestImgListVO : Mappable{
    
    var result : Bool?
    var _photographers : [PhotographersVO]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.result <- map["result"]
        self._photographers <- map["photographers"]
    }
}

class PhotographersVO : Mappable{
    
    var profile_url : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.profile_url <- map["profile_url"]
    }
}


