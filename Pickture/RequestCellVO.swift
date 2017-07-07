//
//  RequestCellVO.swift
//  Pickture
//
//  Created by ljh on 2017. 7. 2..
//  Copyright © 2017년 기용 신. All rights reserved.
//

import Foundation
import UIKit

class RequestCellVO {
    
    init(){}
    
    init(number:Int?, phoGrapID:String?, reqState:String?){
        self.number = number
        self.phoGrapID = phoGrapID
        self.reqState = reqState
    }
    var number : Int?
    var phoGrapID : String?
    var reqState : String?
    var category : String?
    var item: String?
    var cntPeople : Int?
    var place : String?
    var comment : String?
    var photos : [String]?
    var photographer : [Request_photographerVO]?
    
}

class Request_photographerVO {
    
    init(){}
    
    init(number:Int?, phoGrapID:String?, reqState:String?){
        //self.number = number
        //self.phoGrapID = phoGrapID
        //self.reqState = reqState
    }
    var phoGrapID : String?
    var phoGrapImg : String?
    //var phoneNumber : String?
    
    
}
