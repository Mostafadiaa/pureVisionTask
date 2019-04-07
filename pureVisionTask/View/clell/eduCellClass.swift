//
//  eduCellClass.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 2/19/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class eduCellClass: UITableViewCell {

    @IBOutlet weak var courseTopic: UILabel!
    @IBOutlet weak var startToEndDate: UILabel!
    @IBOutlet weak var organizationName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
