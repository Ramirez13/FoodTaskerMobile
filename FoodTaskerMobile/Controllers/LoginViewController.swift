//
//  LoginViewController.swift
//  FoodTaskerMobile
//
//  Created by Konstantin Chukhas on 12/15/18.
//  Copyright © 2018 Konstantin Chukhas. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController {
    @IBOutlet weak var bLogin: UIButton!
    @IBOutlet weak var bLogout: UIButton!
    
    var fbLoginSuccess = false

    override func viewDidLoad() {
        super.viewDidLoad()
        if (FBSDKAccessToken.current() != nil){
            bLogout.isHidden = false
            FBManager.getFBUserData {
                self.bLogin.setTitle("Continue as \(User.currentUser.name!)", for: .normal)
               
            }
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        if (FBSDKAccessToken.current() != nil && fbLoginSuccess == true){
            performSegue(withIdentifier: "CustomerView", sender: self)
        }
    }

    @IBAction func facebookLogin(_ sender: Any) {
        if (FBSDKAccessToken.current() != nil){
            fbLoginSuccess = true
            self.viewDidAppear(true)
        }else{
            FBManager.shared.logIn(withReadPermissions: ["public_profile","email"],
                                   from: self) { (result, error) in
                                    if (error == nil){
                                        FBManager.getFBUserData(completionHandler: {
                                              self.fbLoginSuccess = true
                                             self.viewDidAppear(true)
                                        })
                                      
                                    }
            }
        }
    }
    
    @IBAction func facebookLogout(_ sender: Any) {
        FBManager.shared.logOut()
        User.currentUser.resetInfo()
        
        bLogout.isHidden = true
        bLogin.setTitle("Login with Facebook", for: .normal)
        
    }
    
}
