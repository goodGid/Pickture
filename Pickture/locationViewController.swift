//
//  locationViewController.swift
//  Pickture
//
//  Created by Kiyong Shin on 02/07/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire

final class locationViewController: UIViewController, UIGestureRecognizerDelegate, NetworkCallback {
    
    @IBOutlet weak var location_category: UITextField!
    
    @IBOutlet weak var phograpListTable: UITableView!
    
    
    
    var phoGrapInfo : [PhoGrapVO] = [PhoGrapVO]()
    var phoGrapInfo2 : [String] = ["1", "2", "3", "4"]
    
    
    
    var location_picker = UIPickerView()
    var location_data =  ["서울", "경기∙인천", "강원", "충북∙세종", "충남∙대전", "경북∙대구", "경남∙울산∙대구", "전북", "전남∙광주", "제주"]
    
    var location_Toolbar = UIToolbar()
    var location_category_index : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initPickerView()
        self.phograpListTable.delegate = self
        self.phograpListTable.dataSource = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap_mainview(_: )))
        tap.delegate = self
        self.view.addGestureRecognizer(tap)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        /*
        let model = HomeModel(self)
        model.getPhograpListFromCate(category: "date")
         */
    }
    
    func networkResult(resultData: Any, code: String) {
        if code == "getPhograpListFromCate"{
//            phograpLists = resultData as! [photographersVO]
//            CateListTable.reloadData()
        }
    }
    
    
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // Key Board
    ////////////////////////////////////////////////////////////////////////////////////////////////
    
    func handleTap_mainview(_ sender: UITapGestureRecognizer?) {
        self.location_picker.resignFirstResponder()
        
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
        
    }
    
    func keyboardWillHide(note: NSNotification) {
        
    }
    
    
    
}

extension locationViewController : UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        //  Edit Scope !
        //        return threedaysForecast.count
        
        
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.phograpListTable.dequeueReusableCell(withIdentifier: "PhoGrapLocationCell") as! PhoGrapCell
        /*
         Edit Scope !
         
         let forecast = threedaysForecast[indexPath.row]
         cell.temperatureTxt.text = "\(forecast.temperature!)"
         cell.weatherImg.image = UIImage(named: forecast.conditions!)
         */
        return cell
    }
    
}






extension locationViewController : UIPickerViewDelegate,UIPickerViewDataSource {
    
    func initToolbar(){
        let barFrame = CGRect(x: 0, y: 0, width: view.frame.width, height: 40)
        
        //btnSpace는 툴바에서의 빈 공간입니다
        //차이점을 눈으로 보고싶으시다면
        //btnSpace에 주석처리를 한뒤
        //toobar,setitems() 메소드 내부에서 btnSpace 를 제외하고 빌드시켜보시기 바랍니다
        let btnSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        let location_btnDone = UIBarButtonItem(title: "선택", style: .done, target: self, action: #selector(selectedlocation))
        location_Toolbar = UIToolbar(frame: barFrame)
        location_Toolbar.setItems([btnSpace,location_btnDone], animated: true)
    }
    
    //각각의 피커뷰가 반환해야 하는 목록의 갯수 설정
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == location_picker {
            return location_data.count
        }
        else
        {
            return 0
        }
    }
    
    //피커뷰 목록의 타이틀 반환
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return location_data[row]
    }
    
    //피커뷰의 컴포넌트는 각각 1개
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func selectedlocation(){
        initPickerView()
        
        let row = location_picker.selectedRow(inComponent: 0)
        location_category.text = location_data[row]
        location_category_index = row
        
        //피커뷰에서 선택한 텍스트필드 값을 변경되지 않게 막아줍니다
        location_category.endEditing(true)
    }
    
    func initPickerView(){
        initToolbar()
        
        location_picker.dataSource = self
        location_picker.delegate = self
        location_picker.dataSource = self
        location_category.inputView = location_picker
        location_category.inputAccessoryView = location_Toolbar
    }
}
