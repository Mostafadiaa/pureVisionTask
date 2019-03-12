//
//  yourInfoVc.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 2/19/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class yourInfoVc: UIViewController {
    @IBOutlet weak var skillsLAbel: UILabel!
    @IBOutlet weak var skillsField: UITextField!
    //@IBOutlet weak var haveLicense: UILabel!
    //@IBOutlet weak var smoke: UILabel!
    //@IBOutlet weak var smokeSegm: UISegmentedControl!
    //@IBOutlet weak var haveLicenseSegm: UISegmentedControl!
    @IBOutlet weak var comp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "yourInfo", comment: "")
        comp.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "continueKey", comment: ""), for: .normal)
        skillsLAbel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "skillsInfo", comment: "")
        skillsField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "skillsInfoField", comment: "")
        
       /* smoke.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "smoke", comment: "")
        smokeSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "yes", comment: ""), forSegmentAt: 0)
         smokeSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "no", comment: ""), forSegmentAt: 1)
        haveLicense.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "driveLicLabel", comment: "")
        haveLicenseSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "yes", comment: ""), forSegmentAt: 0)
        haveLicenseSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "no", comment: ""), forSegmentAt: 1) */
        
    }
    

   
}
