//
//  exoerCell.swift
//  pureVisionTask
//
//  Created by Pure Vision on 4/10/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class exoerCell: UITableViewCell {
    @IBOutlet weak var jobAtComp: UILabel!
    @IBOutlet weak var dateStartToEnd: UILabel!
    @IBOutlet weak var workedTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
