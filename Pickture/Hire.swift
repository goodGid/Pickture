//
//  Hire.swift
//  Pickture
//
//  Created by Kiyong Shin on 02/07/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import UIKit

class Hire : UIViewController, NetworkCallback {
    
    
    @IBOutlet weak var modelHireTable: UITableView!
    @IBOutlet weak var categoryPicker: UITextField!
    @IBOutlet weak var placePicker: UITextField!
    
    var recruitList : [ModelRecruitInfoListWithCateAndLocationVO] = [ModelRecruitInfoListWithCateAndLocationVO]()
    
    var cate_picker = UIPickerView()
    var cate_data =  ["DATE", "FRIENDS", "WEDDING", "BABY", "PROFILE", "ETC"]
    
    var place_picker = UIPickerView()
    var place_data =  ["서울", "경기∙인천", "강원", "충북∙세종", "충남∙대전", "경북∙대구", "경남∙울산∙대구", "전북", "전남∙광주", "제주"]
    
    var cate_Toolbar = UIToolbar()
    var place_Toolbar = UIToolbar()
    
    var category_index: Int?
    var place_index: Int?
    
    var stdCate : String = "date"
    var stdPlace : String = "서울"
    
    
    override func viewDidLoad() {
        initPickerView()
        
        // 다음 뷰 백버튼
        let backItem = UIBarButtonItem()
        backItem.title = ""
        self.navigationItem.backBarButtonItem = backItem
        
        // 지금 뷰 타이틀
        self.navigationItem.title = "MODEL RECRUIT"
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = UIColor(red: 229.0/255.0, green: 167.0/255.0, blue: 28.0/255.0, alpha: 0.8)
        
        self.modelHireTable.delegate = self
        self.modelHireTable.dataSource = self
        
        self.modelHireTable.separatorStyle = UITableViewCellSeparatorStyle.none
        
    }
    
    @IBAction func unwindToHire(segue:UIStoryboardSegue) {}

    
    override func viewWillAppear(_ animated: Bool) {
        let model = HireModel(self)
        model.getModelRecruitInfoListWithCateAndLocation(category: "", location: "")
    }
    
    
    func networkResult(resultData: Any, code: String) {
        if code == "getModelRecruitInfoListWithCateAndLocation"{
            print(" networkResult : getModelRecruitInfoListWithCateAndLocation ")
            recruitList = resultData as! [ModelRecruitInfoListWithCateAndLocationVO]
            modelHireTable.reloadData()
        }
    }
    
}


extension Hire : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recruitList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.modelHireTable.dequeueReusableCell(withIdentifier: "ModelHireTableCell") as! ModelHireTableCell
        
        if  recruitList[indexPath.row]._photographer?.profile_url == nil ||
            recruitList[indexPath.row]._photographer?.id == nil ||
            recruitList[indexPath.row].comment == nil  ||
            recruitList[indexPath.row]._photographer?.location == nil ||
            recruitList[indexPath.row]._images?[0] == nil  ||
            recruitList[indexPath.row]._images?[1] == nil ||
            recruitList[indexPath.row]._images?[2] == nil ||
            recruitList[indexPath.row]._images?[3] == nil ||
            recruitList[indexPath.row]._images?[4] == nil ||
            recruitList[indexPath.row].d_day == nil {
            print(" Hire Data Error")
        }
            
        cell.phoGrapImg.imageFromUrl(recruitList[indexPath.row]._photographer?.profile_url, defaultImgPath: "artist")
        cell.phoGrapImg.layer.cornerRadius = (cell.phoGrapImg?.frame.size.width)! / 2
        cell.phoGrapImg.layer.masksToBounds = true
        
        
        if recruitList[indexPath.row]._photographer?.profile_url != nil &&
            recruitList[indexPath.row]._photographer?.id != nil &&
            recruitList[indexPath.row].comment != nil  {
        cell.phoGrapID.text = recruitList[indexPath.row]._photographer?.id
        cell.phoGrapMsg.text = recruitList[indexPath.row].comment
        cell.phoGrapLocation.text = recruitList[indexPath.row]._photographer?.location
        }
        
       
        if  recruitList[indexPath.row]._images?[0] != nil &&
            recruitList[indexPath.row]._images?[1] != nil &&
            recruitList[indexPath.row]._images?[2] != nil{
        cell.img1.imageFromUrl(recruitList[indexPath.row]._images?[0], defaultImgPath: "artist")
        cell.img2.imageFromUrl(recruitList[indexPath.row]._images?[1], defaultImgPath: "artist")
        cell.img3.imageFromUrl(recruitList[indexPath.row]._images?[2], defaultImgPath: "artist")
        }
        
        if  recruitList[indexPath.row]._images?[3] != nil &&
            recruitList[indexPath.row]._images?[4] != nil{
        cell.img4.imageFromUrl(recruitList[indexPath.row]._images?[3], defaultImgPath: "artist")
        cell.img5.imageFromUrl(recruitList[indexPath.row]._images?[4], defaultImgPath: "artist")
        }
        
        
        if recruitList[indexPath.row].d_day != nil {
        cell.Dday.text = "D - \(String(describing: recruitList[indexPath.row].d_day!))"
        }
     
        cell.phoGrapID.text = recruitList[indexPath.row]._photographer?.id
        cell.phoGrapMsg.text = recruitList[indexPath.row].comment
        cell.phoGrapLocation.text = recruitList[indexPath.row]._photographer?.location
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tmpStoryboard = UIStoryboard(name: "Hire", bundle: nil)
        if let svc = tmpStoryboard.instantiateViewController(withIdentifier: "ModelHire") as? ModelHire {
            svc.recruitList = recruitList[indexPath.row]
            self.navigationController?.pushViewController(svc, animated: true)
        }
    }
}


