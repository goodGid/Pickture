//
//  id_nameViewController.swift
//  Pickture
//
//  Created by Kiyong Shin on 02/07/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire


final class id_nameViewController: UIViewController, UIGestureRecognizerDelegate, NetworkCallback {
    
    @IBOutlet weak var phoGrapTable: UITableView!
    var dataAry : [String] = ["1", "2", "3", "4"]
    
    var phoGrapInfo : [PhoGrapVO] = [PhoGrapVO]()
    var phoGrapInfo2 : [String] = ["1", "2", "3", "4"]
    
    var searchBar : UISearchBar! = nil
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.phoGrapTable.delegate = self
        self.phoGrapTable.dataSource = self
        self.searchBarSetup()
     
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap_mainview(_: )))
        tap.delegate = self
        self.view.addGestureRecognizer(tap)
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        /*
         let model = HomeModel(self)
         model.getPhograpListFromCate(category: "date")
         */
    }
    
    func networkResult(resultData: Any, code: String) {
        if code == "getPhograpListFromCate"{
            //            phograpLists = resultData as! [photographersVO]
            //            CateListTable.reloadData()
        }
    }
    
    
    
    
    func searchBarSetup() {
        searchBar = UISearchBar(frame: CGRect(x:0,y:0,width:(UIScreen.main.bounds.width),height:70))
        searchBar.showsScopeBar = true
        searchBar.delegate = self
        
        searchBar.layer.backgroundColor = UIColor.blue.cgColor
        
        self.phoGrapTable.tableHeaderView = searchBar
    }
    
    
    func filterTableView(ind:Int,text:String) {
        
        phoGrapInfo = phoGrapInfo.filter({ (mod) -> Bool in
                return (mod.ID?.lowercased().contains(text.lowercased()))!
            })
        self.phoGrapTable.reloadData()
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

extension id_nameViewController : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.phoGrapTable.reloadData()
        }else {
            filterTableView(ind: searchBar.selectedScopeButtonIndex, text: searchText)
        }
        
        
    }
}

extension id_nameViewController : UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        //  Edit Scope !
        //        return threedaysForecast.count
        
        
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.phoGrapTable.dequeueReusableCell(withIdentifier: "PhoGrapCell") as! PhoGrapCell
        /*
         Edit Scope !
         
         let forecast = threedaysForecast[indexPath.row]
         cell.temperatureTxt.text = "\(forecast.temperature!)"
         cell.weatherImg.image = UIImage(named: forecast.conditions!)
         */
        return cell
    }
    
}


