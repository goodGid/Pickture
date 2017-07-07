//
//  PhograpPoFolImgListVO.swift
//  Pickture
//
//  Created by Kiyong Shin on 04/07/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//


import Foundation
import ObjectMapper

class PhograpPoFolImgListRpVO : Mappable{
    
    var result : Bool?
    var _pictures : [PhograpPoFolImgListVO]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.result <- map["result"]
        self._pictures <- map["pictures"]
    }
}



class PhograpPoFolImgListVO : Mappable{
    var collection_id : Int?
    var id : String?
    var url : String?

    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.collection_id <- map["collection_id"]
        self.id <- map["id"]
        self.url <- map["url"]
    }
}

