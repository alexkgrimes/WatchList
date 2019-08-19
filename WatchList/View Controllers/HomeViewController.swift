//
//  HomeViewController.swift
//  WatchList
//
//  Created by Alex Grimes on 7/23/19.
//  Copyright © 2019 Alex Grimes. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeTableView: UITableView!
    
    var categories = ["On Your Watch List", "Watch It Again", "Top Rated"]
    let backgroundColor = UIColor(red: 32.0 / 255.0, green: 33.0 / 255.0, blue: 37.0 / 255.0, alpha: 1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        homeTableView.delegate = self
        homeTableView.dataSource = self
        
        self.view.endEditing(true)
    }
}

// MARK: - TableViewDelegate
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return categories[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CategoryRow
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = backgroundColor
        let header = view as? UITableViewHeaderFooterView
        header?.textLabel?.font = UIFont(name: "System", size: 26)
        header?.textLabel?.textColor = UIColor.lightText
    }
}

