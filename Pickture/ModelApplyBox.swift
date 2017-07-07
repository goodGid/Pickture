//
//  ModelApplyBox.swift
//  Pickture
//
//  Created by ljh on 2017. 7. 3..
//  Copyright © 2017년 기용 신. All rights reserved.
//

import Foundation
import UIKit

class ModelApplyBox : UIViewController, NetworkCallback {
    
    @IBOutlet var modelTable: UITableView!
    
    var modelList : [ApplyVO] = [ApplyVO]()
    var tmpInt : Int = 0
    
    override func viewWillAppear(_ animated: Bool) {
        let model = ModelApplyBoxModel(self)
        model.getModelApplyList()
    }
    
    override func viewDidLoad() {
        modelTable.delegate = self
        modelTable.dataSource = self
        
        self.modelTable.separatorStyle = UITableViewCellSeparatorStyle.none
        
        self.navigationItem.title = "모델 신청 보관함"
        self.navigationController?.navigationItem.title = "모델 신청 보관함"
        self.navigationController?.navigationBar.tintColor = UIColor(red: 229.0/255.0, green: 167.0/255.0, blue: 28.0/255.0, alpha: 0.8)
        
    }
}


extension ModelApplyBox : UITableViewDelegate,UITableViewDataSource {
    
    func networkResult(resultData: Any, code: String) {
        if code == "getModelApplyListSuccess"{
            modelList = resultData as! [ApplyVO]
            modelTable.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = modelTable.dequeueReusableCell(withIdentifier: "ModelApplyCell") as! ModelApplyCell
        cell.phoGrapID.text = modelList[indexPath.row].phoGrapId
        cell.state.text = modelList[indexPath.row].status
        tmpInt = tmpInt + 1
        let index = String(tmpInt)
        if index.characters.count == 1 {
            cell.number.text = "0" + "\(index)"
        } else {
            cell.number.text = "\(index)"
        }
        if modelList[indexPath.row].status == "수락" {
            cell.state.textColor = UIColor(hexString: "#075804")
        } else if modelList[indexPath.row].status == "답변대기" {
            cell.state.textColor = UIColor(hexString: "#939393")
        } else {
            cell.state.textColor = UIColor(hexString: "#C20A0A")
        }
        
        return cell
    }
    
}

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt32()
        Scanner(string: hex).scanHexInt32(&int)
        let a, r, g, b: UInt32
        switch hex.characters.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}





