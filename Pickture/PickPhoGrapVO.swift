//
//  PickPhoGrapVO.swift
//  Pickture
//
//  Created by ljh on 2017. 7. 5..
//  Copyright © 2017년 기용 신. All rights reserved.
//

import Foundation
import ObjectMapper

class PickPhoGrapVO : Mappable{
    
    var result : Bool?
    
    required init?(map: Map) {
        
    }
    
    
    func mapping(map: Map) {
        self.result <- map["result"]
    }
}
