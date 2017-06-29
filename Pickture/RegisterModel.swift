//
//  SingUpModel.swift
//  Pickture
//
//  Created by Kiyong Shin on 27/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper


class RegisterModel: NetworkModel {
    
    
    
    
    func registerUser(id:String, password: String){
        let URL : String = "\(baseURL)/users/register"
        
        let body : [String:String] = [
            "id" : id,
            "password" : password
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response : DataResponse<RegisterUserVO>) in
            
            switch response.result {
                
            case .success:
                print(" success ")
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
        }
    }
    
    
    func chkID(id:String){
        let URL : String = "\(baseURL)/users/validation"
        
        let body : [String:String] = [
            "id" : id,
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response : DataResponse<ChkIDVO>) in
            
            switch response.result {
                
            case .success:
                guard let result = response.result.value else{
                    return
                }
                
                // 1이면 이미 아이디 존재
                 if result.result == 1 {
                    print(" Already Exist ")
                 }
                else{
                    print(" Already Not Exist ")
                 }
                
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
        }
    }
    
    
    
    
  
    
}
