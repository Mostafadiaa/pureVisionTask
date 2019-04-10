//
//  generalInfoCell.swift
//  pureVisionTask
//
//  Created by Pure Vision on 4/9/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class generalInfoCell: UITableViewCell {
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var birthDate: UILabel!
    @IBOutlet weak var expSalaryData: UILabel!
    @IBOutlet weak var exData: UILabel!
    @IBOutlet weak var milData: UILabel!
    @IBOutlet weak var natData: UILabel!
    @IBOutlet weak var genderData: UILabel!
    @IBOutlet weak var relegionData: UILabel!
    @IBOutlet weak var countryData: UILabel!
    @IBOutlet weak var titelData: UILabel!
    @IBOutlet weak var nameData: UILabel!
    @IBOutlet weak var generalView: UIView!
    @IBOutlet weak var generalLabe: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        generalView.backgroundColor = UIColor(red: 0.01, green: 0.82, blue: 0.66, alpha: 1.0)
        generalLabe.textColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.0)
        generalLabe.font  = UIFont.boldSystemFont(ofSize: 15)
        generalLabe.textAlignment = NSTextAlignment.center
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
