//
//  acceptVC.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 2/20/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class acceptVC: UIViewController {

    @IBOutlet weak var desirdJob: UITextField!
    @IBOutlet weak var expSalary: UITextField!
    @IBOutlet weak var howPvision: UITextField!
    @IBOutlet weak var relativPureVision: UITextField!
    @IBOutlet weak var hobits: UITextField!
    @IBOutlet weak var afterFive: UITextField!
    @IBOutlet weak var extraInfo: UITextField!
    @IBOutlet weak var startDateLabel: UILabel!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var driveLicLabel: UILabel!
    @IBOutlet weak var iAgreeLabell: UITextView!
    @IBOutlet weak var acceptOutlet: UIButton!
    @IBOutlet weak var dirveLicSegm: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "jobInfo", comment: "")
        desirdJob.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "desirdJob", comment: "")
        expSalary.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "expSalary", comment: "")
        howPvision.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "howPvision", comment: "")
        relativPureVision.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "relativPureVision", comment: "")
        hobits.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "hobits", comment: "")
        afterFive.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "afterFive", comment: "")
        extraInfo.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "extraInfo", comment: "")
        startDateLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "startDateLabel", comment: "")
        driveLicLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "driveLicLabel", comment: "")
        iAgreeLabell.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "iAgreeLabell", comment: "")
        acceptOutlet.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "acceptOutlet", comment: ""), for: .normal)
        dirveLicSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "yes", comment: ""), forSegmentAt: 0)
              dirveLicSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "no", comment: ""), forSegmentAt: 1)

        
        
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func acceptAction(_ sender: Any) {
        
    }
    
    

}
