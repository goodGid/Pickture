//
//  PhograpInfoVO.swift
//  Pickture
//
//  Created by Kiyong Shin on 04/07/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON


class PhograpInfoModel : NetworkModel {
    
    
    func getPoFolImglist(_ id : String){
        let URL : String = "\(baseURL)/photographers/portfolio/\(id)"
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response : DataResponse<PhograpPoFolImgListRpVO>) in
            
            switch response.result{
                
            case .success:
                
                guard let _boardList = response.result.value else{
                    self.view.networkFailed()
                    return
                }

                let phoGrapList = _boardList._pictures
                
                self.view.networkResult(resultData: phoGrapList as Any as Any, code: "getPoFolImglist")
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
        }
    }
    
    func getInfolist(_ id : String){
        let URL : String = "\(baseURL)/photographers/info/\(id)"
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response : DataResponse<PhograpInfolistRpVO>) in
            
            switch response.result{
                
            case .success:
                
                guard let phoGrapList = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                
                if phoGrapList.result! {
                self.view.networkResult(resultData: phoGrapList, code: "getInfolist")
                }
                else {
                    print(" Data Error ")
                }
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
        }
    }
    
}

