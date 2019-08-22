//
//  ListViewController.swift
//  WatchList
//
//  Created by Alex Grimes on 7/24/19.
//  Copyright © 2019 Alex Grimes. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var listsTableView: UITableView!
    @IBOutlet weak var addListButton: UIButton!
    @IBOutlet weak var listsEmptyLabel: UILabel!
    
    var lists = Defaults.getLists()
    var counts = [12, 20, 4, 8]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if !lists.isEmpty {
            listsEmptyLabel.isHidden = true
        }
        
        listsTableView.dataSource = self
        listsTableView.delegate = self
        
        colorAddListButton()
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
    
    func colorAddListButton() {
        let addListImage = UIImage(named: "add2")
        let tintedImageAdd = addListImage?.withRenderingMode(.alwaysTemplate)
        addListButton.setImage(tintedImageAdd, for: .normal)
        addListButton.tintColor = #colorLiteral(red: 0.6693737507, green: 0.8444430232, blue: 1, alpha: 1)
    }
    
    func showDeleteWarning(for indexPath: IndexPath) {
        let alert = UIAlertController(title: "Delete \(lists[indexPath.row])?", message: "Are you sure you want to delete \(lists[indexPath.row])?", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { _ in
            self.lists.remove(at: indexPath.row)
            self.counts.remove(at: indexPath.row)
            self.listsTableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "listDetailSegue" {
            let listDetailViewController = segue.destination as! ListDetailViewController
            let selectedRow = sender as? Int
            let name = lists[selectedRow!]
            listDetailViewController.listName = name
        } else if segue.identifier == "addListModuleSegue" {
            let addListModuleViewController = segue.destination as! AddListModuleViewController
            addListModuleViewController.delegate = self
        }
    }
}

// MARK: - NewListModuleDelegate
extension ListViewController: NewListModuleDelegate {
    func textNewListName(_ text: String) {
        self.lists.append(text)
        self.counts.append(0)
        listsTableView.beginUpdates()
        listsTableView.insertRows(at: [IndexPath(row: lists.count - 1, section: 0)], with: .automatic)
        listsTableView.endUpdates()
        
        Defaults.addList(named: text)
    }
}

// MARK: - TableViewDelegate
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            showDeleteWarning(for: indexPath)
        }
    }
}
