//
//  AddMovieViewController.swift
//  WatchList
//
//  Created by Alex Grimes on 8/19/19.
//  Copyright © 2019 Alex Grimes. All rights reserved.
//

import UIKit

protocol ModalHandler: class {
    func modalDismissed()
}

class AddMovieViewController: UIViewController {
    weak var delegate: ModalHandler?

    @IBOutlet weak var addMovieModuleView: UIView!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var listPickerView: UIPickerView!
    
    var lists = Defaults.getLists()
    var selectedList = ""
    var movieName = "movie name"
    
    @IBAction func okButtonTapped(_ sender: Any) {
        Defaults.addMovie(named: movieName, toList: selectedList)
        self.dismiss(animated: true, completion: delegate?.modalDismissed)
    }

    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
        
        var middle: Int
        if lists.count % 2 == 0 {
            middle = lists.count / 2 - 1
        } else {
            middle = lists.count / 2
        }
        listPickerView.selectRow(middle, inComponent: 0, animated: false)
        selectedList = lists[middle]
    }
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource
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
