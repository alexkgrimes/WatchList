//
//  AccountViewController.swift
//  WatchList
//
//  Created by Alex Grimes on 7/24/19.
//  Copyright © 2019 Alex Grimes. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var logoutButton: UIButton!
    
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        guard let appDel = UIApplication.shared.delegate as? AppDelegate else { return }
        let rootController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "WelcomeNavigation")
        appDel.window?.rootViewController = rootController
        Defaults.clearUserData()
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
