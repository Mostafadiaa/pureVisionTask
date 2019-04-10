//
//  courseCell.swift
//  pureVisionTask
//
//  Created by Pure Vision on 4/10/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class courseCell: UITableViewCell {
    @IBOutlet weak var nameAtOrga: UILabel!
    @IBOutlet weak var fromTo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
