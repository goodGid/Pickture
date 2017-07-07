//
//  PickPhotoModel.swift
//  Pickture
//
//  Created by ljh on 2017. 7. 6..
//  Copyright © 2017년 기용 신. All rights reserved.
//

import Foundation
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

class PickPhotoModel: NetworkModel {
    
    func pickPhoto(photoID:String){
        let URL : String = "\(baseURL)/users/mypick/photos"
        
        let body : [String:String] = [
            "photo_id" : photoID
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response : DataResponse<PickPhotoVO>) in
            
            switch response.result {
                
            case .success:
                guard let pickResult = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                
                if pickResult.result! {
                    
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
