//
//  photoViewController.swift
//  Pickture
//
//  Created by Kiyong Shin on 02/07/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire


final class photoViewController: UIViewController, NetworkCallback {
    
    @IBOutlet weak var MyCollection: UICollectionView!
    
    var collectionData: [MyPickImgListVO] = [MyPickImgListVO]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        MyCollection.delegate = self
        MyCollection.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
         let model = MyPickModel(self)
         model.getMyPickImgList()
    }
    
    func networkResult(resultData: Any, code: String) {
        if code == "getMyPickImgList"{
            collectionData = resultData as! [MyPickImgListVO]
            MyCollection.reloadData()
        }
    }
}


extension photoViewController :  UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MyPickImgListCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyPickImgListCell", for: indexPath) as! MyPickImgListCell
        cell.myPickImg.imageFromUrl(collectionData[indexPath.row].url, defaultImgPath: "artist")
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Cell \(indexPath.row) selected")
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        var collectionViewSize = collectionView.frame.size
        collectionViewSize.width = collectionViewSize.width/3.0 //Display Three elements in a row.
        collectionViewSize.height = collectionViewSize.height/4.0
        return collectionViewSize
    }
    
}


