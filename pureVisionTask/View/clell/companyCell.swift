//
//  companyCell.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 4/3/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class companyCell: UITableViewCell {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userMobile: UILabel!
    @IBOutlet weak var userPosition: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
