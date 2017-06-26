//
//  ViewController.swift
//  Pickture
//
//  Created by Kiyong Shin on 25/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import UIKit

class Login: UIViewController {
    @IBOutlet weak var inputID: UITextField!
    @IBOutlet weak var inputPW: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        inputID.setBottomBorder()
        inputPW.setBottomBorder()
        
        print("test")
    }
}


extension UITextField
{
    func setBottomBorder()
    {
        self.borderStyle = UITextBorderStyle.none;
        let border = CALayer()
        let width = CGFloat(1.0)
    
        border.borderColor =  UIColor(red:0.58, green:0.60, blue:0.60, alpha:1.0).cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width,   width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
}
