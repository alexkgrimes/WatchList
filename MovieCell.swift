//
//  MovieCell.swift
//  WatchList
//
//  Created by Alex Grimes on 8/1/19.
//  Copyright © 2019 Alex Grimes. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {


    @IBOutlet weak var moviePosterImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    
    var name = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        moviePosterImage.image = UIImage(named: "Image-1")
        movieName.text = self.name
        movieName.textColor = UIColor.lightText
        self.backgroundColor = backgroundColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

}
