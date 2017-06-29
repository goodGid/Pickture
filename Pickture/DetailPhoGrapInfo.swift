//
//  DetailPhoGrapInfo.swift
//  Pickture
//
//  Created by Kiyong Shin on 30/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import UIKit

class DetailPhoGrapInfo : UIViewController {
    
    @IBOutlet weak var segControl: UISegmentedControl!
    
    @IBOutlet weak var portfolioView: UIView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var reviewView: UIView!
    
    @IBOutlet weak var phoGrapImg: UIImageView!
    @IBOutlet weak var phoGrapName: UILabel!
    
    @IBOutlet weak var btnPick: UIButton!
    
    @IBOutlet weak var btnSend: UIButton!
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // Start
    // Container View Setting - Variable
    ////////////////////////////////////////////////////////////////////////////////////////////////
    
    private lazy var portfolioViewController: portfolioViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "portfolioView") as! portfolioViewController
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    
    
    private lazy var infoViewController: infoViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "infoView") as! infoViewController
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()
    
    
    private lazy var reviewViewController: reviewViewController = {
        // Load Storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // Instantiate View Controller
        var viewController = storyboard.instantiateViewController(withIdentifier: "reviewView") as! reviewViewController
        
        // Add View Controller as Child View Controller
        self.add(asChildViewController: viewController)
        
        return viewController
    }()

    ////////////////////////////////////////////////////////////////////////////////////////////////
    // End
    // Container View Setting - Variable
    ////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupView()
        
    }
  
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            UIView.animate(withDuration: 0.5, animations: {
                self.portfolioView.alpha = 1
                self.infoView.alpha = 0
                self.reviewView.alpha = 0
            })
        } else if sender.selectedSegmentIndex == 1 {
            UIView.animate(withDuration: 0.5, animations: {
                self.portfolioView.alpha = 0
                self.infoView.alpha = 1
                self.reviewView.alpha = 0
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.portfolioView.alpha = 0
                self.infoView.alpha = 0
                self.reviewView.alpha = 1
            })
        }
    }
    
    
    
    
    
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // Start
    // Container View Setting - Method
    ////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
    private func setupView() {
        if segControl.selectedSegmentIndex == 0 {
            add(asChildViewController: portfolioViewController)
            remove(asChildViewController: infoViewController)
            remove(asChildViewController: reviewViewController)
            
        } else if segControl.selectedSegmentIndex == 1 {
            add(asChildViewController: reviewViewController)
            remove(asChildViewController: portfolioViewController)
            remove(asChildViewController: reviewViewController)
        } else {
            add(asChildViewController: reviewViewController)
            remove(asChildViewController: portfolioViewController)
            remove(asChildViewController: infoViewController)
        }
        
    }
    
    
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
//        addChildViewController(viewController)
        
        // Add Child View as Subview
//        view.addSubview(viewController.view)
        
        // Configure Child View
//        viewController.view.frame = view.bounds
//        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
//        viewController.didMove(toParentViewController: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParentViewController: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParentViewController()
    }
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // End
    // Container View Setting - Method
    ////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
    
    
    
    
    
    
    
    
    
}
