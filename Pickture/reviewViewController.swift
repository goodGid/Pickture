//
//  reviewViewController.swift
//  Pickture
//
//  Created by Kiyong Shin on 30/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import UIKit
import AlamofireObjectMapper
import Alamofire
import Cosmos

final class reviewViewController: UIViewController, UIGestureRecognizerDelegate, NetworkCallback {
    
    @IBOutlet weak var reviewTable: UITableView!
    var reviewData : [ReviewVO] = []
    var rate : Int?
    var phograpID : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reviewTable.delegate = self
        reviewTable.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let model = PhoGrapReviewModel(self)
        model.showReviews(phograpID!)
    }
    
    func networkResult(resultData: Any, code: String) {
        if code == "GetRreviewSuccess"{
            reviewData = resultData as! [ReviewVO]
            reviewTable.reloadData()
        }
    }
}

extension reviewViewController : UITableViewDelegate,UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //  Edit Scope !
        //        return threedaysForecast.count
        
        return reviewData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = reviewTable.dequeueReusableCell(withIdentifier: "ReviewCell") as! ReviewCell
        
        let timestamp = reviewData[indexPath.row].timestamp
        
        var date = ""
        
        for row in (timestamp?.characters)! {
            if row == " " {
                break
            }
            date += "\(row)"
        }
        
        cell.txtID.text = reviewData[indexPath.row].userID
        rate = reviewData[indexPath.row].rate
        cell.txtDate.text = date
        
        
        
//        cell.imgRating.rating = Double(rate!)
        cell.imgRating.rating = 2.2
        
        
        // Set the color of a filled star
        cell.imgRating.settings.filledColor = UIColor.orange
        // Set the border color of an empty star
        cell.imgRating.settings.emptyBorderColor = UIColor.white
        // Set the border color of a filled star
        cell.imgRating.settings.filledBorderColor = UIColor.orange
        cell.imgRating.settings.starMargin = 5
        
        return cell
    }
    
}

