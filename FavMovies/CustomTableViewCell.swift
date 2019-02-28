//
//  CustomTableViewCell.swift
//  FavMovies
//
//  Created by Jagadeesh Bandlamudi on 2/25/19.
//  Copyright © 2019 Jagadeesh Bandlamudi. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet var movieImageView:UIImageView!
    @IBOutlet var movieTitle:UILabel!
    @IBOutlet var movieYear:UILabel!
    @IBOutlet var favButton:UIButton!
    @IBOutlet var remButton:UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
