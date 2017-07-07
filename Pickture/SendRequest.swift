//
//  SendRequest.swift
//  Pickture
//
//  Created by ljh on 2017. 6. 30..
//  Copyright © 2017년 기용 신. All rights reserved.
//

import UIKit
import EPCalendarPicker

protocol SendRequestDelegate {
    func passData(data : String)
}

class SendRequest : UIViewController, UINavigationControllerDelegate, NetworkCallback{
    
    @IBOutlet var category: UITextField!
    @IBOutlet var product: UITextField!
    @IBOutlet var member_count: UITextField!
    @IBOutlet var showCalendarBtn: UIButton!
    
    var delegate: SendRequestDelegate?
    
    var cetegory_picker = UIPickerView()
    var product_picker = UIPickerView()
    var member_picker = UIPickerView()
    
    var category_Toolbar = UIToolbar()
    var product_Toolbar = UIToolbar()
    var member_Toolbar = UIToolbar()
    
    
    var pickedImg1 : UIImage?
    var pickedImg2 : UIImage?
    var pickedImg3 : UIImage?
    
    
    var full_date_string : String?
    
    @IBOutlet weak var phograpMsg: UILabel!
    @IBOutlet weak var phograpImg: UIImageView!
    
    var photographer_id : String?
    var _phograpImg : String?
    var _productIndex : Int?
    
    @IBOutlet weak var inputLocation: UITextField!
    @IBOutlet weak var inputHopeOption: UITextField!
    
    
//    var category_data : [String] = ["우정","아기"]
    var category_data =  ["서울", "경기∙인천", "강원", "충북∙세종", "충남∙대전", "경북∙대구", "경남∙울산∙대구", "전북", "전남∙광주", "제주"]
    var product_data : [PhograpProductListVO] = [PhograpProductListVO]()
    var member_count_data : [String] = ["1","2","3","4","5","6","7","8","9","10"]
    
    @IBOutlet weak var btnPick1: UIButton!
    @IBOutlet weak var btnPick2: UIButton!
    @IBOutlet weak var btnPick3: UIButton!
    
    var imagePicked = 0
    
    override func viewDidLoad() {
        btnPick1.tag = 1
        btnPick2.tag = 2
        btnPick3.tag = 3
        initPickerView()
        
        category.layer.cornerRadius = 20
        product.layer.cornerRadius = 20
        member_count.layer.cornerRadius = 20
        showCalendarBtn.layer.cornerRadius = 20
        
        inputHopeOption.setBottomBorder()
        inputLocation.setBottomBorder()
        
        
        
        self.phograpMsg.text = photographer_id
        self.phograpImg.imageFromUrl(_phograpImg, defaultImgPath: "artist")
        self.phograpImg.layer.cornerRadius = (self.phograpImg?.frame.size.width)! / 2
        self.phograpImg.layer.masksToBounds = true
        
    }
    
    func networkResult(resultData: Any, code: String)
    {
        if code == "getPhograpProductList"{
                product_data = resultData as! [PhograpProductListVO]
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let model = HomeModel(self)
        model.getPhograpProductList(id: photographer_id!)
        registerForKeyboardNotifications()
    }
    override func viewWillDisappear(_ animated: Bool) {
        unregisterForKeyboardNotifications()
    }
  

    
    ////////////////////////////////////////////
    //////// 사진 선택 코드 ////////////////////////
    ////////////////////////////////////////////
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            if imagePicked == 1 {
                pickedImg1 = pickedImage
                button1.setImage(pickedImage, for: UIControlState.normal)
            } else if imagePicked == 2 {
                pickedImg2 = pickedImage
                button2.setImage(pickedImage, for: UIControlState.normal)
            } else {
                pickedImg3 = pickedImage
                button3.setImage(pickedImage, for: UIControlState.normal)
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func pickPhoto1(_ sender: UIButton) {
        imagePicked = (sender as AnyObject).tag
        simplerAlert(title: " 사진 첨부하기 ",message: " ")
    }
    
    @IBAction func pickPhoto2(_ sender: Any) {
        imagePicked = (sender as AnyObject).tag
        simplerAlert(title: " 사진 첨부하기 ",message: " ")
    }
    
    @IBAction func pickPhoto3(_ sender: Any) {
        imagePicked = (sender as AnyObject).tag
        simplerAlert(title: " 사진 첨부하기 ",message: " ")
    }
    
    @IBAction func btnSend(_ sender: Any) {
        // 이미지 URL
        delegate?.passData(data: "gid")
    
        let model = HomeModel(self)
 
        let imageData1 = UIImageJPEGRepresentation(pickedImg1!, 0.5)
        let imageData2 = UIImageJPEGRepresentation(pickedImg2!, 0.5)
        let imageData3 = UIImageJPEGRepresentation(pickedImg3!, 0.5)
        
        
        model.setWriteBills(photographer_id: photographer_id!, category: category.text!, location: inputLocation.text!, cntPeople: Int(member_count.text!)!, date: Int(full_date_string!)!, item: _productIndex!, comment: inputHopeOption.text!, imageData1: imageData1, imageData2: imageData2, imageData3: imageData3)
        
        }

 

    func simplerAlert(title:String, message msg:String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: " Gallery ", style: .default, handler: { action in
            self.imgPick()
        }))
        
        
        alert.addAction(UIAlertAction(title: " My Pick ", style: .default, handler: { action in
            if let svc = self.storyboard?.instantiateViewController(withIdentifier: "MyPickListFromSendRequest") as? MyPickListFromSendRequest {
                self.navigationController?.pushViewController(svc, animated: true)
            }}))
        
        present(alert, animated: true)
    }
    
