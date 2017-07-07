//
//  PhoGrapReviewVO.swift
//  Pickture
//
//  Created by ljh on 2017. 7. 4..
//  Copyright © 2017년 기용 신. All rights reserved.
//

import Foundation
import ObjectMapper

class PhoGrapReviewVO : Mappable{
    
    var result : Bool?
    var reviews : [ReviewVO]?
    
    
    required init?(map: Map) {
        
    }
    
    
    func mapping(map: Map) {
        self.result <- map["result"]
        self.reviews <- map["reviews"]
    }
}
