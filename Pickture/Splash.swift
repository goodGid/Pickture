//
//  Splash.swift
//  Pickture
//
//  Created by Kiyong Shin on 04/07/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import UIKit

class Splash : UIViewController {
    
    @IBOutlet weak var img: UIImageView!
//    var delayInSeconds = 10.0
    var delayInSeconds = 0.0

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.img.loadGif(name: "flash2")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
            
            let main_storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let main = main_storyboard.instantiateViewController(withIdentifier: "Login") as? Login else {return}
            self.present(main, animated: true, completion: nil)
        }
    }
}
