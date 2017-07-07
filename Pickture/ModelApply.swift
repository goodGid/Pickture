//
//  ModelApply.swift
//  Pickture
//
//  Created by Kiyong Shin on 06/07/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//


import Foundation
import UIKit

class ModelApply : UIViewController, NetworkCallback {
    @IBOutlet var phoGrapImg: UIImageView!
    @IBOutlet var phoGrapMsg: UILabel!
    
    @IBOutlet var applyModelTxt: UITextField!
    @IBOutlet var phoneNumTxt: UITextField!
    
    @IBOutlet weak var btnAddImg1: UIButton!
    @IBOutlet weak var btnAddImg2: UIButton!
    @IBOutlet weak var btnAddImg3: UIButton!
    
    var pickedImg1 : UIImage?
    var pickedImg2 : UIImage?
    var pickedImg3 : UIImage?
    
    var fromPhograpImg : String?
    var fromPhograpMsg : String?
    
    var imagePicked = 0
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        btnAddImg1.tag = 1
        btnAddImg2.tag = 2
        btnAddImg3.tag = 3
        
        //수정 가능 옵션
        imagePicker.allowsEditing = false
        //델리게이트 지정
        imagePicker.delegate = self
        
        self.phoGrapImg.imageFromUrl(fromPhograpImg, defaultImgPath: "artist")
        self.phoGrapMsg.text = fromPhograpMsg
        
        
    }
    
    
    
    
    
    @IBAction func addImg1(_ sender: Any) {
        imagePicked = (sender as AnyObject).tag
        simplerAlert(title: " 사진 첨부하기 ",message: " ")
    }
    
    @IBAction func addImg2(_ sender: Any) {
        imagePicked = (sender as AnyObject).tag
        simplerAlert(title: " 사진 첨부하기 ",message: " ")

    }
    
    @IBAction func addImg3(_ sender: Any) {
        imagePicked = (sender as AnyObject).tag
        simplerAlert(title: " 사진 첨부하기 ",message: " ")

    }

    
    @IBAction func btnApply(_ sender: Any) {
        let model = HireModel(self)
        
        
        let imageData1 = UIImageJPEGRepresentation(pickedImg1!, 0.5)
        let imageData2 = UIImageJPEGRepresentation(pickedImg2!, 0.5)
        let imageData3 = UIImageJPEGRepresentation(pickedImg3!, 0.5)
        
        
        model.setModelApplyBills(title: applyModelTxt.text!, comment: phoneNumTxt.text!, imageData1: imageData1, imageData2: imageData2,imageData3: imageData3)
        
        
        self.performSegue(withIdentifier: "Hire", sender: self)
    }

    func networkResult(resultData: Any, code: String) {
        if code == "setModelApplyBills"{
        }
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
//            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self as? UIImagePickerControllerDelegate as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
}


extension ModelApply : UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    //사진 선택 안하고 종료 시
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    //사진 선택 관련 컨트롤러
    //이미지 피커 컨트롤러에서 이미지를 선택하거나 카메라 촬영을 완료 했을 때, 호출되는 메소드입니다 만약 선택한 이미지에 대한 수정 옵션이 설정되어 있다면 이미지 수정 작업이 완료되었을 때 호출됩니다.
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            if imagePicked == 1 {
                pickedImg1 = pickedImage
                btnAddImg1.setImage(pickedImage, for: UIControlState.normal)
            } else if imagePicked == 2 {
                pickedImg2 = pickedImage
                btnAddImg2.setImage(pickedImage, for: UIControlState.normal)
            } else {
                pickedImg3 = pickedImage
                btnAddImg3.setImage(pickedImage, for: UIControlState.normal)
            }
        }
        picker.dismiss(animated: true, completion: nil)
    }
}


extension ModelApply : UIGestureRecognizerDelegate{
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // Key Board
    ////////////////////////////////////////////////////////////////////////////////////////////////
    
    func handleTap_mainview(_ sender: UITapGestureRecognizer?) {
        self.applyModelTxt.resignFirstResponder()
        self.phoneNumTxt.resignFirstResponder()
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







