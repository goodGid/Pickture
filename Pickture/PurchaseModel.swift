//
//  PurchaseModel.swift
//  Pickture
//
//  Created by ljh on 2017. 7. 6..
//  Copyright © 2017년 기용 신. All rights reserved.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper
import Alamofire

class PurchaseModel : NetworkModel {
    
    
    func getPurchaseList(){
        
        let URL : String = "\(baseURL)/payments/history"
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            (response : DataResponse<PurchaseVO>) in
            
            switch response.result{
                
            case .success:
                
                guard let _pay_history_list = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                
                let pay_history_list = _pay_history_list._pay_history
                
                self.view.networkResult(resultData: pay_history_list, code: "getPayHistorySuccess")
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
        }
    }
}
