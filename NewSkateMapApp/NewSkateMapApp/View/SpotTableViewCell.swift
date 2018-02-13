//
//  SpotTableViewCell.swift
//  NewSkateMapApp
//
//  Created by Edmund Bollenbacher on 2/11/18.
//  Copyright © 2018 Edmund Bollenbacher. All rights reserved.
//

import UIKit

class SpotTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var spotImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
