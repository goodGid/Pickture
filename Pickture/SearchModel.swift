//
//  SearchModel.swift
//  Pickture
//
//  Created by Kiyong Shin on 06/07/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON


class SearchModel : NetworkModel {
    
    
    func getSearchList(_ value : String){
        var URL : String = "\(baseURL)/photographers/search/"
        let query = "\(value)"
        let encodeQuery = query.addingPercentEscapes(using: .utf8)
        URL = URL + encodeQuery!
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            (response : DataResponse<SearchListRpVO>) in
            
            switch response.result{
                
            case .success:
                
                guard let _searchList = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                
                let searchList = _searchList._photographers
                
                
                self.view.networkResult(resultData: searchList as Any, code: "getSearchList")
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
        }
    }
    
    
    func getPhograpListFromCateWithLocation(category : String, location: String){
        var URL : String = "\(baseURL)/photographers/home2category/\(category)?location="
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

