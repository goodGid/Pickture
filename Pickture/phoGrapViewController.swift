//
//  phoGrapViewController.swift
//  Pickture
//
//  Created by Kiyong Shin on 02/07/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire


final class phoGrapViewController: UIViewController, NetworkCallback {
    
    @IBOutlet weak var btnEdit: UIButton!
    @IBOutlet weak var phoGrapTable: UITableView!
    var dataAry : [MyPickPhograpListVO] = [MyPickPhograpListVO]()
    var deleteImglist : [UIButton] = [UIButton]()
    var deleteImgListIntArray : [Int] = [Int]()
    
    
    var chk_delete = false
    
    var chkBoxHideFlag : Bool = true
    var editBtnFlag : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.phoGrapTable.delegate = self
        self.phoGrapTable.dataSource = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap_mainview(_: )))
        tap.delegate = self
        self.view.addGestureRecognizer(tap)
        
        //sepeartor 제거
        self.phoGrapTable.separatorStyle = UITableViewCellSeparatorStyle.none
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
            let model = MyPickModel(self)
            model.getMyPickPhograpList()
    }
    
    func networkResult(resultData: Any, code: String) {
        if code == "getMyPickPhograpList"{
//            dataAry = resultData as! [MyPickPhograpListVO]
//            phoGrapTable.reloadData()
        }
    }
    
    
    @IBAction func onClickEdit(_ sender: Any) {
        // 수정 상태 부분
        if editBtnFlag{
        chkBoxHideFlag = !chkBoxHideFlag
        editBtnFlag = !editBtnFlag
        btnEdit.setTitle("삭제", for: UIControlState.normal)
        phoGrapTable.reloadData()
        } else {
        deleteChkedImg()
        chkBoxHideFlag = !chkBoxHideFlag
        editBtnFlag = !editBtnFlag
        btnEdit.setTitle("수정", for: UIControlState.normal)
        phoGrapTable.reloadData()
        }
    }
    
    func buttonAction2(sender:UIButton,parameter:String){
        // Exist in List
        if deleteImgListIntArray.contains(sender.tag){
            let index = deleteImgListIntArray.index(of: sender.tag)
            deleteImgListIntArray.remove(at: index!)
            sender.setImage(UIImage(named: "unpickbox"), for: .normal)
        } else{
            deleteImgListIntArray.append(sender.tag)
            sender.setImage(UIImage(named: "pickbox"), for: .normal)
        }
    }

    
    func deleteChkedImg(){
        let model = PickPhoGrapModel(self)
        for i in 0...deleteImgListIntArray.count{
            model.unpickPhoGrap(phoGrapID: dataAry[deleteImgListIntArray[i]].id!)
            }
        }
}
 
    
  



extension phoGrapViewController : UITableViewDelegate,UITableViewDataSource {
  
    func buttonAction(_ sender: Any) {
        buttonAction2(sender: sender as! UIButton, parameter: "")
        btnEdit.isEnabled = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataAry.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.phoGrapTable.dequeueReusableCell(withIdentifier: "PhoGrapListMyPickCell") as! PhoGrapListMyPickCell
        cell.phoGrapID.text = dataAry[indexPath.row].id
        cell.phoGrapImg.imageFromUrl(dataAry[indexPath.row].profile_url, defaultImgPath: "artist")
        cell.txtHashTag.text = dataAry[indexPath.row].hashtag
        cell.tag = indexPath.row
        cell.btnChkBox.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

      if chkBoxHideFlag {
        cell.btnChkBox.isHidden = true
        }
        else {
        cell.btnChkBox.isHidden = false
        }
        return cell
    }
}

extension phoGrapViewController : UIGestureRecognizerDelegate{
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // Key Board
    ////////////////////////////////////////////////////////////////////////////////////////////////
    
    func handleTap_mainview(_ sender: UITapGestureRecognizer?) {
        //        self.searchBar.resignFirstResponder()
        
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





