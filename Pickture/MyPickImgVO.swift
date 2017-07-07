//
//  MyPickImgVO.swift
//  Pickture
//
//  Created by ljh on 2017. 7. 1..
//  Copyright © 2017년 기용 신. All rights reserved.
//

import Foundation
import ObjectMapper

class MyPickImgVO : Mappable {
    
    var result : Bool?
    var picks : [picksVO]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        result <- map["result"]
        picks <- map["picks"]
    }
    
}


