//
//  ConfirmationViewController.swift
//  WatchList
//
//  Created by Alex Grimes on 8/23/19.
//  Copyright © 2019 Alex Grimes. All rights reserved.
//

import UIKit

class ConfirmationViewController: UIViewController {

    @IBOutlet weak var blurView: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //blurView.view.layer.cornerRadius = 10.0
        blurView.layer.cornerRadius = 20.0
        blurView.clipsToBounds = true
    }
    override func viewDidAppear(_ animated: Bool) {
        self.dismiss(animated: true, completion: nil)
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
