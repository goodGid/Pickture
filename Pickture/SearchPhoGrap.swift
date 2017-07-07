//
//  SearchPhoGrap.swift
//  Pickture
//
//  Created by Kiyong Shin on 30/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire
import Kingfisher

class SearchPhoGrap : UIViewController , UIGestureRecognizerDelegate, NetworkCallback {
    @IBOutlet weak var phoGrapTable: UITableView!
    
    var phoGrapInfo : [SearchListVO] = [SearchListVO]()
    var tmpPhoGrapInfo : [SearchListVO] = [SearchListVO]()
    var searchBar : UISearchBar! = nil
    var tmp : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.phoGrapTable.delegate = self
        self.phoGrapTable.dataSource = self
        self.searchBarSetup()
        
        
        
        // 다음 뷰 백버튼
        let backItem = UIBarButtonItem()
        backItem.title = ""
        self.navigationItem.backBarButtonItem = backItem
        
        // 지금 뷰 타이틀
        self.navigationItem.title = "SEARCH"
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = UIColor(red: 229.0/255.0, green: 167.0/255.0, blue: 28.0/255.0, alpha: 0.8)
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap_mainview(_: )))
        tap.delegate = self
        self.view.addGestureRecognizer(tap)
        
        self.phoGrapTable.separatorStyle = UITableViewCellSeparatorStyle.none
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func networkResult(resultData: Any, code: String) {
        if code == "getSearchList"{
            phoGrapInfo = resultData as! [SearchListVO]
            tmpPhoGrapInfo = resultData as! [SearchListVO]
            phoGrapTable.reloadData()
        }
    }
    
    
    
    
    func searchBarSetup() {
        searchBar = UISearchBar(frame: CGRect(x:0,y:0,width:(UIScreen.main.bounds.width),height:50))
        searchBar.showsScopeBar = true
        searchBar.delegate = self
        searchBar.autocapitalizationType = .none
        searchBar.layer.backgroundColor = UIColor.blue.cgColor
        
        self.phoGrapTable.tableHeaderView = searchBar
    }
    
    
    
    func filterTableView(text:String) {
        let model = SearchModel(self)
        model.getSearchList(text)
    }
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // Key Board
    ////////////////////////////////////////////////////////////////////////////////////////////////
    
    func handleTap_mainview(_ sender: UITapGestureRecognizer?) {
        self.searchBar.resignFirstResponder()
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

extension SearchPhoGrap : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            phoGrapInfo = tmpPhoGrapInfo
            self.phoGrapTable.reloadData()
        }else {
            filterTableView(text: searchText)
        }
    }
}

extension SearchPhoGrap : UITableViewDelegate,UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return phoGrapInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.phoGrapTable.dequeueReusableCell(withIdentifier: "PhoGrapCell") as! PhoGrapCell
        
        cell.phoGrapImg.imageFromUrl(phoGrapInfo[indexPath.row].profile_url, defaultImgPath: "artist")
        cell.phoGrapID.text = phoGrapInfo[indexPath.row].id
        cell.phoGrapHashTag.text = phoGrapInfo[indexPath.row].hashtag
        cell.phoGrapLocation.text = phoGrapInfo[indexPath.row].location
        
        cell.phoGrapImg.layer.cornerRadius = (cell.phoGrapImg?.frame.size.width)! / 2
        cell.phoGrapImg.layer.masksToBounds = true
        
        
         if phoGrapInfo[indexPath.row].picked == true {
         cell.isPickedImg.image = UIImage(named: "pick_photo")
         }
        
        tmp = tmp + 1
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(" Search table click")
        let tmpStoryboard = UIStoryboard(name: "Home", bundle: nil)
        if let dvc = tmpStoryboard.instantiateViewController(withIdentifier: "PhoGrapInfo") as? DetailPhoGrapInfo {
            dvc._phograpID = phoGrapInfo[indexPath.row].id
            dvc._phograpImg = phoGrapInfo[indexPath.row].profile_url
            dvc._phograpName = phoGrapInfo[indexPath.row].id
            dvc._phograpHashTag = phoGrapInfo[indexPath.row].hashtag
            dvc._phograpLocation = phoGrapInfo[indexPath.row].location
            dvc._phograpPicked = phoGrapInfo[indexPath.row].picked
            self.navigationController?.pushViewController(dvc, animated: true)
        }
    }
}










