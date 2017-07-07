//
//  SearchListRpVO.swift
//  Pickture
//
//  Created by Kiyong Shin on 06/07/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//


import Foundation
import ObjectMapper


//서버에서 받아오는 데이터 객체를 담아오기 위한 그릇(가장 상위 레벨)

class SearchListRpVO: Mappable{
    
    var result : Bool?
    var _photographers : [SearchListVO]?
    
    
    //Mappable 프로토콜을 구현할때 반드시 구현되어야 하는 초기화구문
    required init?(map: Map){
        
    }
    
    //Mappable 프로토콜을 구현할 때 반드시 구현되어야 하는 함수
    func mapping(map: Map) {
        self.result <- map["result"]
        self._photographers <- map["photographers"]
    }
    
}


class SearchListVO : Mappable{
    
    var id : String?
    var location : String?
    var profile_url : String?
    
    
    var hashtag : String?
    var picked : Bool?
    
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        self.id <- map["id"]
        self.location <- map["location"]
        self.profile_url <- map["profile_url"]
        
        self.hashtag <- map["hashtag"]
        self.picked <- map["picked"]
    }
}












