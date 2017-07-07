//
//  MyPickListFromSendRequest.swift
//  Pickture
//
//  Created by Kiyong Shin on 05/07/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import UIKit

class MyPickListFromSendRequest : UIViewController, NetworkCallback {
    
    @IBOutlet weak var myPickImgListCollection: UICollectionView!

    var collectionData : [MyPickListFromSendRequestVO] = [MyPickListFromSendRequestVO]()
    
    var pickedImgUrl : String = ""
    
    
    override func viewDidLoad() {
        myPickImgListCollection.delegate = self
        myPickImgListCollection.dataSource = self
        
        let model = HomeModel(self)
        model.getMyPickListFromSendRequest()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let model = MyPickModel(self)
        model.getMyPickImgList()
        
    }
    
    //////통신 코드/////
    
    func networkResult(resultData: Any, code: String) {
        if code == "getMyPickListFromSendRequest" {
            collectionData = resultData as! [MyPickListFromSendRequestVO]
            myPickImgListCollection.reloadData()
        }
      
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "pickedCategory" {
            // 선택된 이미지 값을 여기에 넣기
            pickedImgUrl = ""
            
        }
    }
    
}


extension MyPickListFromSendRequest :  UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MyPickImgListCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyPickImgListCollectionCell", for: indexPath) as! MyPickImgListCollectionCell
       // cell.myPickImg.imageFromUrl(collectionData[indexPath.row].url, defaultImgPath: "artist")
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "MyPickListFromSendRequest") as?
            MyPickListFromSendRequest else{
                return
        }
        dvc.collectionData = collectionData
        navigationController?.pushViewController(dvc, animated: true)
    }
        
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        var collectionViewSize = collectionView.frame.size
        collectionViewSize.width = collectionViewSize.width/3.0 //Display Three elements in a row.
        collectionViewSize.height = collectionViewSize.height/4.0
        return collectionViewSize
    }
    
    
}