    func imgPick(){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self as? UIImagePickerControllerDelegate as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }

}

extension SendRequest : UIGestureRecognizerDelegate{
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // Key Board
    ////////////////////////////////////////////////////////////////////////////////////////////////
    
    func handleTap_mainview(_ sender: UITapGestureRecognizer?) {
        self.inputLocation.resignFirstResponder()
        self.inputHopeOption.resignFirstResponder()
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

extension SendRequest : EPCalendarPickerDelegate {
    @IBAction func showCalendar(_ sender: Any) {
        let calendarPicker = EPCalendarPicker(startYear: 2017, endYear: 2018, multiSelection: false, selectedDates: [])
        calendarPicker.calendarDelegate = self
        calendarPicker.startDate = Date()
        calendarPicker.hightlightsToday = true
        calendarPicker.showsTodaysButton = true
        calendarPicker.hideDaysFromOtherMonth = true
        calendarPicker.tintColor = UIColor.orange
        //        calendarPicker.barTintColor = UIColor.greenColor()
        calendarPicker.dayDisabledTintColor = UIColor.gray
        calendarPicker.title = "촬영 날짜"
        
        //        calendarPicker.backgroundImage = UIImage(named: "background_image")
        //        calendarPicker.backgroundColor = UIColor.blueColor()
        
        let navigationController = UINavigationController(rootViewController: calendarPicker)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    func epCalendarPicker(_: EPCalendarPicker, didSelectDate date : Date) {
        
        full_date_string = date.description
        
        
        
        let year = full_date_string?.substring(to: 4)
        let month = full_date_string?.substring(with: 5..<7)
        let day = full_date_string?.substring(with: 8..<10)
        var dayInt : Int! = Int(day!)
        dayInt = dayInt + 1
        
        let date_string = year! + "-" + month! + "-" +  String(dayInt)
        showCalendarBtn.setTitle("\(date_string)", for: .normal)
    }
    
    func epCalendarPicker(_: EPCalendarPicker, didCancel error : NSError) {
        
    }
    
}

extension SendRequest : UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate{
    
    func initToolbar(){
        
        let barFrame = CGRect(x: 0, y: 0, width: view.frame.width, height: 40)
        let btnSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        
        let categoryToolbar_btnDone = UIBarButtonItem(title: "선택", style: .done, target: self, action: #selector(selectedCategory))
        category_Toolbar = UIToolbar(frame: barFrame)
        category_Toolbar.setItems([btnSpace,categoryToolbar_btnDone], animated: true)
        
        let productToolbar_btnDone = UIBarButtonItem(title: "선택", style: .done, target: self, action: #selector(selectedProduct))
        product_Toolbar = UIToolbar(frame: barFrame)
        product_Toolbar.setItems([btnSpace,productToolbar_btnDone], animated: true)
        
        let memberToolbar_btnDone = UIBarButtonItem(title: "선택", style: .done, target: self, action: #selector(selectedMember))
        member_Toolbar = UIToolbar(frame: barFrame)
        member_Toolbar.setItems([btnSpace,memberToolbar_btnDone], animated: true)
        
    }
    
    func initPickerView(){
        
        initToolbar()
        
        cetegory_picker.delegate = self
        cetegory_picker.dataSource = self
        category.inputView = cetegory_picker
        category.inputAccessoryView = category_Toolbar
        
        product_picker.delegate = self
        product_picker.dataSource = self
        product.inputView = product_picker
        product.inputAccessoryView = product_Toolbar
        
        member_picker.delegate = self
        member_picker.dataSource = self
        member_count.inputView = member_picker
        member_count.inputAccessoryView = member_Toolbar
        
    }
    
    //피커뷰의 컴포넌트는 각각 1개
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //각각의 피커뷰가 반환해야 하는 목록의 갯수 설정
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == cetegory_picker {
            return category_data.count
        }
        else if pickerView == product_picker {
            return product_data.count
        }
        else if pickerView == member_picker {
            return member_count_data.count
        }
        else {
            return 0
        }
    }
    
    //피커뷰 목록의 타이틀 반환
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView == cetegory_picker{
            return category_data[row]
        }
            
        else if pickerView == product_picker{
            _productIndex = row
            return product_data[row].item_name
        }
            
        else if pickerView == member_picker{
            return member_count_data[row]
        }
            
        else {
            return ""
        }
    }
    
    
    func selectedCategory(){
        let row = cetegory_picker.selectedRow(inComponent: 0)
        category.text = category_data[row]
        category.endEditing(true)
        category.isEnabled = true
    }
    
    
    func selectedProduct(){
        let row = product_picker.selectedRow(inComponent: 0)
        product.text = product_data[row].item_name
        product.endEditing(true)
        product.isEnabled = true
        
    }
    
    func selectedMember(){
        let row = member_picker.selectedRow(inComponent: 0)
        member_count.text = member_count_data[row]
        member_count.endEditing(true)
        member_count.isEnabled = true
    }
    
}

extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return substring(from: fromIndex)
    }
    
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return substring(to: toIndex)
    }
    
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return substring(with: startIndex..<endIndex)
    }
}



