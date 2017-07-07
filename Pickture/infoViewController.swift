//
//  infoViewController.swift
//  Pickture
//
//  Created by Kiyong Shin on 30/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import UIKit

final class infoViewController: UIViewController, NetworkCallback {
    
    @IBOutlet weak var productListTable: UITableView!
    
    @IBOutlet weak var phoGrapLogo: UILabel!
    @IBOutlet weak var phoGrapCeo: UILabel!
    @IBOutlet weak var phoGrapAddress: UILabel!
    
    var productData : [PhograpInfolistVO] = []
    var phograpID : String?
    
    override func viewDidLoad() {
        productListTable.delegate = self
        productListTable.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let model = PhograpInfoModel(self)
        model.getInfolist(phograpID!)
    }
    
    //////통신 코드/////
    
    func networkResult(resultData: Any, code: String) {
        //게시글내용을 분기해서 가져옵니다
        if code == "getInfolist" {
            var tmpPhograpInfolistRpVO : PhograpInfolistRpVO?
            tmpPhograpInfolistRpVO = resultData as? PhograpInfolistRpVO
            
            /*
            self.phoGrapLogo = tmpPhograpInfolistRpVO?.logo
            self.phoGrapCeo = tmpPhograpInfolistRpVO?.ceo
            self.phoGrapAddress = tmpPhograpInfolistRpVO?.address
            */
            
            productData = (tmpPhograpInfolistRpVO?._items!)!
            
            productListTable.reloadData()
        }
    }
}






extension infoViewController : UITableViewDelegate,UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productListTable.dequeueReusableCell(withIdentifier: "InfoProductCell") as! InfoProductCell
        
        let tmpPrice : Int = productData[indexPath.row].price!
        let tmpPriceString : String = "\(tmpPrice)" + "won"
        
        cell.txtProduct.text = productData[indexPath.row].item_name
        cell.txtPrice.text = tmpPriceString
        
        return cell
    }
    
}






