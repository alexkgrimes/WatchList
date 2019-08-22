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
    
    var movieNames : [String] = ["Avengers", "Iron Man", "Toy Story 4"]
    var searchBarContents = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        searchController.searchResultsUpdater = self as UISearchResultsUpdating
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.barTintColor = UIColor.darkBackgroundColor()
        
        searchController.searchBar.keyboardAppearance = .dark
        searchController.searchBar.becomeFirstResponder()
        
        tableView.tableHeaderView = searchController.searchBar
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        super.viewWillDisappear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        searchController.searchBar.text = searchBarContents
        
        super.viewWillAppear(animated)
    }
}

// MARK: - SearchBarDelegate
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
    
    func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
        searchController.searchBar.resignFirstResponder()
    }
}

// MARK: - TableViewDelegate
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchResultCell", for: indexPath) as! SearchResultsCell
        cell.movieNameLabel.text = movieNames[indexPath.row]
        cell.movieImageView.image = UIImage(named: "Image-1")
        cell.backgroundColor = UIColor.darkBackgroundColor()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchBarContents = searchController.searchBar.text ?? ""
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let movieDetailViewController = storyBoard.instantiateViewController(withIdentifier: "movieDetail") as! MovieDetailViewController
        movieDetailViewController.movieName = movieNames[indexPath.row]
        
        let transition: CATransition = CATransition()
        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        self.navigationController!.view.layer.add(transition, forKey: nil)
        
        searchController.isActive = false
        self.navigationController?.pushViewController(movieDetailViewController, animated: false)
    }
}

