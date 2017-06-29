//
//  ViewController.swift
//  Pickture
//
//  Created by Kiyong Shin on 25/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import UIKit

class Login: UIViewController, UIGestureRecognizerDelegate {
    
    
    @IBOutlet weak var inputID: UITextField!
    @IBOutlet weak var inputPW: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnFBLogin: UIButton!
    
    var check = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
     
//        btnLogin.layer.cornerRadius = 20
        btnFBLogin.layer.cornerRadius = 20
        
//        btnLogin.roundedButton()
        
//        btnLogin.layer.borderWidth = 1
//        btnLogin.layer.borderColor =  UIColor(red:0.89, green:0.65, blue:0.14, alpha:1.0).cgColor
        

        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap_mainview(_: )))
        tap.delegate = self
        self.view.addGestureRecognizer(tap)
        
        inputID.setBottomBorder()
        inputPW.setBottomBorder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        registerForKeyboardNotifications()
    }
    override func viewWillDisappear(_ animated: Bool) {
        unregisterForKeyboardNotifications()
    }
    
    @IBAction func regUser(_ sender: Any) {
        if let svc = storyboard?.instantiateViewController(withIdentifier: "UserJoin") as? UserJoin {
            present(svc, animated: true, completion: nil)
        }
    }
    
 
    @IBAction func regPhotographer(_ sender: Any) {
        if let svc = storyboard?.instantiateViewController(withIdentifier: "PhoGrapJoin_1") as? PhoGrapJoin_1 {
            present(svc, animated: true, completion: nil)
        }
    }
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // Key Board
    ////////////////////////////////////////////////////////////////////////////////////////////////
    
   
    //resignFirsReponder
    func handleTap_mainview(_ sender: UITapGestureRecognizer?) {
        self.inputID.resignFirstResponder()
        self.inputPW.resignFirstResponder()
    }
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    
    func unregisterForKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name:NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWillShow(note: NSNotification) {
        //        adjustKeyboardHeight(true, note)
    }
    
    func keyboardWillHide(note: NSNotification) {
        //        adjustKeyboardHeight(false, note)
    }
    
    
    
}



