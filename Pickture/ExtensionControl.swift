//
//  ExtensionControl.swift
//  Pickture
//
//  Created by Kiyong Shin on 25/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import Foundation
import Kingfisher

extension UIViewController{
    
    func simplerAlert(title:String, message msg:String){
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title:"확인",style:.default)
        alert.addAction(okAction)
        present(alert,animated:true)
    }
    
    
    func gsno(_ value:String?)->String{
        
        guard let value_ = value else{
            return ""
        }
        return value_
    }
    
    func gino(_ value:Int?)->Int{
        
        guard let value_ = value else{
            return 0
        }
        return value_
    }
    
    func gfno( _ value:Float?)->Float{
        
        guard let value_ = value else{
            return 0
        }
        return value_
    }

    
    func simpleAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func networkFailed() {
        let alert = UIAlertController(title: "네트워크 오류", message: "인터넷 연결을 확인해주세요.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    
}


extension UIImageView{
    
    
    public func imageFromUrl(_ urlString: String?, defaultImgPath : String) {
        let defaultImg = UIImage(named: defaultImgPath)
        if let url = urlString {
            if url.isEmpty {
                self.image = defaultImg
            } else {
                self.kf.setImage(with: URL(string: url), placeholder: defaultImg, options: [.transition(.fade(0.5))])
            }
        } else {
            self.image = defaultImg
        }
    }
    
    
}
