//
//  portfolioViewController.swift
//  Pickture
//
//  Created by Kiyong Shin on 30/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import UIKit

final class portfolioViewController: UIViewController, NetworkCallback{
    
    @IBOutlet weak var MyCollection: UICollectionView!
    
    var collectionData: [PhograpPoFolImgListVO] = []
    var phograpID : String?
    var _photoID : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MyCollection.delegate = self
        MyCollection.dataSource = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let model = PhograpInfoModel(self)
        model.getPoFolImglist(phograpID!)
    }
    
    //////통신 코드/////
    
    func networkResult(resultData: Any, code: String) {
        //게시글내용을 분기해서 가져옵니다
        if code == "getPoFolImglist" {
            collectionData = resultData as! [PhograpPoFolImgListVO]
            MyCollection.reloadData()
        }
    }
}


extension portfolioViewController :  UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionData.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PoFolDetailImgCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PoFolDetailImgCell", for: indexPath) as! PoFolDetailImgCell
        cell.myPickImg.imageFromUrl(collectionData[indexPath.row].url, defaultImgPath: "artist")
        ///////////////////////////////////////////////
        /////////PickDetailFromPoFol에 넘겨줘야///////////
        ///////////////////////////////////////////////
        _photoID = collectionData[indexPath.row].id
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "PickDetailFromPoFol") as?
            PickDetailFromPoFol else{
                return
        }
        dvc.collectionData = collectionData
        navigationController?.pushViewController(dvc, animated: true)
    }
    
    
    /*
     //셀 사이즈
     public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
     return CGSize(width: UIScreen.main.bounds.size.width , height: 55)
     }
     */
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        var collectionViewSize = collectionView.frame.size
        collectionViewSize.width = collectionViewSize.width/3.0 //Display Three elements in a row.
        collectionViewSize.height = collectionViewSize.height/4.0
        return collectionViewSize
    }
    
    
    
}
