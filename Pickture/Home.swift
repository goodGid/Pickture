//
//  Home.swift
//  Pickture
//
//  Created by Kiyong Shin on 28/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import UIKit

class Home: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{

    @IBOutlet weak var myCollection: UICollectionView!
    
    var tableData: [String] = ["1" , "2", "3", "4"]
    
    override func viewDidLoad() {
        myCollection.delegate = self
        myCollection.dataSource = self

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // Collection View
    ////////////////////////////////////////////////////////////////////////////////////////////////
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tableData.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionCell
        cell.txtLabel.text = tableData[indexPath.row]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Cell \(indexPath.row) selected")
    }

    
    //셀 사이즈
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: UIScreen.main.bounds.size.width , height: 55)
    }
    
    
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // btn
    ////////////////////////////////////////////////////////////////////////////////////////////////
    
    @IBAction func btnDate(_ sender: Any) {
        
        if let svc = storyboard?.instantiateViewController(withIdentifier: "DetailCategory") as? DetailCategory {
            svc._categoryLabel = gsno("test")
            //            svc.id = gsno(_id)
            //            svc.password = gsno(_password)
            self.navigationController?.pushViewController(svc, animated: true)
        }
    }
    
    @IBAction func btnFriends(_ sender: Any) {
        
    }
    
    @IBAction func btnWedding(_ sender: Any) {
        
    }
    
    @IBAction func btnBaby(_ sender: Any) {
        
    }
    
    @IBAction func btnProfile(_ sender: Any) {
        
    }
    
    
    @IBAction func btnEtc(_ sender: Any) {
    }
    
}



