//
//  picksVO.swift
//  Pickture
//
//  Created by ljh on 2017. 7. 2..
//  Copyright © 2017년 기용 신. All rights reserved.
//

import Foundation
import ObjectMapper


class picksVO : Mappable {
    
    var id : Int?
    var url : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        url <- map["url"]
        id <- map["id"]
    }
    
}
