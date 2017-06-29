//
//  ToggleImageButton.swift
//  Pickture
//
//  Created by Kiyong Shin on 27/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import Foundation
import UIKit

class ToggleImageButton: ToggleButton {
    
    static let CHECK_ON = "check"
    static let CHECK_OFF = "uncheck"
    
    internal var trueImg : UIImage?
    internal var falseImg: UIImage?
    
    func setToggleImages(trueImgName: String?, falseImgName: String?) {
        trueImg = UIImage(named: trueImgName!)
        falseImg = UIImage(named: falseImgName!)
    }
    
    override func setButtonChecked(_ check: Bool) {
        if check {
            self.setImage(trueImg, for: UIControlState())
            self.checked = true
        } else {
            self.setImage(falseImg, for: UIControlState())
            self.checked = false
        }
    }
}


