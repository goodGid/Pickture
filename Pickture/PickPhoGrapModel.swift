//
//  PickPhoGrapModel.swift
//  Pickture
//
//  Created by ljh on 2017. 7. 5..
//  Copyright © 2017년 기용 신. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class PickPhoGrapModel: NetworkModel {
    
    func pickPhoGrap(phoGrapID:String){
        let URL : String = "\(baseURL)/users/mypick/photographers"
        
        let body : [String:String] = [
            "photographer_id" : phoGrapID
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response : DataResponse<PickPhoGrapVO>) in
            
            switch response.result {
                
            case .success:
                guard let pickResult = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                
                if pickResult.result! {
                    self.view.networkResult(resultData: pickResult, code: "pickPhoGrap")
                }
                else {
                    
                }
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
        }
        
    }
    
    func unpickPhoGrap(phoGrapID:String){
        let URL : String = "\(baseURL)/users/mypick/photos/\(phoGrapID)"
        
 
        Alamofire.request(URL, method: .delete, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response : DataResponse<PickPhoGrapVO>) in
            
            switch response.result {
                
            case .success:
                guard let pickResult = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                
                if pickResult.result! {
                    self.view.networkResult(resultData: pickResult, code: "unpickPhoGrap")
                }
                else {
                    
                }
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
        }
        
    }
    
    
    
}
