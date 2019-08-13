//
//  ListLabelCell.swift
//  WatchList
//
//  Created by Alex Grimes on 8/2/19.
//  Copyright © 2019 Alex Grimes. All rights reserved.
//

import UIKit

class ListLabelCell: UITableViewCell {
    
    @IBOutlet weak var listName: UILabel!
    @IBOutlet weak var extraInfoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = backgroundColor
        
        let bgColorView = UIView()
        bgColorView.backgroundColor = .darkGray
        self.selectedBackgroundView = bgColorView
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
