//
//  ModelHire.swift
//  Pickture
//
//  Created by Kiyong Shin on 02/07/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import UIKit

class ModelHire : UIViewController  {
    
    @IBOutlet weak var phograpMsg: UILabel!
    
    @IBOutlet weak var phogramImg: UIImageView!
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img5: UIImageView!
    
    @IBOutlet weak var conceptPhoto: UILabel!
    @IBOutlet weak var conditionModel: UILabel!
    @IBOutlet weak var photoDate: UILabel!
    @IBOutlet weak var photoLocation: UILabel!

    
    var recruitList : ModelRecruitInfoListWithCateAndLocationVO?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.phograpMsg.text = recruitList?.comment
        self.phogramImg.imageFromUrl(recruitList?._photographer?.profile_url, defaultImgPath: "artist")
        
        self.img1.imageFromUrl(recruitList?._images?[0], defaultImgPath: "artist")
        self.img2.imageFromUrl(recruitList?._images?[1], defaultImgPath: "artist")
        self.img3.imageFromUrl(recruitList?._images?[2], defaultImgPath: "artist")
        self.img4.imageFromUrl(recruitList?._images?[3], defaultImgPath: "artist")
        self.img5.imageFromUrl(recruitList?._images?[4], defaultImgPath: "artist")
        
        self.conceptPhoto.text = recruitList?.concept
        self.conditionModel.text = recruitList?.modelRequired
        self.photoDate.text = recruitList?.dateHours
        self.photoLocation.text = recruitList?.photoPlace
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    @IBAction func btnApply(_ sender: Any) {
        
        let tmpStoryboard = UIStoryboard(name: "Hire", bundle: nil)
        if let svc = tmpStoryboard.instantiateViewController(withIdentifier: "ModelApply") as? ModelApply {
            svc.fromPhograpMsg = recruitList?.comment
            svc.fromPhograpImg = recruitList?._photographer?.profile_url
            self.navigationController?.pushViewController(svc, animated: true)
        }
    }
}









