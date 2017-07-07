//
//  PhograpInfoRpVO.swift
//  Pickture
//
//  Created by Kiyong Shin on 04/07/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//


import Foundation
import ObjectMapper

class PhograpInfolistRpVO : Mappable{
    
    var result : Bool?
    
    var logo : String?
    var ceo: String?
    var address: String?

    
    var _items : [PhograpInfolistVO]?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.result <- map["result"]
        
        /*
        self.logo <- map["logo"]
        self.ceo <- map["ceo"]
        self.address <- map["address"]
        */
        
        self._items <- map["items"]
    }
}



class PhograpInfolistVO : Mappable{
    var item_name: String?
    var price : Int?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.item_name <- map["item_name"]
        self.price <- map["price"]
    }
}

