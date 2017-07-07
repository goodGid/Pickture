//
//  reviewVO.swift
//  Pickture
//
//  Created by ljh on 2017. 7. 4..
//  Copyright © 2017년 기용 신. All rights reserved.
//

import Foundation
import ObjectMapper

class ReviewVO : Mappable{
    
    var id : String?
    var pay_id : String?
    var phoGrapID : String?
    var userID : String?
    var rate : Int?
    var timestamp : String?
    
    
    required init?(map: Map) {
        
    }
    
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.pay_id <- map["pay_id"]
        self.phoGrapID <- map["photographer_id"]
        self.userID <- map["user_id"]
        self.rate <- map["rate"]
        self.timestamp <- map["timestamp"]
    }
}

