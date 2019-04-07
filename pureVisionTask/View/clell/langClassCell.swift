//
//  langClassCell.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 2/19/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class langClassCell: UITableViewCell {

    @IBOutlet weak var otherRate: UILabel!
    @IBOutlet weak var engRate: UILabel!
    @IBOutlet weak var arabicRate: UILabel!
    @IBOutlet weak var otherLabel: UILabel!
    @IBOutlet weak var engLabel: UILabel!
    @IBOutlet weak var arabicLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
