//
//  WriteReview.swift
//  Pickture
//
//  Created by Kiyong Shin on 06/07/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import UIKit
import Cosmos

class WriteReview : UIViewController, NetworkCallback {
    
    @IBOutlet weak var rating: CosmosView!
    
    @IBOutlet weak var phograpImg: UIImageView!
    @IBOutlet weak var phograpID: UILabel!
    @IBOutlet weak var inputTxt: UITextView!
    
    var _phograImg : String?
    var _phograID : String?
    
    
    
    override func viewDidLoad() {
        
        self.phograpImg.imageFromUrl(_phograImg, defaultImgPath: "artist")
        self.phograpID.text = _phograID
        
        // Set the color of a filled star
        rating.settings.filledColor = UIColor.orange
        
        // Set the border color of an empty star
        rating.settings.emptyBorderColor = UIColor.white
        
        // Set the border color of a filled star
        rating.settings.filledBorderColor = UIColor.orange
        
        rating.settings.starMargin = 5
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let model = MyPageModel(self)
        model.setWriteReview(rating: Float(rating.rating), text: inputTxt.text )
    }
    
    
    func networkResult(resultData: Any, code: String) {
        
    }
    
    @IBAction func btnWriteReview(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
