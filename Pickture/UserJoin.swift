//
//  UserJoin_2.swift
//  Pickture
//
//  Created by Kiyong Shin on 27/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import UIKit

class UserJoin : UIViewController, UIGestureRecognizerDelegate, NetworkCallback {
    
    @IBOutlet weak var checkBoy: CheckBox!
    @IBOutlet weak var checkGirl: CheckBox!
    
    @IBOutlet weak var SecondBg: UIImageView!
    var chkID : Int = 0
    
    @IBOutlet weak var txtID: UITextField!
    @IBOutlet weak var txtPW: UITextField!
    @IBOutlet weak var txtPW2: UITextField!
    
    @IBOutlet weak var btnChkID_Custom: UIButton!
    @IBOutlet weak var btnCancle_Custom: UIButton!
    @IBOutlet weak var btnDone_Custom: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap_mainview(_: )))
        tap.delegate = self
        self.view.addGestureRecognizer(tap)
        
        SecondBg.layer.cornerRadius = 15
        SecondBg.layer.opacity = 0.52

        txtID.setBottomBorder()
        txtPW.setBottomBorder()
        txtPW2.setBottomBorder()
        
        btnChkID_Custom.roundedButton()
        btnCancle_Custom.roundedButton()
        btnDone_Custom.roundedButton()
        

        checkBoy.setImage(UIImage(named: "uncheck"), for: UIControlState())
        checkGirl.setImage(UIImage(named: "uncheck"), for: UIControlState())
        
        
        checkBoy.setToggleImages(trueImgName: "check", falseImgName: "uncheck")
        checkGirl.setToggleImages(trueImgName: "check", falseImgName: "uncheck")
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        registerForKeyboardNotifications()
    }
    override func viewWillDisappear(_ animated: Bool) {
        unregisterForKeyboardNotifications()
    }
    
    
    // id 중복 체크
    @IBAction func btnChkID(_ sender: Any) {
        let _id = gsno(txtID.text)
        
        let model = RegisterModel(self)
        model.chkID(id: _id)
    }
    
    
    @IBAction func btnCancle(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func networkResult(resultData: Any, code: String){
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnDone(_ sender: Any) {
        guard var _id = txtID.text, var _password = txtPW.text, var _password2 = txtPW2.text else{
            return
        }
        
        /*
        if checkBoy.checked == false && checkGirl.checked  == false {
            simpleAlert(title: "입력 오류", msg: "성별을 입력해주세요.")
            return
        }
        if _id.isEmpty {
            simpleAlert(title: "입력 오류", msg: "ID를 입력해주세요.")
            return
        }
        if _password.isEmpty {
            simpleAlert(title: "입력 오류", msg: "PW를 입력해주세요.")
            return
        }
        if _password != _password2 {
            simpleAlert(title: "입력 오류", msg: "PW가 불일치 합니다.")
        }
        */
        
        _id = gsno(_id)
        _password = gsno(_password)
        
        let model = RegisterModel(self)
        model.registerUser(id: _id, password: _password)
        dismiss(animated: true, completion: nil)
        
    }
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // Key Board
    ////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    //resignFirsReponder
    func handleTap_mainview(_ sender: UITapGestureRecognizer?) {
        self.txtID.resignFirstResponder()
        self.txtPW.resignFirstResponder()
        self.txtPW2.resignFirstResponder()
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
    

    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // Check Box
    ////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
    @IBAction func btnChkBoy(_ sender: Any) {
        if checkBoy.checked{
            checkBoy.setButtonChecked(true)
            checkGirl.setButtonChecked(false)
        }
        else {
            checkBoy.setButtonChecked(false)
            checkGirl.setButtonChecked(true)
        }
    }
    
    @IBAction func btnChkGirl(_ sender: Any) {
        if checkGirl.checked{
            checkBoy.setButtonChecked(false)
            checkGirl.setButtonChecked(true)
        }
        else {
            checkBoy.setButtonChecked(true)
            checkGirl.setButtonChecked(false)
        }
    }
    
}
