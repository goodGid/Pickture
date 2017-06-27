//
//  NetworkModel.swift
//  Pickture
//
//  Created by Kiyong Shin on 25/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

class NetworkModel {
    //뷰컨트롤러로 데이터를 전달해줄 위임자를 나타내주는 변수
    //callbackDelegate
    var view : NetworkCallback
    
    init(_ vc : NetworkCallback){
        self.view = vc
    }

    let baseURL = "http://52.78.4.96:3000"
    
    //옵셔널 String을 해제하는데 값이 nil이면 ""을 반환
    func gsno(_ data: String?) -> String {
        guard let str = data else {
            return ""
        }
        return str
    }
    
    //옵셔널 Int를 해제하는데 값이 nil이면 0을 반환
    func gino(_ data: Int?) -> Int {
        guard let num = data else {
            return 0
        }
        return num
    }
}

