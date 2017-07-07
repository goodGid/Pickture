//
//  SwipeViewController.swift
//  Pickture
//
//  Created by Kiyong Shin on 02/07/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import UIKit

class SwipeViewController : UIViewController {
    
    
    @IBAction func leftSwipe(_ sender: UISwipeGestureRecognizer) {
        
        self.view.backgroundColor = UIColor.blue
        
    }
    
    @IBAction func rightSwipe(_ sender: UISwipeGestureRecognizer) {
        
        self.view.backgroundColor = UIColor.yellow
        
    }
    
    
}
