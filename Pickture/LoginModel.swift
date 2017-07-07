//
//  LoginModel.swift
//  Pickture
//
//  Created by ljh on 2017. 7. 4..
//  Copyright © 2017년 기용 신. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper


class LoginModel: NetworkModel {
    
    func userLogin(id:String, password: String){
        let URL : String = "\(baseURL)/users/login"
        
        let body : [String:String] = [
            "id" : id,
            "password" : password
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response : DataResponse<UserLoginVO>) in
            
            switch response.result {
                
            case .success:
                guard let loginList = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                
                if loginList.result! {
                    self.view.networkResult(resultData: loginList, code: "LoginSuccess")
                }
                else {
                    self.view.networkResult(resultData: loginList, code: "LoginFail")
                }
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
        }
        
    }
    
}

