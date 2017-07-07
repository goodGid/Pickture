//
//  ViewController.swift
//  Pickture
//
//  Created by Kiyong Shin on 25/06/2017.
//  Copyright © 2017 기용 신. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKShareKit
import FBSDKCoreKit

class Login: UIViewController, UIGestureRecognizerDelegate, FBSDKLoginButtonDelegate, NetworkCallback {
    
    
    @IBOutlet weak var inputID: UITextField!
    @IBOutlet weak var inputPW: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    var check = true
    
    let loginView : FBSDKLoginButton = FBSDKLoginButton()
    var loginMannager : FBSDKLoginManager?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        
        btnLogin.roundedButton()
        
        
        loginMannager = FBSDKLoginManager()
        loginView.frame = CGRect(x: 84, y: 448, width: 206, height: 40)
        loginView.layer.cornerRadius = 50
        self.view.addSubview(loginView)
        
        let buttonText = NSAttributedString(string: "Login with Facebook")
        loginView.setAttributedTitle(buttonText, for: .normal)
        loginView.roundedButton()
        //        loginView.titleLabel!.font =  UIFont(name: "Regular", size: 1)
        
        loginView.readPermissions = ["public_profile", "email", "user_friends"]
        loginView.delegate = self
        loginView.setImage(UIImage(named: "facebook_logo"), for: UIControlState())
        //        loginView.layer.backgroundColor = UIColor.black.cgColor
        
        inputID.autocapitalizationType = .none
        
        
        
        /*
         
         if (FBSDKAccessToken.current() != nil)
         {
         self.returnUserData()
         }
         print("========   Token   =========")
         print(FBSDKAccessToken.current())
         print("===============")
         
         
         
         self.returnUserData()
         */
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap_mainview(_: )))
        tap.delegate = self
        self.view.addGestureRecognizer(tap)
        
        
        inputID.setBottomBorder()
        inputPW.setBottomBorder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        registerForKeyboardNotifications()
    }
    override func viewWillDisappear(_ animated: Bool) {
        unregisterForKeyboardNotifications()
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                // Do work
                if let svc = storyboard?.instantiateViewController(withIdentifier: "Root")  {
                    self.present(svc, animated: true, completion: nil)
                }
                
            }
            
            self.returnUserData()
        }
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        self.returnUserData()
    }
    
    func returnUserData()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.start(completionHandler: { (connection, result, error) -> Void in
            
            
            if result != nil
            {
                print("======   result   =========")
                print(result!)
                print("===============")
            }
            else
            {
                print("======   result nil   =========")
                print(result)
                print("===============")
                
            }
        })
    }
    
    func networkResult(resultData: Any, code: String) {
        if code == "LoginSuccess" {
            if let svc = storyboard?.instantiateViewController(withIdentifier: "Root")  {
                self.present(svc, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        guard var _id = inputID.text, var _password = inputPW.text else{
            return
        }
        
        _id = gsno(_id)
        _password = gsno(_password)
        
        let model = LoginModel(self)
        model.userLogin(id: _id, password: _password)
    }
    
    
    @IBAction func regUser(_ sender: Any) {
        if let svc = storyboard?.instantiateViewController(withIdentifier: "UserJoin") as? UserJoin {
            present(svc, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func regPhotographer(_ sender: Any) {
        if let svc = storyboard?.instantiateViewController(withIdentifier: "PhoGrapJoin_1") as? PhoGrapJoin_1 {
            present(svc, animated: true, completion: nil)
        }
    }
    
    
    ////////////////////////////////////////////////////////////////////////////////////////////////
    // Key Board
    ////////////////////////////////////////////////////////////////////////////////////////////////
    
    func handleTap_mainview(_ sender: UITapGestureRecognizer?) {
        self.inputID.resignFirstResponder()
        self.inputPW.resignFirstResponder()
    }
    
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector:#selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    
    func unregisterForKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name:NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name:NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWillShow(note: NSNotification) {
        
    }
    
    func keyboardWillHide(note: NSNotification) {
        
    }
    
    
    
}



