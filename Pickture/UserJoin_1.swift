//
//  UserJoin_2.swift
//  Pickture
//
//  Created by Kiyong Shin on 27/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import UIKit

class UserJoin_1 : UIViewController {
    
    @IBOutlet weak var checkBoy: CheckBox!
    @IBOutlet weak var checkGirl: CheckBox!
    
    var sex : String?
    var chkID : Int = 0
    
    @IBOutlet weak var txtID: UITextField!
    @IBOutlet weak var txtPW: UITextField!
    @IBOutlet weak var txtPW2: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkBoy.setToggleImages(trueImgName: "joinbutton_public", falseImgName: "joinbutton_photographer")
        checkGirl.setToggleImages(trueImgName: "joinbutton_public", falseImgName: "joinbutton_photographer")
    }
    
    @IBAction func btnChkID(_ sender: Any) {
        
        /*
         중복 체크해서 
         중복되는거 없으면
         chkID = 1 로 수정해주기
         */
        
    }
    
    @IBAction func btnCancle(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Login")
        present(vc!, animated: true)
    }
    
    
    @IBAction func nextTapped(_ sender: Any) {
        let _sex = sex
        let _username = txtID.text
        let _password = txtPW.text
        
        if let svc = storyboard?.instantiateViewController(withIdentifier: "UserJoin_2") as? UserJoin_2 {
            
            svc.sex = _sex
            svc.username = _username
            svc.password = _password
            present(svc, animated: true, completion: nil)
//            navigationController?.pushViewController(svc, animated: true)
        }
            
        else{
            simpleAlert(title: "동의 미설정", msg: "약관을 모두 체크해주세요 !")
        }

    }
    
    
    @IBAction func btnChkBoy(_ sender: Any) {
        if checkBoy.checked{
            print(" boy check ")
            sex = "man"
            checkBoy.setButtonChecked(true)
            checkGirl.setButtonChecked(false)
        }
        else {
            print(" boy uncheck ")
            sex = "girl"
            checkBoy.setButtonChecked(false)
            checkGirl.setButtonChecked(true)
        }
    }
    
    @IBAction func btnChkGirl(_ sender: Any) {
        if checkGirl.checked{
            print(" girl check ")
            sex = "girl"
            checkBoy.setButtonChecked(false)
            checkGirl.setButtonChecked(true)
        }
        else {
            print(" girl uncheck ")
            sex = "man"
            checkBoy.setButtonChecked(true)
            checkGirl.setButtonChecked(false)
        }
    }
    
}
