//
//  PickDetailFromPoFol.swift
//  Pickture
//
//  Created by Kiyong Shin on 01/07/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import UIKit

class PickDetailFromPoFol : UIViewController, NetworkCallback {
    
    func networkResult(resultData: Any, code: String) {
        
    }
    
    
    @IBOutlet weak var slideScrollView: UIScrollView!
    
    var collectionData: [PhograpPoFolImgListVO] = []
    
    let tmpImg : UIImageView? = nil
    var slidesCnt : Int?
    var slides:[Slide] = []
    
    
    override func viewDidLoad() {
        slideScrollView.delegate = self
        initSlides()
        setupSlideScrollView(slides: slides)
        
        self.navigationItem.title = "PHOTOGRAPHER"
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = UIColor(red: 229.0/255.0, green: 167.0/255.0, blue: 28.0/255.0, alpha: 0.8)
        
        
    }
    
    @IBAction func pickPhoto(_ sender: Any) {
        let model = PickPhotoModel(self)
        model.pickPhoto(photoID: "_photoID")
    }
    
    func initSlides(){
        for i in 0 ..< collectionData.count{
            slides.append(CreateSlides(i))
        }
    }
    
    
    
}

extension PickDetailFromPoFol : UIScrollViewDelegate {
    
    func CreateSlides(_ index: Int) -> Slide {
        
        let slide : Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        tmpImg?.imageFromUrl(collectionData[index].url, defaultImgPath: "artist")
        //        slide.bestImg.image = tmpImg?.image
        slide.bestImg.image = UIImage(named : "artist")
        return slide
    }
    
    func setupSlideScrollView(slides : [Slide]){
        slideScrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 600)
        slideScrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: 400)
        slideScrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count{
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: 100)
            
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(Home.imageTapped))
            slides[i].tag = i
            slides[i].addGestureRecognizer(tapRecognizer)
            
            print(" PickDetailFromPoFol -> Slide Size Chk ")
            print(view.frame.width)
            print(view.frame.height)
            
            
            
            slideScrollView.addSubview(slides[i])
        }
    }
    
    
    
    func imageTapped(_ sender : UIView){
        print(slides[0].index)
        print(slides[1].index)
        print(slides[2].index)
    }
    
    
    func moveToNextPage (){
        
        let pageWidth:CGFloat = self.slideScrollView.frame.width
        let maxWidth:CGFloat = pageWidth * CGFloat(slidesCnt!)
        let contentOffset:CGFloat = self.slideScrollView.contentOffset.x
        
        var slideToX = contentOffset + pageWidth
        
        if  contentOffset + pageWidth == maxWidth
        {
            slideToX = 0
        }
        self.slideScrollView.scrollRectToVisible(CGRect(x:slideToX, y:0, width:pageWidth, height:self.slideScrollView.frame.height), animated: true)
    }
}

