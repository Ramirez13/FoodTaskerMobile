//
//  APIManager.swift
//  FoodTaskerMobile
//
//  Created by Konstantin Chukhas on 12/16/18.
//  Copyright © 2018 Konstantin Chukhas. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import FBSDKLoginKit



class APIManager{
    
    static let shared = APIManager()
    
    let baseURL = NSURL(string: BASE_URL)
    
    var accessToken = ""
    var refreshToken = ""
    var expired = Date()
    
    //API to login an User
    func login(userType:String,complitionHandler: @escaping (NSError?) -> Void ){
        let pach = "api/social/convert-token"
        let url = baseURL!.appendingPathComponent(pach)
        let params: [String:Any] = [
            "grant_type":"convert-token",
            "client_id":CLIENT_ID,
            "client_secret":CLIENT_SECRET,
            "backend":"facebook",
            "token":FBSDKAccessToken.current()?.tokenString,
            "user_type":userType,
        ]
        Alamofire.request(url!, method: .post, parameters: params, encoding: URLEncoding(), headers: nil).responseJSON { (response) in
            switch response.result{
                
            case .success(let value):
                let jsonData = JSON()
                self.accessToken = jsonData["access_token"].string!
                self.refreshToken = jsonData["refresh_token"].string!
                self.expired = Date().addingTimeInterval(TimeInterval(jsonData["expires_in"].int!))
               
                complitionHandler(nil)
                break
            case .failure(let error ):
                
                complitionHandler(error as NSError)
                break
            }
        }
    }
     //API to log an User out
    func logout(complitionHandler: @escaping (NSError?) -> Void ){
        let pach = "api/social/revoke-token"
        let url = baseURL!.appendingPathComponent(pach)
        let params: [String:Any] = [
            "client_id":CLIENT_ID,
            "client_secret":CLIENT_SECRET,
            "token":self.accessToken
            ]
        Alamofire.request(url!, method: .post, parameters: params, encoding: URLEncoding(), headers: nil).responseJSON { (response) in
            switch response.result{
                
            case .success:
                complitionHandler(nil)
                break
            case .failure(let error ):
                
                complitionHandler(error as NSError)
                break
    }
    
}
}
}
