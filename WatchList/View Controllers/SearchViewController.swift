//
//  SearchViewController.swift
//  WatchList
//
//  Created by Alex Grimes on 7/23/19.
//  Copyright © 2019 Alex Grimes. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    var movieNames : [String?] = []
    let backgroundColor = UIColor(red: 32.0 / 255.0, green: 33.0 / 255.0, blue: 37.0 / 255.0, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        searchController.searchResultsUpdater = self as UISearchResultsUpdating
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.barTintColor = backgroundColor
        
        tableView.tableHeaderView = searchController.searchBar
    }


}

extension SearchViewController: UISearchBarDelegate, UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            movieNames = ["Avengers", "Iron Man", "Toy Story 4"]
            searchController.searchResultsController?.view.isHidden = false
        } else {
            movieNames = []
            searchController.searchResultsController?.view.isHidden = true
        }
        tableView.reloadData()
    }
    

}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchResultCell", for: indexPath)
        cell.textLabel?.text = movieNames[indexPath.row]
        cell.textLabel?.textColor = UIColor.lightText
        cell.backgroundColor = backgroundColor
        return cell
    }
    
    
}

