//
//  RootBestImgListVO.swift
//  Pickture
//
//  Created by Kiyong Shin on 30/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import Foundation
import ObjectMapper

class RootBestImgListVO : Mappable{
    
    var imgUrlList : [BestImgListVO]?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        imgUrlList <- map["url"]
    }
}
