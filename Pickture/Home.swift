//
//  Home.swift
//  Pickture
//
//  Created by Kiyong Shin on 28/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire
import Kingfisher


class Home: UIViewController, UIGestureRecognizerDelegate , NetworkCallback{
    @IBOutlet weak var slideScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var betstImgList : [PhotographersVO] = [PhotographersVO]()
    
    var tableData: [String] = ["1" , "2", "3", "4"]
    var slidesCnt : Int?
    var slides:[Slide] = []
    var picked : Int = 0
    var tmpImg : UIImageView?
    
    @IBOutlet weak var btnBest1: UIButton!
    @IBOutlet weak var btnBest2: UIButton!
    @IBOutlet weak var btnBest3: UIButton!
    @IBOutlet weak var btnBest4: UIButton!
    
    
    
    override func viewDidLoad() {
        slideScrollView.delegate = self
        
        slides.append(CreateSlides("1"))
        slides.append(CreateSlides("2"))
        slides.append(CreateSlides("3"))
        
        slidesCnt = slides.count
        setupSlideScrollView(slides: slides)

        
        
        
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0

        view.bringSubview(toFront: pageControl)
        
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        self.navigationItem.backBarButtonItem = backItem
        
        self.navigationItem.title = ""
        self.navigationController?.navigationBar.tintColor = UIColor(red: 229.0/255.0, green: 167.0/255.0, blue: 28.0/255.0, alpha: 0.8)
        
        var titleView = UIImageView(image: UIImage(named: "home_logo"))
        self.navigationItem.titleView = titleView
        
        
        
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(moveToNextPage), userInfo: nil, repeats: true)
    }
    
    
    override func viewDidLayoutSubviews() {
        slideScrollView.contentSize = CGSize(width: slideScrollView.contentSize.width, height: slideScrollView.frame.size.height)
    }
    

    override func viewWillAppear(_ animated: Bool) {
        let model = HomeModel(self)
        model.getBestImgList()
    }
    
    
    func networkResult(resultData: Any, code: String) {
        if code == "getBestImgList"{
            betstImgList = resultData as! [PhotographersVO]

            
            tmpImg?.imageFromUrl(betstImgList[0].profile_url, defaultImgPath: "artist")
                if let url = betstImgList[0].profile_url {
                    if url.isEmpty {
                        btnBest1.setImage(#imageLiteral(resourceName: "artist"), for: .normal)
                    }
                    else {
                        btnBest1.kf.setBackgroundImage(with: URL(string: url), for: .normal, placeholder: #imageLiteral(resourceName: "artist"), options: [.transition(.fade(0.5))], progressBlock: nil, completionHandler: nil)
                    }
                }
                else {
                    btnBest1.setImage(#imageLiteral(resourceName: "artist"), for: .normal)
            }
            
            
            tmpImg?.imageFromUrl(betstImgList[1].profile_url, defaultImgPath: "artist")
            if let url = betstImgList[1].profile_url {
                if url.isEmpty {
                    btnBest2.setImage(#imageLiteral(resourceName: "artist"), for: .normal)
                }
                else {
                    btnBest2.kf.setBackgroundImage(with: URL(string: url), for: .normal, placeholder: #imageLiteral(resourceName: "artist"), options: [.transition(.fade(0.5))], progressBlock: nil, completionHandler: nil)
                }
            }
            else {
                btnBest2.setImage(#imageLiteral(resourceName: "artist"), for: .normal)
            }
            
            
            tmpImg?.imageFromUrl(betstImgList[2].profile_url, defaultImgPath: "artist")
            if let url = betstImgList[2].profile_url {
                if url.isEmpty {
                    btnBest3.setImage(#imageLiteral(resourceName: "artist"), for: .normal)
                }
                else {
                    btnBest3.kf.setBackgroundImage(with: URL(string: url), for: .normal, placeholder: #imageLiteral(resourceName: "artist"), options: [.transition(.fade(0.5))], progressBlock: nil, completionHandler: nil)
                }
            }
            else {
                btnBest3.setImage(#imageLiteral(resourceName: "artist"), for: .normal)
            }
            
            
            
            tmpImg?.imageFromUrl(betstImgList[3].profile_url, defaultImgPath: "artist")
            if let url = betstImgList[3].profile_url {
                if url.isEmpty {
                    btnBest4.setImage(#imageLiteral(resourceName: "artist"), for: .normal)
                }
                else {
                    btnBest4.kf.setBackgroundImage(with: URL(string: url), for: .normal, placeholder: #imageLiteral(resourceName: "artist"), options: [.transition(.fade(0.5))], progressBlock: nil, completionHandler: nil)
                }
            }
            else {
                btnBest4.setImage(#imageLiteral(resourceName: "artist"), for: .normal)
            }
            
            
        }
    }
   
 
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // btn
    ////////////////////////////////////////////////////////////////////////////////////////////////
    @IBAction func btnDate(_ sender: Any) {
        let tmpStoryboard = UIStoryboard(name: "Home", bundle: nil)
        if let svc = tmpStoryboard.instantiateViewController(withIdentifier: "DetailCategory") as? DetailCategory {
            svc._categoryLabel = gsno("DATE")
            self.navigationController?.pushViewController(svc, animated: true)
        }
    }
    @IBAction func btnFriends(_ sender: Any) {
        let tmpStoryboard = UIStoryboard(name: "Home", bundle: nil)
        if let svc = tmpStoryboard.instantiateViewController(withIdentifier: "DetailCategory") as? DetailCategory {
            svc._categoryLabel = gsno("FRIENDS")
            self.navigationController?.pushViewController(svc, animated: true)
        }
    }
    @IBAction func btnWedding(_ sender: Any) {
        let tmpStoryboard = UIStoryboard(name: "Home", bundle: nil)
        if let svc = tmpStoryboard.instantiateViewController(withIdentifier: "DetailCategory") as? DetailCategory {
            svc._categoryLabel = gsno("WEDDING")
            self.navigationController?.pushViewController(svc, animated: true)
        }
    }
    @IBAction func btnBaby(_ sender: Any) {
        let tmpStoryboard = UIStoryboard(name: "Home", bundle: nil)
        if let svc = tmpStoryboard.instantiateViewController(withIdentifier: "DetailCategory") as? DetailCategory {
            svc._categoryLabel = gsno("BABY")
            self.navigationController?.pushViewController(svc, animated: true)
        }
    }
    @IBAction func btnProfile(_ sender: Any) {
        let tmpStoryboard = UIStoryboard(name: "Home", bundle: nil)
        if let svc = tmpStoryboard.instantiateViewController(withIdentifier: "DetailCategory") as? DetailCategory {
            svc._categoryLabel = gsno("PROFILE")
            self.navigationController?.pushViewController(svc, animated: true)
        }
    }
    @IBAction func btnEtc(_ sender: Any) {
        let tmpStoryboard = UIStoryboard(name: "Home", bundle: nil)
        if let svc = tmpStoryboard.instantiateViewController(withIdentifier: "DetailCategory") as? DetailCategory {
            svc._categoryLabel = gsno("ETC")
            self.navigationController?.pushViewController(svc, animated: true)
        }
    }
    
    @IBAction func btnBest1(_ sender: Any) {
        
    }
    @IBAction func btnBest2(_ sender: Any) {
    
    }
    @IBAction func btnBest3(_ sender: Any) {
    
    }
    @IBAction func btnBest4(_ sender: Any) {
    
    }
    
    
    
    
    
    
    
}


extension Home : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        
        
    }
    
    func CreateSlides(_ index : String) -> Slide {
        let slide : Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        let imgName : String = "banner_" +  (index)
        slide.bestImg.image = UIImage(named : imgName)
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(Home.imageTapped(_:)))
        tapRecognizer.delegate = self
        
        slide.addGestureRecognizer(tapRecognizer)
        slide.tag = 0

        return slide
    }
    
    
    func initSlides() -> [Slide] {
        let slide1 : Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.bestImg.image = UIImage(named : "banner_1")
        slide1.index = 1
        slide1.tag = 1
 
        return [slide1]
    }
    
    
    
    func setupSlideScrollView(slides : [Slide]){
        slideScrollView.frame = CGRect(x: 0, y: 70, width: view.frame.width, height: 94)
        slideScrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: 94)
        slideScrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count{
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: 94)
            slides[i].tag = i
            slideScrollView.addSubview(slides[i])
        }
    }
    
    
    
    func imageTapped(_ sender : UITapGestureRecognizer?){
        let view = sender?.view as! Slide
        print(view.tag)
    }
    
    
    func moveToNextPage (){
        
        let pageWidth:CGFloat = self.slideScrollView.frame.width
        let maxWidth:CGFloat = pageWidth * CGFloat(slides.count)
        let contentOffset:CGFloat = self.slideScrollView.contentOffset.x
        
        var slideToX = contentOffset + pageWidth
        
        if  contentOffset + pageWidth == maxWidth
        {
            slideToX = 0
        }
        self.slideScrollView.scrollRectToVisible(CGRect(x:slideToX, y:0, width:pageWidth, height:self.slideScrollView.frame.height), animated: true)
    }
    

}



