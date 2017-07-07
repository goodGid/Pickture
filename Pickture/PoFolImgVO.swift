//
//  PoFolImg.swift
//  Pickture
//
//  Created by Kiyong Shin on 30/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import Foundation
import ObjectMapper

class PoFolImgVO : Mappable{
    
    var message : String?
    var pictures : [urlVO]?
//    var result : Bool?
//    var reviews : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.pictures <- map["pictures"]        
        self.message <- map["message"]
        
        
    }
}

class urlVO : Mappable {
    
    var tmpUrl : String?
    
    required init?(map: Map) {
        
    }
    
    
    func mapping(map: Map) {
            self.tmpUrl <- map["url"]
    }
}

