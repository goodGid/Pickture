//
//  MyPageModel.swift
//  Pickture
//
//  Created by Kiyong Shin on 06/07/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//


import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON

class MyPageModel : NetworkModel {
    
    // MyPage 첫 View Load시 실행
    func getMyRequestResult(){
        
        let URL : String = "\(baseURL)/requests"
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            (response : DataResponse<MyRequestResultRpVO>) in
            
            switch response.result{
                
            case .success:
                
                guard let _result = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                let result = _result._requests
                
                self.view.networkResult(resultData: result as Any, code: "getMyRequestResult")
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
        }
    }
    
    func setWriteReview(rating:Float, text:String){
        let URL : String = "\(baseURL)/requests"
        
        
        let body : [String : Any] = [
            "rating" : rating,
            "text" : text
        ]
        
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response : DataResponse<WriteReviewRpVO>) in
            
            switch response.result {
            case .success:
                guard let writeReview = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                
                if writeReview.result! {
                    self.view.networkResult(resultData: writeReview, code: "setWriteReview")
                }
                else {
                    
                }
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
        }
    }
    
        
        
    
    
    
    
    
    
    
    func getPhograpListFromCateWithLocation(category : String, location: String){
        
        var URL : String = "\(baseURL)/photographers/search?category=\(category)&location="
        let query = "\(location)"
        let encodeQuery = query.addingPercentEscapes(using: .utf8)
        URL = URL + encodeQuery!
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response : DataResponse<PhograpListFromCateRpVO>) in
            
            switch response.result{
                
            case .success:
                
                guard let _phoGrapList = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                
                let phoGrapList = _phoGrapList._photographersList
                
                self.view.networkResult(resultData: phoGrapList as Any, code: "getPhograpListFromCateWithLocation")
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
        }
    }
    
}
