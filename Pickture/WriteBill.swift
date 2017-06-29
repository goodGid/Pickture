//
//  WriteBill.swift
//  Pickture
//
//  Created by Kiyong Shin on 28/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import UIKit

class WriteBill : UIViewController,NetworkCallback {
    
    @IBOutlet var imgContent: UIImageView!
    
    override func viewDidLoad() {
      
    }
    func networkResult(resultData: Any, code: String)
    {
        navigationController?.popViewController(animated: true)
    }
    
    
    
    @IBAction func writeBill(_ sender: Any) {
        
//        let title = gsno(titleTxt.text)
        
        let tmpTitle : String = "test"
        let model = WriteBillModel(self)
        
        
        if tmpTitle.isEmpty{
            simpleAlert(title: "입력 오류", msg: "제목을 입력해주세요.")
        }else{
            
            if let image = imgContent.image{
                //이미지를 멀티파트를 이용해 서버로 보내기 위한 data 형식으로 변환시켜줍니다
                let imageData = UIImageJPEGRepresentation(image, 0.5)
                //                    UIImagePNGRepresentation(img)
                
                //데이터형식으로 변환된 이미지를 서버로 전송합니다
//                model.writeBoardWithImage(title: title, content: content, writer: writer, imageData: imageData)
            }
            else{
//                model.writeBoard(title: title, content: content, writer: writer)
            }
        }
    }
   
}





extension WriteBill : UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    //사진 선택 안하고 종료 시
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    //사진 선택 관련 컨트롤러
    //이미지 피커 컨트롤러에서 이미지를 선택하거나 카메라 촬영을 완료 했을 때, 호출되는 메소드입니다 만약 선택한 이미지에 대한 수정 옵션이 설정되어 있다면 이미지 수정 작업이 완료되었을 때 호출됩니다.
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var newImage: UIImage
        
        if let possibleImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            // UIImagePickerControllerEditedImage 이미지가 수정된 경우 수정된 이미지를 전달합니다
            //이미지를 이미지뷰(newImage) 에 표시
            newImage = possibleImage
        } else if let possibleImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            //UIImagePickerControllerOriginalImage 는 이미지 피커 컨트롤러에서 선택한 이미지에 대한 원본 이미지 데이터입니다. 이미지가 수정되었더라도 이 키를 이용하면 원본 데이터를 받을 수 있습니다.
            
            //이미지를 미지뷰(newImage)에 표시
            newImage = possibleImage
        } else {
            return
        }
        
        imgContent.image = newImage
        dismiss(animated: true, completion: nil)
    }
}
