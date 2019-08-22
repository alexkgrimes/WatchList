//
//  AddListModuleViewController.swift
//  WatchList
//
//  Created by Alex Grimes on 8/16/19.
//  Copyright © 2019 Alex Grimes. All rights reserved.
//

import UIKit

protocol NewListModuleDelegate: class {
    func textNewListName(_ text: String)
}

class AddListModuleViewController: UIViewController, UITextFieldDelegate {
    weak var delegate: NewListModuleDelegate?
    
    @IBOutlet weak var addListModuleView: UIView!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var listNameTextField: UITextField!
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func okButtonTapped(_ sender: Any) {
        createNewList()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        listNameTextField.becomeFirstResponder()
        listNameTextField.delegate = self
        
        addListModuleView.layer.cornerRadius = 10.0
        addListModuleView.clipsToBounds = true
        
        okButton.layer.cornerRadius = 5
        cancelButton.layer.cornerRadius = 5
    }
    
    func createNewList() {
        self.delegate?.textNewListName(listNameTextField.text ?? "new list")
        self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        createNewList()
        return true
    }
}
