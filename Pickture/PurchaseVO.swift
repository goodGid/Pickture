//
//  PurchaseVO.swift
//  Pickture
//
//  Created by ljh on 2017. 7. 6..
//  Copyright © 2017년 기용 신. All rights reserved.
//

import Foundation
import ObjectMapper

class PurchaseVO: Mappable{
    
    var result : Bool?
    var _pay_history : [PurchaseHistoryVO]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        self.result <- map["result"]
        self._pay_history <- map["pay_history"]
    }
    
}

class PurchaseHistoryVO : Mappable {
    
    var date : String?
    var isReviewd : Bool?
    //    var _photographer : [Purchase_PhotographerVO]?
    var _photographer : Purchase_PhotographerVO?
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        self.date <- map["date"]
        self.isReviewd <- map["review"]
        self._photographer <- map["photographer"]
    }
    
}

class Purchase_PhotographerVO : Mappable {
    
    var id : String?
    var phoGrapProfile : String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.phoGrapProfile <- map["profile_url"]
    }
}
