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

class DetailCategory : UIViewController {
    
    @IBOutlet weak var CateListTable: UITableView!
    
    @IBOutlet weak var place_category: UITextField!
    @IBOutlet weak var categoryLabel: UILabel!
    
    
    let URL : String = "https://raw.githubusercontent.com/tristanhimmelman/AlamofireObjectMapper/d8bb95982be8a11a2308e779bb9a9707ebe42ede/sample_json"
    
//    var threedaysForecast : [ForecastVO] = [ForecastVO]()
    var location : String?
    
    var cateogory : String?
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
        
        Alamofire.request(URL).responseObject {
            
            /*클로져구문입니다
             DataResponse<클래스명>
             여기서 클래스명에 대응되는 클래스는 서버로부터 받아오는 가장 상위레벨의 데이터 형들과 일치해야합니다
             우리가 로컬변수로 location 과 threedaysForecast는
             DataReponse<클래스명> 의 타입으로 받아오는 데이터를 저장하기 위함입니다.*/
            
            (response : DataResponse<CateListRpVO>) in
            
            
            //response.result 는 네트워크의 성공실패 여부 결과를 담고있습니다
            
            //네트워크 결과
            switch response.result{
                
            case .success:
                
                guard let forecast = response.result.value else{
                    return
                }
                
                /*
                 
                 Edit Scope !
                 
                 
                 
                 
                if let forecasts = forecast.threeDayForecast{
                    
                    //서버로부터 받아온 데이터들을 우리가 선언한 변수에 담아줍니다
                    self.location = forecast.location
                    self.threedaysForecast = forecasts
                    
                    //기본적으로 Alamofire는 비동기 방식이기 때문에 반드시 reloadData를 이용해서
                    //테이블뷰의 데이터를 갱신해주어야 합니다.
                    self.CateListTable.reloadData()
                    
                }
                */
                
                
            case .failure(let err):
                print(err)
                
            }
        }
    }

}
extension DetailCategory : UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        
        //  Edit Scope !
        //        return threedaysForecast.count
        
        
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = CateListTable.dequeueReusableCell(withIdentifier: "CateListCell") as! CateListCell
        
        /*
         
        Edit Scope !
         
         
        let forecast = threedaysForecast[indexPath.row]
        cell.dayTxt.text = forecast.day!
        cell.conditionTxt.text = forecast.conditions!
        cell.temperatureTxt.text = "\(forecast.temperature!)"
        cell.weatherImg.image = UIImage(named: forecast.conditions!)
        */
        return cell
    }
    
    
    
    /*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let boardVO = boardList[indexPath.row]
        
        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "DetailBoard") as? DetailBoard else{
            return
        }
        dvc.id = boardVO.id
        navigationController?.pushViewController(dvc, animated: true)
    }
     */
    
    
    
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




/*
 To do list
 1. 네비게이션 백버튼 Text 수정
 
 
 
 */
