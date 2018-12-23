//
//  RastaurantViewController.swift
//  FoodTaskerMobile
//
//  Created by Konstantin Chukhas on 12/12/18.
//  Copyright © 2018 Konstantin Chukhas. All rights reserved.
//

import UIKit

class RastaurantViewController: UIViewController {
    
    @IBOutlet weak var menuBarButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        menuBarButton.target = self.revealViewController()
        menuBarButton.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
    }
 }
extension RastaurantViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantCell", for: indexPath)
    return cell
    }
    
    
}
