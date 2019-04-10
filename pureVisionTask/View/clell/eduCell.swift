//
//  eduCell.swift
//  pureVisionTask
//
//  Created by Pure Vision on 4/10/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class eduCell: UITableViewCell {
    @IBOutlet weak var gradYearScholLabel: UILabel!
    @IBOutlet weak var highScLabel: UILabel!
    @IBOutlet weak var universtyLabel: UILabel!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var studyField: UILabel!
    @IBOutlet weak var uniVerstyLabelOfGrad: UILabel!
    @IBOutlet weak var gradeUNI: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
