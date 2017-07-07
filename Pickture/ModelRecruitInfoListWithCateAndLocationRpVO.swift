//
//  ModelRecruitInfoListWithCateAndLocationRpVO.swift
//  Pickture
//
//  Created by Kiyong Shin on 07/07/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import Foundation
import ObjectMapper


class ModelRecruitInfoListWithCateAndLocationRpVO : Mappable {
    
    
    var result : Bool?
    var _recruits : [ModelRecruitInfoListWithCateAndLocationVO]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.result <- map["result"]
        self._recruits <- map["recruits"]
    }
}



class ModelRecruitInfoListWithCateAndLocationVO : Mappable{
    var id : Int?
    var title : String?
    var concept : String?
    
    var category : String?
    var modelRequired : String?
    var dateHours : String?
    
    var photoPlace : String?
    var etc : String?
    var comment : String?
    
    var timestamp : String?
    var due_data : String?
    var _images : [String?]?
    
    var d_day : Int?
    var _photographer : PhotographerVO?
    var location : String?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.title <- map["title"]
        self.concept <- map["concept"]
        
        self.category <- map["category"]
        self.modelRequired <- map["modelRequired"]
        self.dateHours <- map["dateHours"]
        
        self.photoPlace <- map["photoPlace"]
        self.etc <- map["etc"]
        self.comment <- map["comment"]
        
        self.timestamp <- map["timestamp"]
        self.due_data <- map["due_data"]
        self._images <- map["images"]
        
        
        self.d_day <- map["d_day"]
        self._photographer <- map["photographer"]
        self.location <- map["location"]
    }
    
}












