//
//  SliderSwift.swift
//  Pickture
//
//  Created by Kiyong Shin on 30/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import UIKit

class SliderSwift : UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var slideScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    override func viewDidLoad() {
    
        slideScrollView.delegate = self
        
        var slides:[Slide] = createSlides()
        slides.append(stCreateSlides())
        
        setupSlideScrollView(slides: slides)
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        
        view.bringSubview(toFront: pageControl)
//        view.addSubview(pageControl)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        
        
    }
    
    func stCreateSlides() -> Slide {
        let slide : Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide.label.text = "Slider1"
    
        return slide
    }
    
    
    func createSlides() -> [Slide] {
        let slide1 : Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.label.text = "Slider1"
        
        let slide2 : Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.label.text = "Slider2"
        
        let slide3 : Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.label.text = "Slider2"
        
        return [slide1, slide2, slide3]
    }
    
    
    
    func setupSlideScrollView(slides : [Slide]){
        slideScrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        slideScrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        slideScrollView.isPagingEnabled = true
        
        
        for i in 0 ..< slides.count{
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            slideScrollView.addSubview(slides[i])
        }
        
        
    }
    
    
}
