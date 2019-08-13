//
//  ListViewController.swift
//  WatchList
//
//  Created by Alex Grimes on 7/24/19.
//  Copyright © 2019 Alex Grimes. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    let backgroundColor = UIColor(red: 32.0 / 255.0, green: 33.0 / 255.0, blue: 37.0 / 255.0, alpha: 1.0)

    @IBOutlet weak var listsTableView: UITableView!
    
    let lists = ["To Watch", "Favorites", "Background TV", "For Alex"]
    let counts = [12, 20, 4, 8]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listsTableView.dataSource = self
        listsTableView.delegate = self

        // Do any additional setup after loading the view.
        

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        super.viewWillDisappear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        if let selectionIndexPath = self.listsTableView.indexPathForSelectedRow {
            self.listsTableView.deselectRow(at: selectionIndexPath, animated: true)
        }
        
        super.viewDidAppear(animated)
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listLabelCell", for: indexPath) as! ListLabelCell
        cell.listName.text = lists[indexPath.row]
        cell.extraInfoLabel.text = "\(counts[indexPath.row]) items"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "listDetailSegue", sender: indexPath.row)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let listDetailViewController = segue.destination as! ListDetailViewController
        let selectedRow = sender as? Int
        let name = lists[selectedRow!]
        listDetailViewController.listName = name
    }
    
}
