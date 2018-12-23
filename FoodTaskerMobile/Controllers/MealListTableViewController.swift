

//
//  MealListTableViewController.swift
//  FoodTaskerMobile
//
//  Created by Konstantin Chukhas on 12/14/18.
//  Copyright © 2018 Konstantin Chukhas. All rights reserved.
//

import UIKit

class MealListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealCell", for: indexPath)
        
        
        return cell
    }

}
