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
    @IBOutlet weak var doneOutlate: UIButton!
    let insertSkillUrl = "http://ahmedhariedy62848.ipage.com/wazeftak/apis/skillesinsertdata.php"
    fileprivate let  keychainAccess = KeychainAccess()
    fileprivate var userId = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        userId =  keychainAccess.getPasscode(identifier: "user_id")!
        title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "yourInfo", comment: "")
        comp.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "continueKey", comment: ""), for: .normal)
        skillsLAbel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "skillsInfo", comment: "")
        skillsField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "skillsInfoField", comment: "")
        doneOutlate.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "Done", comment: ""), for: .normal)
    }
    
    @IBAction func doneAction(_ sender: Any) {
        if skillsField.text != ""{
            let activityInd = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
            activityInd.color = UIColor.darkGray
            activityInd.center = view.center
            activityInd.startAnimating()
            view.addSubview(activityInd)
          let insertSkillPost = insertSkillData.init(skill_name: skillsField.text!, user_id: userId)
            helpedFunctions.sharedInstance.postDataWithOutRes(postData: insertSkillPost, url: insertSkillUrl) { (data) in
                if let dataRes = data{
                    do {
                        let dataJson = try JSONDecoder().decode(personalResponse.self, from: dataRes)
                        if dataJson.message == "Successfully"{
                            DispatchQueue.main.async {
                                activityInd.stopAnimating()
                                activityInd.removeFromSuperview()
                               // print(dataJson.message)
                                self.comp.alpha = 1
                            self.doneOutlate.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "add", comment: ""), for: .normal)
                                self.skillsField.text = ""
                            }
                            
                        }
                    }
                    catch let err as NSError{
                        print(err.localizedDescription)
                    }
                }
            }
        }
        else{
               AlertController.showAlert(self, title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "emptyField", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "allReq", comment: ""))
        }
       
        
    }
    
    
}
