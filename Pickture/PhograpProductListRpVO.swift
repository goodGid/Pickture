//
//  PhograpProductListRpVO.swift
//  Pickture
//
//  Created by Kiyong Shin on 07/07/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import Foundation
import ObjectMapper

class PhograpProductListRpVO : Mappable{
    
    var result : Int?
    var _items : [PhograpProductListVO]?
    
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.result <- map["result"]
        self._items <- map["items"]
    }
}

class PhograpProductListVO : Mappable{
    
    var item_name : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.item_name <- map["item_name"]
    }
}




