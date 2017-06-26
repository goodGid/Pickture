//
//  NetworkCallback.swift
//  Pickture
//
//  Created by Kiyong Shin on 25/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

protocol NetworkCallback {
    func networkResult(resultData : Any, code:String)
    func networkFailed()
}

