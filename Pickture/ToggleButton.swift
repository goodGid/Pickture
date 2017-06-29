//
//  ToggleButton.swift
//  Pickture
//
//  Created by Kiyong Shin on 27/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import Foundation
import UIKit

@objc protocol ToggleButtonDelegate {
    @objc optional func didToggle(_ button: ToggleButton)
}

class ToggleButton: UIButton {
    
    internal var checked = false
    
    internal var checkedColor = UIColor.red
    internal var checkedTextColor = UIColor.white
    internal var unCheckedColor = UIColor.white
    internal var unCheckedTextColor = UIColor.white
    weak var delegate: ToggleButtonDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setBtnClickEvent()
        
    }
    init(){
        super.init(frame: CGRect.zero)
        setBtnClickEvent()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setBtnClickEvent()
    }
    
    func onToggleClick() {
        if checked {
            setButtonChecked(false)
        } else {
            setButtonChecked(true)
        }
        delegate?.didToggle?(self)
    }
    
    func setButtonChecked(_ check: Bool) {
        if check {
            self.setTitleColor(checkedTextColor, for: UIControlState())
            self.backgroundColor = UIColor.blue
//            self.backgroundColor = checkedColor
            self.checked = true
        } else {
            self.setTitleColor(unCheckedTextColor, for: UIControlState())
//            self.backgroundColor = unCheckedColor
            self.backgroundColor = UIColor.black
            self.checked = false
        }
    }
    
    var isChecked: Bool {
        return checked
    }
    
    func setColors(_ checkedBG: UIColor, checkedText: UIColor, unCheckedBG: UIColor, unCheckedText: UIColor) {
        checkedColor = checkedBG
        checkedTextColor = checkedText
        unCheckedColor = unCheckedBG
        unCheckedTextColor = unCheckedText
    }
    
    func setBtnClickEvent() {
        self.addTarget(self, action: #selector(touchBtn(_:)), for: UIControlEvents.touchUpInside)
    }
    
    func touchBtn(_ sender: ToggleButton) {
        onToggleClick()
    }
}
