//
//  SpotDetailTextCell.swift
//  NewSkateMapApp
//
//  Created by Edmund Bollenbacher on 2/12/18.
//  Copyright © 2018 Edmund Bollenbacher. All rights reserved.
//

import UIKit

class SpotDetailTextCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.numberOfLines = 0
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
