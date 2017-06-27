//
//  UserJoin_2.swift
//  Pickture
//
//  Created by Kiyong Shin on 27/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import UIKit

class UserJoin : UIViewController, NetworkCallback {
    
    @IBOutlet weak var checkBoy: CheckBox!
    @IBOutlet weak var checkGirl: CheckBox!
    
    var chkID : Int = 0
    
    @IBOutlet weak var txtID: UITextField!
    @IBOutlet weak var txtPW: UITextField!
    @IBOutlet weak var txtPW2: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkBoy.setToggleImages(trueImgName: "joinbutton_public", falseImgName: "joinbutton_photographer")
        checkGirl.setToggleImages(trueImgName: "joinbutton_public", falseImgName: "joinbutton_photographer")
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
        let _id = gsno(txtID.text)
        let _password = gsno(txtPW.text)
        
        let model = RegisterModel(self)
        model.registerUser(id: _id, password: _password)
    }
    
    
    @IBAction func btnChkBoy(_ sender: Any) {
        if checkBoy.checked{
            print(" boy check ")
            checkBoy.setButtonChecked(true)
            checkGirl.setButtonChecked(false)
        }
        else {
            print(" boy uncheck ")
            checkBoy.setButtonChecked(false)
            checkGirl.setButtonChecked(true)
        }
    }
    
    @IBAction func btnChkGirl(_ sender: Any) {
        if checkGirl.checked{
            print(" girl check ")
            checkBoy.setButtonChecked(false)
            checkGirl.setButtonChecked(true)
        }
        else {
            print(" girl uncheck ")
            checkBoy.setButtonChecked(true)
            checkGirl.setButtonChecked(false)
        }
    }
    
}
