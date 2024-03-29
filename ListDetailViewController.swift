//
//  ListDetailViewController.swift
//  WatchList
//
//  Created by Alex Grimes on 8/1/19.
//  Copyright © 2019 Alex Grimes. All rights reserved.
//

import UIKit

class ListDetailViewController: UIViewController {
    
    @IBOutlet weak var listTableView: UITableView!
    
    var listName = ""
    lazy var movieList: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        movieList = Defaults.getMovieList(named: listName)
        
        listTableView.delegate = self
        listTableView.dataSource = self
        
        self.navigationController?.navigationBar.barTintColor = UIColor.darkBackgroundColor()
        self.navigationItem.title = listName
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = textAttributes
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let selectionIndexPath = self.listTableView.indexPathForSelectedRow {
            self.listTableView.deselectRow(at: selectionIndexPath, animated: true)
        }
    }
    
    func showDeleteWarning(for indexPath: IndexPath) {
        let alert = UIAlertController(title: "Delete \(movieList[indexPath.row])?", message: "Are you sure you want to delete \(movieList[indexPath.row])?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
            
            Defaults.removeMovie(at: indexPath.row, forList: self.listName)
            self.movieList.remove(at: indexPath.row)
            self.listTableView.deleteRows(at: [indexPath], with: .fade)
            
            // TOOD: show label for no movies

        }
        
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
        
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - TableViewDelegate
extension ListDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieCell
        cell.movieName.text = movieList[indexPath.row]
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = .darkGray
        cell.selectedBackgroundView = bgColorView
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 132
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            showDeleteWarning(for: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let transition: CATransition = CATransition()
        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        self.navigationController!.view.layer.add(transition, forKey: nil)
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let movieDetailViewController = storyBoard.instantiateViewController(withIdentifier: "movieDetail") as! MovieDetailViewController
        
        movieDetailViewController.movieName = movieList[indexPath.row]
        self.navigationController?.pushViewController(movieDetailViewController, animated: false)
    }
}
