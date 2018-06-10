//
//  TableViewCell.swift
//  Traveler
//
//  Created by Kimberlee Phan on 2/10/18.
//  Copyright © 2018 Kimberlee Phan. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    // outlets and variables
    @IBOutlet weak var tripImage: UIImageView!
    @IBOutlet weak var tripNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
