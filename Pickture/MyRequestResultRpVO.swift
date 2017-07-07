//
//  MyRequestResultRpVO.swift
//  Pickture
//
//  Created by Kiyong Shin on 06/07/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import Foundation
import ObjectMapper

class MyRequestResultRpVO: Mappable{
    
    var result : Bool?
    var _requests : [MyRequestResultVO]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        self.result <- map["result"]
        self._requests <- map["requests"]
    }
    
}


class MyRequestResultVO : Mappable{
    
    var id : Int?
    var model_id : String?
    var photographer_id : String?
    var category : String?
    var location : String?
    var date : String?
    var item : Int?
    var comment : String?
    var status : String?
    var timestamp : String?
    var checkDate : String?
    

//    var pay_at : String?
    
    
    var type : String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        
        self.id <- map["id"]
        self.model_id <- map["model_id"]
        self.photographer_id <- map["photographer_id"]
        self.category <- map["category"]
        self.location <- map["location"]
        self.date <- map["date"]
        self.item <- map["item"]
        self.comment <- map["comment"]
        self.status <- map["status"]
        self.timestamp <- map["timestamp"]
        self.checkDate <- map["checkDate"]
//        self.pay_at <- map["pay_at"]
        self.type <- map["type"]
        
    }
}












