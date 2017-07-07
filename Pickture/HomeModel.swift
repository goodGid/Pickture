//
//  HomeModel.swift
//  Pickture
//
//  Created by Kiyong Shin on 30/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//


import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON


class HomeModel : NetworkModel {
    
    
    func getPoFolImgList(_ id : String){
        
        let URL : String = "\(baseURL)/photographers/\(id)"
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            (response : DataResponse<PoFolImgVO>) in
            
            switch response.result{
                
            case .success:
                
                guard let boardList = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                
                self.view.networkResult(resultData: boardList, code: "getPoFolImgListCode")
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
        }
    }
    
    func getBestImgList(){
        let URL : String = "\(baseURL)/photographers/best4"
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            (response : DataResponse<BestImgListVO>) in
            
            switch response.result{
                
            case .success:
     
                guard let boardList = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                
                let bestImgList = boardList._photographers
                self.view.networkResult(resultData: bestImgList as Any, code: "getBestImgList")
                
                            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
        }
    }
    
    func getPhograpListFromCate(category : String, empty : String){
        let URL : String = "\(baseURL)/photographers/home2category/\(category)?location=\(empty)"
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response : DataResponse<PhograpListFromCateRpVO>) in
            
            switch response.result{
                
            case .success:
                
                guard let _phoGrapList = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                let phoGrapList = _phoGrapList._photographersList
                
                self.view.networkResult(resultData: phoGrapList as Any, code: "getPhograpListFromCate")
                
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
   
    func setWriteBills(photographer_id:String, category:String, location:String, cntPeople: Int ,date: Int, item: Int, comment: String, imageData1 : Data?, imageData2 : Data?, imageData3 : Data?){
        let URL : String = "\(baseURL)/requests"
        
        let photographer_id = photographer_id.data(using: .utf8)
        let category = category.data(using: .utf8)
        let location = location.data(using: .utf8)
        let comment = comment.data(using: .utf8)
        let cntPeople = String(cntPeople).data(using: .utf8)
        let date = String(date).data(using: .utf8)
        let item = String(item).data(using: .utf8)
        
        
        if imageData1 == nil{
            
        }else if imageData2 == nil{
            
        }else if imageData3 == nil{
            
        }else {
            Alamofire.upload(multipartFormData : { multipartFormData in
                multipartFormData.append(imageData1!, withName: "image", fileName: "image1.jpg", mimeType: "image/png")
                multipartFormData.append(imageData2!, withName: "image", fileName: "image2.jpg", mimeType: "image/png")
                multipartFormData.append(imageData3!, withName: "image", fileName: "image3.jpg", mimeType: "image/png")
                
                
                multipartFormData.append(photographer_id!, withName: "photographer_id")
                multipartFormData.append(category!, withName: "category")
                multipartFormData.append(location!, withName: "location")
                multipartFormData.append(comment!, withName: "comment")
                multipartFormData.append(date!, withName: "date")
                multipartFormData.append(item!, withName: "item")
                multipartFormData.append(cntPeople!, withName: "cntPeople")
            },
                             
                             to: URL,
                             encodingCompletion: { encodingResult in
                                
                                switch encodingResult{
                                case .success(let upload, _, _):
                                    upload.responseData { res in
                                        switch res.result {
                                        case .success:
                                            if res.result.value != nil {
                                                DispatchQueue.main.async(execute: {
                                                    self.view.networkResult(resultData: "", code: "setWriteBills")
                                                })
                                            }//if let value
                                        case .failure(let err):
                                            print("upload Error : \(err)")
                                            DispatchQueue.main.async(execute: {
                                                self.view.networkFailed()
                                            })
                                        }
                                    }
                                case .failure(let err):
                                    print("network Error : \(err)")
                                    self.view.networkFailed()
                                }//switch
                    }
            )//Alamofire.upload
        }
    }
    
    func getMyPickListFromSendRequest(){
        let URL : String = "\(baseURL)/users/mypick/photos"
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response : DataResponse<MyPickListFromSendRequestRpVO>) in
            
            switch response.result{
                
            case .success:
                
                guard let _imgList = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                
                let imgList = _imgList._photos
                
                self.view.networkResult(resultData: imgList as Any, code: "getMyPickListFromSendRequest")
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
        }
    }
    
    
    
    func getPhograpProductList(id : String){
        let URL : String = "\(baseURL)/photographers/items/\(id)"
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            (response : DataResponse<PhograpProductListRpVO>) in
            
            switch response.result{
                
            case .success:
                
                guard let _itemList = response.result.value else{
                    self.view.networkFailed()
                    return
                }
                let itemList = _itemList._items
                
                self.view.networkResult(resultData: itemList as Any, code: "getPhograpListFromCate")
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
        }
    }
 
    
    
    
    
}
