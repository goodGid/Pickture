//
//  MyPick.swift
//  Pickture
//
//  Created by Kiyong Shin on 02/07/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//


import UIKit
import AlamofireObjectMapper
import Alamofire

class MyPick : UIViewController {
    
    
    @IBOutlet weak var segControl: UISegmentedControl!
    
    @IBOutlet weak var phoGrapView: UIView!
    
    @IBOutlet weak var photoView: UIView!
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // Start
    // Container View Setting - Variable
    ////////////////////////////////////////////////////////////////////////////////////////////////
    
    private lazy var phoGrapViewController: phoGrapViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "phoGrapViewController") as! phoGrapViewController
        
        return viewController
    }()
    
    
    
    private lazy var photoViewController: photoViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "photoViewController") as! photoViewController
        
        return viewController
    }()
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // End
    // Container View Setting - Variable
    ////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
    override func viewDidLoad() {
        
        // 다음 뷰 백버튼
        let backItem = UIBarButtonItem()
        backItem.title = ""
        self.navigationItem.backBarButtonItem = backItem
        
        // 지금 뷰 타이틀
        self.navigationItem.title = "MY PICK"
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = UIColor(red: 229.0/255.0, green: 167.0/255.0, blue: 28.0/255.0, alpha: 0.8)
        
    }
    
    
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            UIView.animate(withDuration: 0.5, animations: {
                self.phoGrapView.alpha = 1
                self.photoView.alpha = 0
            })
        }  else {
            UIView.animate(withDuration: 0.5, animations: {
                self.phoGrapView.alpha = 0
                self.photoView.alpha = 1
            })
        }
        
    }
    
    
    
}