extension Hire : UIPickerViewDelegate,UIPickerViewDataSource {
        func initToolbar(){
            let barFrame = CGRect(x: 0, y: 0, width: view.frame.width, height: 40)
            let btnSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
            
            
            let cate_btnDone = UIBarButtonItem(title: "선택", style: .done, target: self, action: #selector(selectedCate))
            cate_Toolbar = UIToolbar(frame: barFrame)
            cate_Toolbar.setItems([btnSpace,cate_btnDone], animated: true)
            
            
            let place_btnDone = UIBarButtonItem(title: "선택", style: .done, target: self, action: #selector(selectedPlace))
            place_Toolbar = UIToolbar(frame: barFrame)
            place_Toolbar.setItems([btnSpace,place_btnDone], animated: true)
            
        }
        
        //각각의 피커뷰가 반환해야 하는 목록의 갯수 설정
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            if pickerView == cate_picker {
                return cate_data.count
            }
            else if pickerView == place_picker {
                return place_data.count
            }
            else {
                return 0
            }
        }
        
        //피커뷰 목록의 타이틀 반환
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            if pickerView == cate_picker {
                return cate_data[row]
            }
            else if pickerView == place_picker {
                return place_data[row]
            }
            else {
                return ""
            }
        }
        
        //피커뷰의 컴포넌트는 각각 1개
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
    
    
        func selectedCate(){
            initPickerView()
             let row = cate_picker.selectedRow(inComponent: 0)
           
            categoryPicker.text = cate_data[row]
            stdCate = cate_data[row]
            category_index = row
            
            let model = HireModel(self)
            model.getModelRecruitInfoListWithCateAndLocation(category: stdCate, location: stdPlace)
            
            categoryPicker.endEditing(true)
        }
        
    
    
    
        func selectedPlace(){
            initPickerView()
            let row = place_picker.selectedRow(inComponent: 0)
            
            placePicker.text = place_data[row]
            stdPlace = place_data[row]
            place_index = row

            
            let model = HireModel(self)
            model.getModelRecruitInfoListWithCateAndLocation(category: stdCate, location: stdPlace)
            
            
            placePicker.endEditing(true)
        }
    
    
        func initPickerView(){
            initToolbar()
            
            cate_picker.dataSource = self
            cate_picker.delegate = self
            cate_picker.dataSource = self
            categoryPicker.inputView = cate_picker
            categoryPicker.inputAccessoryView = cate_Toolbar
            
            place_picker.dataSource = self
            place_picker.delegate = self
            place_picker.dataSource = self
            placePicker.inputView = place_picker
            placePicker.inputAccessoryView = place_Toolbar
            
            
        }
    }
