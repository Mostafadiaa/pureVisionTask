//
//  thanksVc.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 2/20/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class thanksVc: UIViewController {
    @IBOutlet var thanks: UILabel!
    @IBOutlet var reqRev: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        thanks.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "thankyou", comment: "")
        reqRev.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "thanks", comment: "")
    }
}
