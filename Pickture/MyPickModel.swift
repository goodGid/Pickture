//
//  MyPickModel.swift
//  Pickture
//
//  Created by ljh on 2017. 7. 1..
//  Copyright © 2017년 기용 신. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON

class MyPickModel : NetworkModel {
    
    
    func getMyPickPhograpList(){
        
        let URL : String = "\(baseURL)/users/mypick/photographers"
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            (response : DataResponse<MyPickPhograpListRpVO>) in
            
            switch response.result{
                
            case .success:
                
                guard let _myPickImgList = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                let myPickImgList = _myPickImgList._photographers
                
                self.view.networkResult(resultData: myPickImgList as Any, code: "getMyPickPhograpList")
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
        }
    }
    
    
    
    func getMyPickImgList(){
        
        let URL : String = "\(baseURL)/users/mypick/photos"
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            (response : DataResponse<MyPickImgListRpVO>) in
            
            switch response.result{
                
            case .success:
                
                guard let _myPickImgList = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                
                // 구현해야할 부분
                let myPickImgList = _myPickImgList._photos
                
                self.view.networkResult(resultData: myPickImgList as Any, code: "getMyPickImgList")
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
        }
    }
    
    
    
}



