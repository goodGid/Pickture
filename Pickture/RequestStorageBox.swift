//
//  RequestStorageBox.swift
//  Pickture
//
//  Created by ljh on 2017. 7. 2..
//  Copyright © 2017년 기용 신. All rights reserved.
//

import Foundation
import UIKit

class requestStorageBox : UIViewController, NetworkCallback {
    
    @IBOutlet var reqTable: UITableView!
    
    var reqList :[RequestCellVO] = [RequestCellVO]()
    
    override func viewDidLoad() {
        reqTable.delegate = self
        reqTable.dataSource = self
        
        self.navigationItem.title = "견적서 보관함"
        self.navigationController?.navigationItem.title = "견적서 보관함"
        self.navigationController?.navigationBar.tintColor = UIColor(red: 229.0/255.0, green: 167.0/255.0, blue: 28.0/255.0, alpha: 0.8)
        
        self.reqTable.separatorStyle = UITableViewCellSeparatorStyle.none
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        let model = MyPageModel(self)
        //        model.getRequestStorage
    }
    
    func networkResult(resultData: Any, code: String) {
        if code == "getRequestStorage"{
            reqList = resultData as! [RequestCellVO]
            reqTable.reloadData()
        }
    }
    
}


extension requestStorageBox : UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reqList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = reqTable.dequeueReusableCell(withIdentifier: "RequestCell") as! RequestCell
        cell.number.text =  "\(reqList[indexPath.row].number)"
        cell.phoGrapID.text = reqList[indexPath.row].phoGrapID
        cell.reqState.text = reqList[indexPath.row].reqState
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if reqList[indexPath.row].reqState == "답변대기" {
            guard let dvc = storyboard?.instantiateViewController(withIdentifier: "DetailRequest1") as?
                DetailRequest1 else{
                    return
            }
            dvc._photographerID = reqList[indexPath.row].phoGrapID
            navigationController?.pushViewController(dvc, animated: true)
            
        } else if reqList[indexPath.row].reqState == "답변완료" {
            guard let dvc = storyboard?.instantiateViewController(withIdentifier: "DetailRequest2") as?
                DetailRequest2 else{
                    return
            }
            dvc._photographerID = reqList[indexPath.row].phoGrapID
            navigationController?.pushViewController(dvc, animated: true)
            
        } else if reqList[indexPath.row].reqState == "예약완료" {
            guard let dvc = storyboard?.instantiateViewController(withIdentifier: "DetailRequest3") as?
                DetailRequest3 else{
                    return
            }
            dvc._photographerID = reqList[indexPath.row].phoGrapID
            navigationController?.pushViewController(dvc, animated: true)
            
        } else {
            simpleAlert(title: "오류", msg: "Error 발생")
        }
    }
}


