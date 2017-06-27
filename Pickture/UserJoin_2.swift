//
//  UserJoin.swift
//  Pickture
//
//  Created by Kiyong Shin on 26/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import UIKit

class UserJoin_2: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UIGestureRecognizerDelegate, NetworkCallback {

    @IBOutlet weak var year_category: UITextField!
    
    var year_picker = UIPickerView()

    var year_data = ["1900","1901","1902"]
    
    var year_Toolbar = UIToolbar()
    
    var year_category_index : Int?
    
    
    // UserJoin_1에서 넘겨줄 Data
    var sex : String?
    var username : String?
    var password : String?
    
    
    
    
    override func simpleAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    
    @IBAction func btnDone(_ sender: Any) {
        
        
        var _sex = gsno(sex)
        let _username = gsno(username)
        var _password = gsno(password)
        
        _sex = "aksgur"
        _password = "123a4"
        
        
        let model = RegisterModel(self)
        model.registerUser(sex: _sex, username: _username, password: _password)
        
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "Login")
        present(vc!, animated: true)
        
        
    }
    
    @IBAction func btnCancle(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Login")
        present(vc!, animated: true)
    }
    
    func networkResult(resultData: Any, code: String){
        navigationController?.popViewController(animated: true)
    }
    
    
    
    override func viewDidLoad() {
        initPickerView()
    }
    
    func initToolbar(){
        let barFrame = CGRect(x: 0, y: 0, width: view.frame.width, height: 40)
        
        //btnSpace는 툴바에서의 빈 공간입니다
        //차이점을 눈으로 보고싶으시다면
        //btnSpace에 주석처리를 한뒤
        //toobar,setitems() 메소드 내부에서 btnSpace 를 제외하고 빌드시켜보시기 바랍니다
        let btnSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
    
        let year_btnDone = UIBarButtonItem(title: "선택", style: .done, target: self, action: #selector(selectedYear))
        year_Toolbar = UIToolbar(frame: barFrame)
        year_Toolbar.setItems([btnSpace,year_btnDone], animated: true)
    }
    
    //각각의 피커뷰가 반환해야 하는 목록의 갯수 설정
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //1. year 피커뷰 데이터 목록 갯수 반환
        if pickerView == year_picker {
            return year_data.count
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
        return year_data[row]
    }
    
    //피커뷰의 컴포넌트는 각각 1개
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    
    
    func selectedYear(){
        initPickerView()
        
        let row = year_picker.selectedRow(inComponent: 0)
        print("year picker")
        print(row)
        year_category.text = year_data[row]
        year_category_index = row
        
        //피커뷰에서 선택한 텍스트필드 값을 변경되지 않게 막아줍니다
        year_category.endEditing(true)
    }
    
    func initPickerView(){
        initToolbar()
       
        year_picker.dataSource = self
        year_picker.delegate = self
        year_picker.dataSource = self
        year_category.inputView = year_picker
        year_category.inputAccessoryView = year_Toolbar
    }
    
}

