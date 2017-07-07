//
//  MyPickImgListRpVO.swift
//  Pickture
//
//  Created by Kiyong Shin on 05/07/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import Foundation
import ObjectMapper


class MyPickPhograpListRpVO : Mappable {
    
  
    var result : Bool?
    var _photographers : [MyPickPhograpListVO]?
  
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.result <- map["result"]
        self._photographers <- map["photographers"]
    }
}


class MyPickPhograpListVO : Mappable{

    var id : String?
    var location : String?
    var profile_url :String?
    var hashtag : String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.location <- map["location"]
        self.profile_url <- map["profile_url"]
        self.hashtag <- map["hashtag"]
    }
        
}







