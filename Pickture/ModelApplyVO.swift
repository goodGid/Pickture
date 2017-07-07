//
//  ModelApplyVO.swift
//  Pickture
//
//  Created by ljh on 2017. 7. 3..
//  Copyright © 2017년 기용 신. All rights reserved.
//

import Foundation
import ObjectMapper

class ModelApplyVO : Mappable {
    
    var result : String?
    var applies : [ApplyVO]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        self.result <- map["result"]
        self.applies <- map["applies"]
    }
}

class ApplyVO : Mappable {
    
    var status : String?
    var phoGrapId : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.status <- map["status"]
        self.phoGrapId <- map["photographer_id"]
    }
}

