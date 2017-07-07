//
//  WriteReviewRpVO.swift
//  Pickture
//
//  Created by Kiyong Shin on 06/07/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import Foundation
import ObjectMapper

class WriteReviewRpVO: Mappable{
    
    var result : Bool?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        self.result <- map["result"]
    }
    
}

