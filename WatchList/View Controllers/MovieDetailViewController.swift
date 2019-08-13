//
//  MovieDetailViewController.swift
//  WatchList
//
//  Created by Alex Grimes on 8/1/19.
//  Copyright © 2019 Alex Grimes. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    var sentData = ""
    
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var moviePosterImageView: UIImageView!
    @IBOutlet weak var detailsStackView: UIStackView!
    
    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    
    @IBOutlet weak var whereToWatchButton: UIButton!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var addToListsButton: UIButton!
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    @IBAction func exitButtonTapped(_ sender: Any) {
        let transition: CATransition = CATransition()
        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        self.navigationController!.view.layer.add(transition, forKey: nil)
        
        _ = navigationController?.popViewController(animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(sentData)

        // Do any additional setup after loading the view.
        //scrollView.delegate = self as? UIScrollViewDelegate
        
        
        
        moviePosterImageView.image = UIImage(named: "Image-1")
        yearLabel.text = "2019"
        ratingLabel.text = "PG"
        runtimeLabel.text = "3h 05m"

        whereToWatchButton.layer.cornerRadius = 5

        descriptionLabel.text = "So this is probably going to be a pretty long description so I'm gonna want it to be able to wrap a few times and not get cut off or scroll or anything else funny like that. Great description lmao gottem. So this is probably going to be a pretty long description so I'm gonna want it to be able to wrap a few times and not get cut off or scroll or anything else funny like that. Great description lmao gottem."
        
        addToListsButton.imageView?.image = addToListsButton.imageView?.image?.withRenderingMode(.alwaysTemplate)
        addToListsButton.imageView?.tintColor = #colorLiteral(red: 0.5378742814, green: 0.9064556956, blue: 1, alpha: 1)
        
        rateButton.imageView?.image = rateButton.imageView?.image?.withRenderingMode(.alwaysTemplate)
        rateButton.imageView?.tintColor = #colorLiteral(red: 0.5378742814, green: 0.9064556956, blue: 1, alpha: 1)
        
        shareButton.imageView?.image = shareButton.imageView?.image?.withRenderingMode(.alwaysTemplate)
        shareButton.imageView?.tintColor = #colorLiteral(red: 0.5378742814, green: 0.9064556956, blue: 1, alpha: 1)
    
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        super.viewWillDisappear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        super.viewDidAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        //scrollView.addSubview(contentView)//if the contentView is not already inside your scrollview in your xib/StoryBoard doc
        
        // contentView.contentSize = contentView.frame.size //sets ScrollView content size
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
