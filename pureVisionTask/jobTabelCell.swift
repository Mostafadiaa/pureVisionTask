//
//  jobTabelCell.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 2/19/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class jobTabelCell: UITableViewCell {
    
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var jobTitel: UILabel!
    @IBOutlet weak var dateWork: UILabel!
    @IBOutlet weak var salary: UILabel!
    @IBOutlet weak var reason: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
