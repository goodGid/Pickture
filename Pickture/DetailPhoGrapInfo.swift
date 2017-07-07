//
//  DetailPhoGrapInfo.swift
//  Pickture
//
//  Created by Kiyong Shin on 30/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import UIKit


class DetailPhoGrapInfo : UIViewController, SendRequestDelegate, NetworkCallback {
    @IBOutlet weak var segControl: UISegmentedControl!
    
    @IBOutlet weak var portfolioView: UIView!
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var reviewView: UIView!
    
    @IBOutlet weak var phoGrapImg: UIImageView!
    @IBOutlet weak var phoGrapName: UILabel!
    
    @IBOutlet weak var btnPick: UIButton!
    @IBOutlet weak var btnSend: UIButton!
    
    
    @IBOutlet weak var txtHashTag: UILabel!
    @IBOutlet weak var txtLocation: UILabel!
    
    
    var _phograpID : String?
    var _phograpImg : String?
    var _phograpName : String?
    var _phograpHashTag : String?
    var _phograpLocation : String?
    var _phograpPicked : Bool?
    
    
    
    var listDetail : PoFolImgVO?
    
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
        
        self.phoGrapImg.imageFromUrl(self._phograpImg, defaultImgPath: "artist")
        
        self.phoGrapImg.layer.cornerRadius = (self.phoGrapImg?.frame.size.width)! / 2
        self.phoGrapImg.layer.masksToBounds = true
        
        
        self.phoGrapName.text = _phograpName
        self.txtHashTag.text = _phograpHashTag
        self.txtLocation.text = _phograpLocation
        
        
        if _phograpPicked! {
        btnPick.setImage(UIImage(named: "check"), for: UIControlState())
        }
        else {
        btnPick.setImage(UIImage(named: "uncheck"), for: UIControlState())
        }
        
        
        
        
        // 다음 뷰 백버튼
        let backItem = UIBarButtonItem()
        backItem.title = ""
        self.navigationItem.backBarButtonItem = backItem
        
        // 지금 뷰 타이틀
        self.navigationItem.title = "PHOTOGRAPHER"
        self.navigationController?.navigationBar.topItem?.title = ""
        self.navigationController?.navigationBar.tintColor = UIColor(red: 229.0/255.0, green: 167.0/255.0, blue: 28.0/255.0, alpha: 0.8)
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    func networkResult(resultData: Any, code: String) {
        if code == "pickPhoGrap" {
            self.btnPick.setImage(UIImage(named: "check"), for: UIControlState())
        }
        else if code == "unpickPhoGrap" {
            self.btnPick.setImage(UIImage(named: "uncheck"), for: UIControlState())
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? portfolioViewController{
            vc.phograpID = _phograpName
        }
        if let vc = segue.destination as? infoViewController{
            vc.phograpID = _phograpName
        }
        if let vc = segue.destination as? reviewViewController{
            vc.phograpID = _phograpName
        }
        if let destination = segue.destination as? SendRequest {
            destination.delegate = self
        }
    }
    
    func passData(data: String) {
        print(data)
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
    
    
    
    @IBAction func btnPick(_ sender: Any) {
        let model = PickPhoGrapModel(self)
        model.pickPhoGrap(phoGrapID: _phograpName!)
    }
    
    
    
    @IBAction func btnSend(_ sender: Any) {
        performSegue(withIdentifier: "PhoGrapInfo", sender: nil)
        
        if let svc = self.storyboard?.instantiateViewController(withIdentifier: "SendRequestID") as? SendRequest {
            svc.photographer_id = _phograpID
            svc._phograpImg = _phograpImg
//            self.navigationController?.pushViewController(svc, animated: true)
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
