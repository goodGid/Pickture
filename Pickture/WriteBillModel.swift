//
//  UploadImage.swift
//  Pickture
//
//  Created by Kiyong Shin on 28/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class WriteBillModel : NetworkModel {

    
    func writeBoardWithImage(title:String, content:String, writer:String,imageData:Data?){
        
        let URL = "\(baseURL)"
        
        let title = title.data(using: .utf8)
        let content = content.data(using: .utf8)
        let writer = writer.data(using: .utf8)
        
        if imageData == nil{
            
        }else{
            
            Alamofire.upload(multipartFormData : { multipartFormData in
                
                //멀티파트를 이용해 데이터를 담습니다
                multipartFormData.append(imageData!, withName: "image", fileName: "image.jpg", mimeType: "image/png")
                multipartFormData.append(title!, withName: "title")
                multipartFormData.append(content!, withName: "content")
                multipartFormData.append(writer!, withName: "username")
            },
                             
                             to: URL,
                             encodingCompletion: { encodingResult in
                                
                                switch encodingResult{
                                case .success(let upload, _, _):
                                    upload.responseData { res in
                                        switch res.result {
                                        case .success:
                                            //GCD와 관련된 내용의 코드입니다
                                            //메인스레드 하위스레드와 관련된 내용이고
                                            //추후에 8차세미나에 시간적 여유가 생긴다면 설명드리겠습니다
                                            //일단은 지금은 이미지를 보낼때 사용해주세요
                                            DispatchQueue.main.async(execute: {
                                                self.view.networkResult(resultData: "", code: "")
                                            })
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

    
    
}
