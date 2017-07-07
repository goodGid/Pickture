//
//  PhograpListFromCateRpVO2.swift
//  Pickture
//
//  Created by Kiyong Shin on 03/07/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import Foundation
import ObjectMapper

class PhograpListFromCateRpVO2 : Mappable{
    
    var result : Bool?
    var _photographers : [photographersVO]?
    var location : String?
    var profile_url : String?
    
    
    required init?(map: Map) {
        
    }
    
    
    func mapping(map: Map) {
        self.result <- map["result"]
        self._photographers <- map["photographers"]
    }
}

