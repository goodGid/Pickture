//
//  CateListVO.swift
//  Pickture
//
//  Created by Kiyong Shin on 29/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//


import Foundation
import ObjectMapper


//서버에서 받아오는 데이터 객체를 담아오기 위한 그릇(가장 상위 레벨)

class CateListRpVO: Mappable{
    
    var location : String?
    
    
    //Mappable 프로토콜을 구현할때 반드시 구현되어야 하는 초기화구문
    required init?(map: Map){
        
    }
    
    
    //Mappable 프로토콜을 구현할 때 반드시 구현되어야 하는 함수
    func mapping(map: Map) {
        location <- map["location"]
    }
}

