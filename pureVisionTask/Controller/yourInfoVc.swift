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
    @IBOutlet weak var whyAtPureVision: UITextField!
    @IBOutlet weak var twoPersonLAbel: UILabel!
    @IBOutlet weak var personNoOne: UILabel!
    @IBOutlet weak var namePOne: UITextField!
    @IBOutlet weak var jobPone: UITextField!
    @IBOutlet weak var compPOne: UITextField!
    @IBOutlet weak var oersonNoTwo: UILabel!
    @IBOutlet weak var namePTwo: UITextField!
    @IBOutlet weak var jobPTwo: UITextField!
    @IBOutlet weak var compPTwo: UITextField!
    @IBOutlet weak var smoke: UILabel!
    @IBOutlet weak var smokeSegm: UISegmentedControl!
    @IBOutlet weak var caseLabel: UILabel!
    @IBOutlet weak var caseSegm: UISegmentedControl!
    @IBOutlet weak var suspendLAbel: UILabel!
    @IBOutlet weak var suspundedSegm: UISegmentedControl!
    @IBOutlet weak var badLabel: UILabel!
    @IBOutlet weak var badSegm: UISegmentedControl!
    @IBOutlet weak var leaderLAbel: UILabel!
    @IBOutlet weak var leaderSegm: UISegmentedControl!
    @IBOutlet weak var positiveLAbel: UILabel!
    @IBOutlet weak var positiveSegm: UISegmentedControl!
    @IBOutlet weak var respLabel: UILabel!
    @IBOutlet weak var respSegm: UISegmentedControl!
    @IBOutlet weak var loyalLabel: UILabel!
    @IBOutlet weak var loyalSegm: UISegmentedControl!
    @IBOutlet weak var activeLabel: UILabel!
    @IBOutlet weak var activeSegm: UISegmentedControl!
    @IBOutlet weak var teamWorkLabel: UILabel!
    @IBOutlet weak var teamWorkerSegm: UISegmentedControl!
    @IBOutlet weak var holdayesLabel: UILabel!
    @IBOutlet weak var holyDayesSegm: UISegmentedControl!
    @IBOutlet weak var anotherCityLAbel: UILabel!
    @IBOutlet weak var anotherCitySegm: UISegmentedControl!
    @IBOutlet weak var phonePOne: UITextField!
    @IBOutlet weak var phonePtwo: UITextField!
    @IBOutlet weak var comp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "yourInfo", comment: "")
        comp.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "continueKey", comment: ""), for: .normal)
        skillsLAbel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "skillsInfo", comment: "")
        skillsField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "skillsInfoField", comment: "")
        whyAtPureVision.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "whyAtPureVision", comment: "")
        oersonNoTwo.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "personNoTwo", comment: "")
        twoPersonLAbel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "twoPerson", comment: "")
        personNoOne.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "personNoOne", comment: "")
        namePOne.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "name", comment: "")
         namePTwo.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "name", comment: "")
        jobPone.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "jobOfPer", comment: "")
        jobPTwo.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "jobOfPer", comment: "")
        compPOne.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "compPTwo", comment: "")
        compPTwo.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "compPTwo", comment: "")
        phonePOne.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "phone", comment: "")
        phonePtwo.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "phone", comment: "")
        badLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "badPerson", comment: "")
        respLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "resPerson", comment: "")
        loyalLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "loyalPerson", comment: "")
        leaderLAbel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "leaderPerson", comment: "")
        anotherCityLAbel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "anotherCity", comment: "")
        holdayesLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "holdayes", comment: "")
        teamWorkLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "teamWorker", comment: "")
        activeLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "activePerson", comment: "")
        positiveLAbel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "positivePerson", comment: "")
        suspendLAbel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "suspend", comment: "")
        smoke.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "smoke", comment: "")
        caseLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "case", comment: "")
        smokeSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "yes", comment: ""), forSegmentAt: 0)
         smokeSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "no", comment: ""), forSegmentAt: 1)
        
        badSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "yes", comment: ""), forSegmentAt: 0)
        badSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "no", comment: ""), forSegmentAt: 1)
        
        respSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "yes", comment: ""), forSegmentAt: 0)
        respSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "no", comment: ""), forSegmentAt: 1)
        
        caseSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "yes", comment: ""), forSegmentAt: 0)
        caseSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "no", comment: ""), forSegmentAt: 1)
        
        loyalSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "yes", comment: ""), forSegmentAt: 0)
        loyalSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "no", comment: ""), forSegmentAt: 1)
        
        activeSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "yes", comment: ""), forSegmentAt: 0)
        activeSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "no", comment: ""), forSegmentAt: 1)
        
        leaderSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "yes", comment: ""), forSegmentAt: 0)
        leaderSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "no", comment: ""), forSegmentAt: 1)
        
        positiveSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "yes", comment: ""), forSegmentAt: 0)
        positiveSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "no", comment: ""), forSegmentAt: 1)
        
        suspundedSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "yes", comment: ""), forSegmentAt: 0)
        suspundedSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "no", comment: ""), forSegmentAt: 1)
        
        holyDayesSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "yes", comment: ""), forSegmentAt: 0)
        holyDayesSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "no", comment: ""), forSegmentAt: 1)
        
        teamWorkerSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "yes", comment: ""), forSegmentAt: 0)
        teamWorkerSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "no", comment: ""), forSegmentAt: 1)
        
        anotherCitySegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "yes", comment: ""), forSegmentAt: 0)
        anotherCitySegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "no", comment: ""), forSegmentAt: 1)
        
    }
    

   
}
