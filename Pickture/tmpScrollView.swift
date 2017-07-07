//
//  tmpScrollView.swift
//  Pickture
//
//  Created by Kiyong Shin on 01/07/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import UIKit

class tmpScrollView : UIViewController {
    
    var imgArray = [UIImage]()
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    
    override func viewDidLoad() {
        
        imgArray = [#imageLiteral(resourceName: "artist"), #imageLiteral(resourceName: "loginbutton_facebook"), #imageLiteral(resourceName: "background"), #imageLiteral(resourceName: "relock")]
//        imgArray = [UIImage(named : "background")!]
        
        for i in 0 ..< (imgArray.count) {
            let imgView = UIImageView()
            imgView.image = imgArray[i]
            imgView.contentMode = .scaleAspectFit
            let xPosition = self.view.frame.width * CGFloat(i)
            imgView.frame = CGRect(x: xPosition, y: 0, width: self.mainScrollView.frame.width, height: self.mainScrollView.frame.height)
            
            mainScrollView.contentSize.width = mainScrollView.frame.width * CGFloat(i+1)
        }
        
        
    }
    
    
}
