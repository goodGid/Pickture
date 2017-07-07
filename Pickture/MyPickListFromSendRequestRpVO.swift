//
//  MyPickListFromSendRequestRpVO.swift
//  Pickture
//
//  Created by Kiyong Shin on 07/07/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import Foundation
import ObjectMapper



class MyPickListFromSendRequestRpVO : Mappable{
    
    var result : Bool?
    var _photos : [MyPickListFromSendRequestVO]?
    
    
    required init?(map: Map) {
        
    }
    
    
    func mapping(map: Map) {
        self.result <- map["result"]
        self._photos <- map["photos"]
    }
}

class MyPickListFromSendRequestVO : Mappable{
    
    var photo_id : Int?
    var url : String?
    var _photographer : MyPickListFromSendRequestPhotographerVO?
    
    
    required init?(map: Map) {
        
    }
    
    
    func mapping(map: Map) {
        self.photo_id <- map["photo_id"]
        self.url <- map["result"]
        self._photographer <- map["photographer"]
    }
}


class MyPickListFromSendRequestPhotographerVO : Mappable{
    
    var id : String?
    var profile_url : String?
    
    required init?(map: Map) {
        
    }
    
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.profile_url <- map["profile_url"]
    }
}



