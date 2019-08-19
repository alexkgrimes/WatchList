//
//  LoginViewController.swift
//  WatchList
//
//  Created by Alex Grimes on 8/13/19.
//  Copyright © 2019 Alex Grimes. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        handleLoginTapped()
    }
    
    func handleLoginTapped() {
        Defaults.setName("alexkgrimes")
        let appDelegateTemp = UIApplication.shared.delegate as? AppDelegate
        appDelegateTemp?.window?.rootViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateInitialViewController()
    }
    
    @IBAction func signupButtonTapepd(_ sender: Any) {
        // TODO
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.usernameTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        handleLoginTapped()
        return true
    }
}
