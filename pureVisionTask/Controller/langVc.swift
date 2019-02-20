//
//  langVc.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 2/19/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class langVc: UIViewController {
   
    @IBOutlet weak var compOutlet: UIButton!
    @IBOutlet weak var arabicLabel: UILabel!
    @IBOutlet weak var engLabel: UILabel!
    @IBOutlet weak var araRate: UISegmentedControl!
    @IBOutlet weak var engRate: UISegmentedControl!
    @IBOutlet weak var otherRate: UISegmentedControl!
    @IBOutlet weak var addNewOutlet: UIButton!
    @IBOutlet weak var otherField: UITextField!
    
    var addedNewLang = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        self.title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "lang", comment: "")
        compOutlet.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "continueKey", comment: ""), for: .normal)
        addNewOutlet.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "addNewLang", comment: ""), for: .normal)
        otherField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "otherLang", comment: "")
        arabicLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "arName", comment: "")
        engLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "enName", comment: "")
        araRate.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "excellent", comment: ""), forSegmentAt: 0)
        araRate.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "good", comment: ""), forSegmentAt: 1)
        araRate.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "fair", comment: ""), forSegmentAt: 2)
        araRate.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "poor", comment: ""), forSegmentAt: 3)
        engRate.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "excellent", comment: ""), forSegmentAt: 0)
        engRate.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "good", comment: ""), forSegmentAt: 1)
        engRate.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "fair", comment: ""), forSegmentAt: 2)
        engRate.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "poor", comment: ""), forSegmentAt: 3)
        otherRate.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "excellent", comment: ""), forSegmentAt: 0)
        otherRate.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "good", comment: ""), forSegmentAt: 1)
        otherRate.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "fair", comment: ""), forSegmentAt: 2)
        otherRate.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "poor", comment: ""), forSegmentAt: 3)
        
    }
    
    
    @IBAction func addNewAc(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.otherField.alpha = 1
            self.otherRate.alpha = 1
        }
        addedNewLang = true
    }
    

    @IBAction func compToNext(_ sender: Any) {
        if addedNewLang{
            if otherField.text == "" || self.otherRate.selectedSegmentIndex == UISegmentedControl.noSegment{
                 AlertController.showAlert(self, title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "emptyField", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "allReq", comment: ""))
            }
        }
        else if self.araRate.selectedSegmentIndex == UISegmentedControl.noSegment || self.engRate.selectedSegmentIndex == UISegmentedControl.noSegment {
             AlertController.showAlert(self, title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "emptyField", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "allReq", comment: ""))
            
        }
    }
    
}
