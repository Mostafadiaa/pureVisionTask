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
    @IBOutlet weak var userPosition: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userImage.layer.borderWidth = 1
        userImage.layer.borderColor = #colorLiteral(red: 0, green: 0.7019607843, blue: 0.5607843137, alpha: 1)
        userImage.layer.cornerRadius = userImage.frame.size.width / 2
        userImage.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
