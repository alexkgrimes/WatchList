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
    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var whereToWatchButton: UIButton!
    
    @IBOutlet weak var addToListsButton: UIButton!
    @IBOutlet weak var rateButton: UIButton!
    @IBOutlet weak var shareButton: UIButton!
    
    var movieName: String = ""
    
    @IBAction func exitButtonTapped(_ sender: Any) {
        let transition: CATransition = CATransition()
        transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        self.navigationController!.view.layer.add(transition, forKey: nil)
        
        _ = navigationController?.popViewController(animated: false)
    }
    
    @IBAction func addToListsButtonTapped(_ sender: Any) {
        // TODO
        // For now uses storyboard to bring up AddMovieViewController
    }
    
    @IBAction func rateButtonTapped(_ sender: Any) {
        // TODO
    }
    
    @IBAction func shareButtonTapped(_ sender: Any) {
        // TODO
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(sentData)

        // Do any additional setup after loading the view.
        moviePosterImageView.image = UIImage(named: "Image-1")
        yearLabel.text = "2019"
        ratingLabel.text = "PG"
        runtimeLabel.text = "3h 05m"

        whereToWatchButton.layer.cornerRadius = 5

        descriptionLabel.text = "So this is probably going to be a pretty long description so I'm gonna want it to be able to wrap a few times and not get cut off or scroll or anything else funny like that. Great description lmao gottem. So this is probably going to be a pretty long description so I'm gonna want it to be able to wrap a few times and not get cut off or scroll or anything else funny like that. Great description lmao gottem."

        colorButtons()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        super.viewWillDisappear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        super.viewDidAppear(animated)
    }
    
    func colorButtons() {
        let addToListImage = UIImage(named: "add2")
        let tintedImageAdd = addToListImage?.withRenderingMode(.alwaysTemplate)
        addToListsButton.setImage(tintedImageAdd, for: .normal)
        addToListsButton.tintColor = #colorLiteral(red: 0.6693737507, green: 0.8444430232, blue: 1, alpha: 1)
        
        let starImage = UIImage(named: "star")
        let tintedImageStar = starImage?.withRenderingMode(.alwaysTemplate)
        rateButton.setImage(tintedImageStar, for: .normal)
        rateButton.tintColor = #colorLiteral(red: 0.6693737507, green: 0.8444430232, blue: 1, alpha: 1)
        
        let shareImage = UIImage(named: "share")
        let tintedImageShare = shareImage?.withRenderingMode(.alwaysTemplate)
        shareButton.setImage(tintedImageShare, for: .normal)
        shareButton.tintColor = #colorLiteral(red: 0.6693737507, green: 0.8444430232, blue: 1, alpha: 1)
    }
 
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addMovieViewController = segue.destination as! AddMovieViewController
        addMovieViewController.movieName = movieName
    }
}
