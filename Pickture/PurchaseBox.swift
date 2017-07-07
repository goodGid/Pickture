
//
//  PurchaseBox.swift
//  Pickture
//
//  Created by ljh on 2017. 7. 3..
//  Copyright © 2017년 기용 신. All rights reserved.
//

import Foundation
import UIKit

class PurchaseBox : UIViewController, NetworkCallback {
    
    @IBOutlet var PurchaseTable: UITableView!
    
    var purchaseList : [PurchaseHistoryVO] = [PurchaseHistoryVO]()
    var _phoGrapID : String?
    var _phoGrapImg : String?
    
    override func viewWillAppear(_ animated: Bool) {
        let model = PurchaseModel(self)
        model.getPurchaseList()
    }
    
    override func viewDidLoad() {
        PurchaseTable.delegate = self
        PurchaseTable.dataSource = self
        
        self.PurchaseTable.separatorStyle = UITableViewCellSeparatorStyle.none
        
        self.navigationItem.title = "구매 내역"
        // musicTable.estimatedRowHeight = 50.0
        self.navigationController?.navigationItem.title = " "
        self.navigationController?.navigationBar.tintColor = UIColor(red: 229.0/255.0, green: 167.0/255.0, blue: 28.0/255.0, alpha: 0.8)
    }
    
    func networkResult(resultData: Any, code: String) {
        if code == "getPayHistorySuccess"{
            purchaseList = resultData as! [PurchaseHistoryVO]
            PurchaseTable.reloadData()
        }
    }
    
    @IBAction func btnWriteReview(_ sender: Any) {
        if let svc = self.storyboard?.instantiateViewController(withIdentifier: "WriteReview") as? WriteReview {
            svc._phograID = _phoGrapID
            svc._phograImg = _phoGrapImg
            self.navigationController?.pushViewController(svc, animated: true)
        }
    }
}

extension PurchaseBox : UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return purchaseList.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = PurchaseTable.dequeueReusableCell(withIdentifier: "PurchaseCell") as! PurchaseCell
        
        cell.date.text = purchaseList[indexPath.row].date
        
        if purchaseList[indexPath.row].isReviewd == true {
            cell.reviewBtn.setImage(UIImage(named: "review_gray"), for: .normal)
            cell.reviewBtn.isEnabled = false
        } else {
            cell.reviewBtn.setImage(UIImage(named: "review_yellow"), for: .normal)
        }
        
        let index = String(indexPath.row + 1)
        if index.characters.count == 1 {
            cell.number.text = "0" + "\(index)"
        } else {
            cell.number.text = "\(index)"
        }
        
        cell.phoGrapID.text = purchaseList[indexPath.row]._photographer?.id
        
        _phoGrapID = purchaseList[indexPath.row]._photographer?.id
        _phoGrapImg = purchaseList[indexPath.row]._photographer?.phoGrapProfile
        
        
        return cell
    }
}



