//
//  SignupViewController.swift
//  WatchList
//
//  Created by Alex Grimes on 8/15/19.
//  Copyright © 2019 Alex Grimes. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var signupButton: UIButton!
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        handleSignupTapped()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func handleSignupTapped() {
        self.view.endEditing(true)
        
        let appDelegateTemp = UIApplication.shared.delegate as? AppDelegate
        appDelegateTemp?.window?.rootViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateInitialViewController()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        handleSignupTapped()
        return true
    }
}
