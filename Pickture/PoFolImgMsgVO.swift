//
//  PoFolImgMsgVO.swift
//  Pickture
//
//  Created by Kiyong Shin on 30/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import Foundation
import ObjectMapper


class PoFolImgMsgVO : Mapper{
    var message : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.message <- map["message"]
    }
}
