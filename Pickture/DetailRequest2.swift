//
//  DetailRequest2.swift
//  Pickture
//
//  Created by Kiyong Shin on 06/07/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import UIKit

class DetailRequest2 :UIViewController, NetworkCallback {
    @IBOutlet var category: UILabel!
    @IBOutlet var product: UILabel!
    @IBOutlet var member_count: UILabel!
    @IBOutlet var showCalendarBtn: UILabel!
    
    
    
    @IBOutlet weak var phograpID: UILabel!
    @IBOutlet weak var phograpID2: UILabel!
    @IBOutlet weak var phograpImg: UIImageView!
    @IBOutlet weak var phograpImg2: UIImageView!
    
    @IBOutlet weak var phograpMsg2: UITextView!
    @IBOutlet weak var phograpNumber: UILabel!
    
    
    var _photographerID : String?
    var _phograpImg : String?
    
    @IBOutlet weak var inputLocation: UILabel!
    @IBOutlet weak var inputHopeOption: UILabel!
    
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    
    
    override func viewDidLoad() {
        self.phograpID.text = _photographerID
        self.phograpImg.imageFromUrl(_phograpImg, defaultImgPath: "artist")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let model = MyPageModel(self)
        model.getMyRequestResult()
        
    }
    @IBAction func btnPay(_ sender: Any) {
           let _ = navigationController?.popViewController(animated: true)
    }
    
    func networkResult(resultData: Any, code: String)
    {
        if code == "MyRequestResultVO"{
            let _MyRequestResultVO = resultData as! MyRequestResultVO
            
            self.phograpID2.text = _photographerID
            self.phograpImg2.imageFromUrl(_phograpImg, defaultImgPath: "artist")
            
            self.category.text = _MyRequestResultVO.category
            //            self.product.text = _MyRequestResultVO.item
            self.member_count.text = _MyRequestResultVO.category
            self.showCalendarBtn.text = _MyRequestResultVO.checkDate
            
            //            self.phograpMsg2.text = _MyRequestResultVO.comment
            //            self.phograpNumber.text = _MyRequestResultVO.
            
            self.inputHopeOption.text = _MyRequestResultVO.comment
            self.inputLocation.text = _MyRequestResultVO.location
            
            
            
            /*
             img1.imageFromUrl(_MyRequestResultVO., defaultImgPath: "artist")
             img2.imageFromUrl(_MyRequestResultVO., defaultImgPath: "artist")
             img3.imageFromUrl(_MyRequestResultVO., defaultImgPath: "artist")
             */
        }
    }   
}














