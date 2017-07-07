//
//  PhoGrapJoin_2.swift
//  Pickture
//
//  Created by Kiyong Shin on 27/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import UIKit

class PhoGrapJoin_2: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UIGestureRecognizerDelegate, NetworkCallback {
    
    @IBOutlet weak var place_category: UITextField!
    @IBOutlet weak var btnCancle_Custom: UIButton!
    @IBOutlet weak var btnDone_Custom: UIButton!
    
    @IBOutlet weak var chkDate: CheckBox!
    @IBOutlet weak var chkFriends: CheckBox!
    @IBOutlet weak var chkWedding: CheckBox!
    @IBOutlet weak var chkBaby: CheckBox!
    @IBOutlet weak var chkProfile: CheckBox!
    @IBOutlet weak var chkEtc: CheckBox!
    
    @IBOutlet weak var SecondBg: UIImageView!
    
    
    var place_picker = UIPickerView()
    
    var place_data =  ["서울", "경기∙인천", "강원", "충북∙세종", "충남∙대전", "경북∙대구", "경남∙울산∙대구", "전북", "전남∙광주", "제주"]
    
    var place_Toolbar = UIToolbar()
    
    var place_category_index : Int?
  
    
    
    // UserJoin_1에서 넘겨줄 Data
    var id : String?
    var password : String?
    override func viewDidLoad() {
        initPickerView()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap_mainview(_: )))
        tap.delegate = self
        self.view.addGestureRecognizer(tap)
        
        SecondBg.layer.cornerRadius = 15
        SecondBg.layer.opacity = 0.52
        
        
        btnCancle_Custom.roundedButton()
        btnDone_Custom.roundedButton()

        
        chkDate.setImage(UIImage(named: "uncheckbox"), for: UIControlState())
        chkFriends.setImage(UIImage(named: "uncheckbox"), for: UIControlState())
        chkWedding.setImage(UIImage(named: "uncheckbox"), for: UIControlState())
        chkBaby.setImage(UIImage(named: "uncheckbox"), for: UIControlState())
        chkProfile.setImage(UIImage(named: "uncheckbox"), for: UIControlState())
        chkEtc.setImage(UIImage(named: "uncheckbox"), for: UIControlState())
        
        
        
        chkDate.setToggleImages(trueImgName: "checkbox", falseImgName: "uncheckbox")
        chkFriends.setToggleImages(trueImgName: "checkbox", falseImgName: "uncheckbox")
        chkWedding.setToggleImages(trueImgName: "checkbox", falseImgName: "uncheckbox")
        chkBaby.setToggleImages(trueImgName: "checkbox", falseImgName: "uncheckbox")
        chkProfile.setToggleImages(trueImgName: "checkbox", falseImgName: "uncheckbox")
        chkEtc.setToggleImages(trueImgName: "checkbox", falseImgName: "uncheckbox")
    }

    
    
    override func viewWillAppear(_ animated: Bool) {
        registerForKeyboardNotifications()
    }
    override func viewWillDisappear(_ animated: Bool) {
        unregisterForKeyboardNotifications()
    }
    
    
    
    @IBAction func btnDone(_ sender: Any) {
        /*
        let _id = gsno(id)
        let _password = gsno(password)
        
         let model = RegisterModel(self)
        model.registerUser(id: _id, password: _password)
        */
        
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "Login")
        present(vc!, animated: true)
        
        
    }
    
    @IBAction func btnCancle(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func networkResult(resultData: Any, code: String){
        navigationController?.popViewController(animated: true)
    }
    
  
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // Pickerview
    ////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    func initToolbar(){
        let barFrame = CGRect(x: 0, y: 0, width: view.frame.width, height: 40)
        
        //btnSpace는 툴바에서의 빈 공간입니다
        //차이점을 눈으로 보고싶으시다면
        //btnSpace에 주석처리를 한뒤
        //toobar,setitems() 메소드 내부에서 btnSpace 를 제외하고 빌드시켜보시기 바랍니다
        let btnSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        let place_btnDone = UIBarButtonItem(title: "선택", style: .done, target: self, action: #selector(selectedPlace))
        place_Toolbar = UIToolbar(frame: barFrame)
        place_Toolbar.setItems([btnSpace,place_btnDone], animated: true)
    }
    
    //각각의 피커뷰가 반환해야 하는 목록의 갯수 설정
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //1. place 피커뷰 데이터 목록 갯수 반환
        if pickerView == place_picker {
            return place_data.count
        }
            
            /*
             else if pickerView == month_picker{
             return month_data.count
             }
             else if pickerView == day_picker{
             return day_data.count
             }
             */
            
        else
        {
            return 0
        }
    }
    
    //피커뷰 목록의 타이틀 반환
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return place_data[row]
    }
    
    //피커뷰의 컴포넌트는 각각 1개
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func selectedPlace(){
        initPickerView()
        
        let row = place_picker.selectedRow(inComponent: 0)
        place_category.text = place_data[row]
        place_category_index = row
        
        //피커뷰에서 선택한 텍스트필드 값을 변경되지 않게 막아줍니다
        place_category.endEditing(true)
    }
    
    func initPickerView(){
        initToolbar()
        
        place_picker.dataSource = self
        place_picker.delegate = self
        place_picker.dataSource = self
        place_category.inputView = place_picker
        place_category.inputAccessoryView = place_Toolbar
    }
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // Key Board
    ////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    //resignFirsReponder
    func handleTap_mainview(_ sender: UITapGestureRecognizer?) {
        
        
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
    
    @IBAction func btnChkDate(_ sender: Any) {
        if chkDate.checked{
            chkDate.setButtonChecked(true)
        }
        else {
            chkDate.setButtonChecked(false)
        }
    }
    
    @IBAction func btnChkFriends(_ sender: Any) {
        if chkFriends.checked{
            chkFriends.setButtonChecked(true)
        }
        else {
            chkFriends.setButtonChecked(false)
        }
    }
    @IBAction func btnChkWedding(_ sender: Any) {
        if chkWedding.checked{
            chkWedding.setButtonChecked(true)
        }
        else {
            chkWedding.setButtonChecked(false)
        }
    }
    @IBAction func btnChkBaby(_ sender: Any) {
        if chkBaby.checked{
            chkBaby.setButtonChecked(true)
        }
        else {
            chkBaby.setButtonChecked(false)
        }
    }
    @IBAction func btnChkProfile(_ sender: Any) {
        if chkProfile.checked{
            chkProfile.setButtonChecked(true)
        }
        else {
            chkProfile.setButtonChecked(false)
        }
    }
    
    @IBAction func btnChkEtc(_ sender: Any) {
        if chkEtc.checked{
            chkEtc.setButtonChecked(true)
        }
        else {
            chkEtc.setButtonChecked(false)
        }
    }
    
}



