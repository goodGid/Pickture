//
//  RegisterUserVO.swift
//  Pickture
//
//  Created by Kiyong Shin on 27/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import Foundation
import ObjectMapper

class RegisterUserVO : Mappable{
    
    var sex : String?
    var username : String?
    var password : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        self.sex <- map["sex"]
        self.username <- map["username"]
        self.password <- map["password"]
    }
}


