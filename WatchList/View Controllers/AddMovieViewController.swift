//
//  AddMovieViewController.swift
//  WatchList
//
//  Created by Alex Grimes on 8/19/19.
//  Copyright © 2019 Alex Grimes. All rights reserved.
//

import UIKit

class AddMovieViewController: UIViewController {

    @IBOutlet weak var addMovieModuleView: UIView!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var okButton: UIButton!
    
    @IBOutlet weak var listPickerView: UIPickerView!
    
    var lists = ["To Watch", "Favorites", "Background TV", "For Alex"]
    var selectedList: String?
    
    @IBAction func okButtonTapped(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addMovieModuleView.layer.cornerRadius = 10.0
        addMovieModuleView.clipsToBounds = true
        
        okButton.layer.cornerRadius = 5
        cancelButton.layer.cornerRadius = 5
        
        listPickerView.delegate = self
        listPickerView.dataSource = self
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

extension AddMovieViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return lists.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return lists[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedList = lists[row]
    }
}
