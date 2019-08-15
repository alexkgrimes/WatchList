//
//  SignupViewController.swift
//  WatchList
//
//  Created by Alex Grimes on 8/15/19.
//  Copyright © 2019 Alex Grimes. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var signupButton: UIButton!
    
    @IBAction func signupButtonTapped(_ sender: Any) {
        let appDelegateTemp = UIApplication.shared.delegate as? AppDelegate
        appDelegateTemp?.window?.rootViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateInitialViewController()
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
