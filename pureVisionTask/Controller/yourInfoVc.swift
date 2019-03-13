//
//  yourInfoVc.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 2/19/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class yourInfoVc: UIViewController {
    @IBOutlet var skillsLAbel: UILabel!
    @IBOutlet var skillsField: UITextField!
    @IBOutlet var comp: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "yourInfo", comment: "")
        comp.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "continueKey", comment: ""), for: .normal)
        skillsLAbel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "skillsInfo", comment: "")
        skillsField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "skillsInfoField", comment: "")
    }
}
