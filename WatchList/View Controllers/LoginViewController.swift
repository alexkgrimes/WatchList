//
//  LoginViewController.swift
//  WatchList
//
//  Created by Alex Grimes on 8/13/19.
//  Copyright © 2019 Alex Grimes. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        Defaults.setName("alexkgrimes")
        let appDelegateTemp = UIApplication.shared.delegate as? AppDelegate
        appDelegateTemp?.window?.rootViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateInitialViewController()
    }
    
    @IBAction func signupButtonTapepd(_ sender: Any) {
        //code
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
