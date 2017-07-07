//
//  MyPickImgListRpVO.swift
//  Pickture
//
//  Created by Kiyong Shin on 05/07/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import Foundation
import ObjectMapper

class MyPickImgListRpVO : Mappable {
    
    
    var result : Bool?
    var _photos : [MyPickImgListVO]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.result <- map["result"]
        self._photos <- map["photos"]
    }
}


class MyPickImgListVO : Mappable{
    var id : String?
    var url : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.url <- map["location"]
    }
    
}

