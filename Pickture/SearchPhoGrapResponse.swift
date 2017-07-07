//
//  SearchPhoGrapResponse.swift
//  Pickture
//
//  Created by Kiyong Shin on 01/07/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import Foundation
import ObjectMapper

class SearchPhoGrapResponse : Mappable {
    
    var phoGrapInfo : [PhoGrapVO]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        phoGrapInfo <- map["phoGrap"]
    }
    
}
