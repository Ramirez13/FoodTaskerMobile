//
//  CastomerMenuTableViewController.swift
//  FoodTaskerMobile
//
//  Created by Konstantin Chukhas on 12/12/18.
//  Copyright © 2018 Konstantin Chukhas. All rights reserved.
//

import UIKit

class CastomerMenuTableViewController: UITableViewController {

    @IBOutlet weak var imageAvatar: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.19, green: 0.18, blue: 0.31, alpha: 1)
        
        lblName.text = User.currentUser.name
        imageAvatar.image = try! UIImage(data: Data(contentsOf: URL(string: User.currentUser.pictureURL!)!))
        imageAvatar.layer.cornerRadius = 70 / 2
        imageAvatar.layer.borderWidth = 1
        imageAvatar.layer.borderColor = UIColor.white.cgColor
        imageAvatar.clipsToBounds = true
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CustomerLogout"{
            FBManager.shared.logOut()
            User.currentUser.resetInfo()
        }
    }
}
