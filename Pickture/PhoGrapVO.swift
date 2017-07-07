//
//  PhoGrapVO.swift
//  Pickture
//
//  Created by Kiyong Shin on 30/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//


import Foundation
import ObjectMapper

class PhoGrapVO : Mappable{
    
    var image : String?
    var ID : String?
    var category : String?
    var location : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        image <- map["profile_url"]
        ID <- map["id"]
        category <- map["category"]
        location <- map["location"]
    }
}
