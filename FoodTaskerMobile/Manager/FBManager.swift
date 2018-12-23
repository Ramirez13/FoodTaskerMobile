//
//  FBManager.swift
//  FoodTaskerMobile
//
//  Created by Konstantin Chukhas on 12/15/18.
//  Copyright © 2018 Konstantin Chukhas. All rights reserved.
//

import Foundation
import FBSDKLoginKit
import SwiftyJSON



class FBManager{
    
    static  let shared = FBSDKLoginManager()
    
    public class func getFBUserData(completionHandler: @escaping() -> Void){
        if (FBSDKAccessToken.current() != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(normal), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    
                    let json = JSON(result!)
                    User.currentUser.setInfo(json: json )
                    completionHandler()
                }
            })
        }
    }
}
