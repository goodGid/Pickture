//
//  PhoGrapReviewModel.swift
//  Pickture
//
//  Created by ljh on 2017. 7. 4..
//  Copyright © 2017년 기용 신. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper


class PhoGrapReviewModel: NetworkModel {
    
    func showReviews(_ id : String){
        
        let URL : String = "\(baseURL)/photographers/reviews/\(id)"
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            (response : DataResponse<PhoGrapReviewVO>) in
            
            switch response.result{
                
            case .success:
                
                guard let _reviewList = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                
                if _reviewList.result! {
                    let reviewList = _reviewList.reviews!
                    self.view.networkResult(resultData: reviewList, code: "GetRreviewSuccess")
                }
                else {
                    //
                }
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
        }
    }
}

