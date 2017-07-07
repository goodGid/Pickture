//
//  MyPage.swift
//  Pickture
//
//  Created by ljh on 2017. 7. 2..
//  Copyright © 2017년 기용 신. All rights reserved.
//

import Foundation
import UIKit

class MyPage : UIViewController, NetworkCallback {
    
    
    override func viewDidLoad() {
        // 다음 뷰 백버튼
        let backItem = UIBarButtonItem()
        backItem.title = ""
        self.navigationItem.backBarButtonItem = backItem
        
        // 지금 뷰 타이틀
        self.navigationItem.title = "MY PAGE"
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = UIColor(red: 229.0/255.0, green: 167.0/255.0, blue: 28.0/255.0, alpha: 0.8)
        
    }
    
    func networkResult(resultData: Any, code: String) {
        
    }
    
    @IBOutlet weak var btnRequestStorage: UIButton!
    
    
    @IBAction func btnRequestStorage(_ sender: Any) {
        let tmpStoryboard = UIStoryboard(name: "MyPage", bundle: nil)
        if let svc = tmpStoryboard.instantiateViewController(withIdentifier: "requestStorageBox") as? requestStorageBox {
            self.navigationController?.pushViewController(svc, animated: true)
        }
        
    }
    
    @IBAction func btnPuchase(_ sender: Any) {
        let tmpStoryboard = UIStoryboard(name: "MyPage", bundle: nil)
        if let svc = tmpStoryboard.instantiateViewController(withIdentifier: "PurchaseBox") as? PurchaseBox {
            self.navigationController?.pushViewController(svc, animated: true)
        }
        
    }
    
    @IBAction func btnModelApply(_ sender: Any) {
        let tmpStoryboard = UIStoryboard(name: "MyPage", bundle: nil)
        if let svc = tmpStoryboard.instantiateViewController(withIdentifier: "ModelApplyBox") as? ModelApplyBox {
            self.navigationController?.pushViewController(svc, animated: true)
        }
    }
    
    
    
    
    @IBAction func editPhograpPage(_ sender: Any) {
          simpleAlert(title: "작가로 등록한 회원만 \n 사용할 수 있는 기능입니다.", msg: "")
    }
        @IBAction func editRequest(_ sender: Any) {
          simpleAlert(title: "작가로 등록한 회원만 \n 사용할 수 있는 기능입니다.", msg: "")
    }
    
    
    @IBAction func editModelHireBoard(_ sender: Any) {
          simpleAlert(title: "작가로 등록한 회원만 \n 사용할 수 있는 기능입니다.", msg: "")
    }
    
    @IBAction func editModelApplyBoard(_ sender: Any) {
        simpleAlert(title: "작가로 등록한 회원만 \n 사용할 수 있는 기능입니다.", msg: "")
    }
    
    @IBAction func btnLogout(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
