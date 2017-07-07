//
//  ModelApplyBoxModel.swift
//  Pickture
//
//  Created by ljh on 2017. 7. 6..
//  Copyright © 2017년 기용 신. All rights reserved.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper
import Alamofire

class ModelApplyBoxModel : NetworkModel {
    
    
    func getModelApplyList(){
        
        let URL : String = "\(baseURL)/recruits/apply"
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            (response : DataResponse<ModelApplyVO>) in
            
            switch response.result{
                
            case .success:
                
                guard let _modelApplyList = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                
                let modelApplyList = _modelApplyList.applies
                
                self.view.networkResult(resultData: modelApplyList, code: "getModelApplyListSuccess")
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
        }
    }
}
