//
//  DetailCategory.swift
//  Pickture
//
//  Created by Kiyong Shin on 29/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire


class DetailCategory : UIViewController, NetworkCallback {
    
    @IBOutlet weak var CateListTable: UITableView!
    
    @IBOutlet weak var place_category: UITextField!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var phograpLists : [photographersVO] = [photographersVO]()
    
    
    var _categoryLabel : String?
    
    var place_picker = UIPickerView()
    var place_data =  ["서울", "경기∙인천", "강원", "충북∙세종", "충남∙대전", "경북∙대구", "경남∙울산∙대구", "전북", "전남∙광주", "제주"]
    
    var place_Toolbar = UIToolbar()
    var place_category_index : Int?
    
    override func viewDidLoad() {
        initPickerView()
        CateListTable.delegate = self
        CateListTable.dataSource = self
        categoryLabel.text = _categoryLabel
       
        
        
        // 다음 뷰 백버튼
        let backItem = UIBarButtonItem()
        backItem.title = ""
        self.navigationItem.backBarButtonItem = backItem
        
        // 지금 뷰 타이틀
        self.navigationItem.title = "CATEGORY"
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = UIColor(red: 229.0/255.0, green: 167.0/255.0, blue: 28.0/255.0, alpha: 0.8)
        
        
        //sepeartor 제거
        self.CateListTable.separatorStyle = UITableViewCellSeparatorStyle.none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let model = HomeModel(self)
        model.getPhograpListFromCate(category: _categoryLabel!, empty: "")
    }
    
    func networkResult(resultData: Any, code: String) {
        if code == "getPhograpListFromCate" || code == "getPhograpListFromCateWithLocation"{
            phograpLists = resultData as! [photographersVO]
            CateListTable.reloadData()
        }
    }
}



extension DetailCategory : UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return phograpLists.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CateListTable.dequeueReusableCell(withIdentifier: "CateListCell") as! CateListCell
        
        let tmpPhograpList = phograpLists[indexPath.row]
        cell.phoGrapName.text = gsno(tmpPhograpList.id)
        cell.phoGrapLocation.text = gsno(tmpPhograpList.location)
        cell.phoGrapImg.imageFromUrl(tmpPhograpList.profile_url, defaultImgPath: "artist")
        
        cell.phoGrapImg.layer.cornerRadius = (cell.phoGrapImg?.frame.size.width)! / 2
        cell.phoGrapImg.layer.masksToBounds = true
        
        
        
        
        cell.img1.imageFromUrl(tmpPhograpList.recent_photos?[0], defaultImgPath: "artist")
        cell.img2.imageFromUrl(tmpPhograpList.recent_photos?[1], defaultImgPath: "artist")
        cell.img3.imageFromUrl(tmpPhograpList.recent_photos?[2], defaultImgPath: "artist")
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "PhoGrapInfo") as?
        DetailPhoGrapInfo else{
            return
        }
        
        let tmpPhograpList = phograpLists[indexPath.row]
        dvc._phograpID = tmpPhograpList.id
        dvc._phograpImg = tmpPhograpList.profile_url
        dvc._phograpName = tmpPhograpList.id
        dvc._phograpHashTag = tmpPhograpList.hashtag
        dvc._phograpLocation = tmpPhograpList.location
        dvc._phograpPicked = tmpPhograpList.picked
        
        
        
        navigationController?.pushViewController(dvc, animated: true)
    }
}


extension DetailCategory : UIPickerViewDelegate,UIPickerViewDataSource {
 
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
        if pickerView == place_picker {
            return place_data.count
        }
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
        
        let model = HomeModel(self)
        model.getPhograpListFromCateWithLocation(category: _categoryLabel!, location: place_data[row])
        
        
        
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
}
