//
//  langVc.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 2/19/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class langVc: UIViewController {
    @IBOutlet var compOutlet: UIButton!
    @IBOutlet var languageLabel: UILabel!
    @IBOutlet weak var langPicker: UIPickerView!
    @IBOutlet weak var gradePicker: UIPickerView!
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet var addNewOutlet: UIButton!
    @IBOutlet weak var submitOutlate: UIButton!
    
    let languageUrl = "http://ahmedhariedy62848.ipage.com/wazeftak/apis/languagesData.php"
    let languagePost = "http://ahmedhariedy62848.ipage.com/wazeftak/apis/languageinsertdata.php"
    let languageGrade = "http://ahmedhariedy62848.ipage.com/wazeftak/apis/levellanguageData.php"
    var addedNewLang = false
    var selectedLang  = ""
    var selectedGrade  = ""
    var langList : [languageData] = []
    var langGradeList : [langGrade] = []
    fileprivate let  keychainAccess = KeychainAccess()
    fileprivate var userId = ""
        override func viewDidLoad() {
        super.viewDidLoad()
        userId =  keychainAccess.getPasscode(identifier: "user_id")!
        hideKeyboardWhenTappedAround()
        title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "lang", comment: "")
            languageLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "arName", comment: "")
        compOutlet.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "continueKey", comment: ""), for: .normal)
        addNewOutlet.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "addNewLang", comment: ""), for: .normal)
        gradeLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "gradeName", comment: "")
        helpedFunctions.sharedInstance.getData(url: languageUrl) { (langaData) in
            do {
                if let langaData = langaData{
                    let langJson = try JSONDecoder().decode(languageArr.self, from: langaData)
                    self.langList = langJson.data
                    DispatchQueue.main.async {
                        self.langPicker.reloadAllComponents()
                    }
                    print(self.langList)
                }
            }
            catch let err as NSError{
                print(err.localizedDescription)
            }
        }
        helpedFunctions.sharedInstance.getData(url: languageGrade) { (langaGradeData) in
            do {
                if let langaGrade = langaGradeData{
                    let langGradeJson = try JSONDecoder().decode(langGradeArr.self, from: langaGrade)
                    self.langGradeList = langGradeJson.data
                    DispatchQueue.main.async {
                        self.gradePicker.reloadAllComponents()
                    }
                    print(self.langGradeList)
                }
            }
            catch let err as NSError{
                print(err.localizedDescription)
            }
        }
        
        
        
    }
    
    
    @IBAction func submitLang(_ sender: UIButton) {
        if selectedGrade != "" && selectedLang != ""{
            let activityInd = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
            activityInd.color = UIColor.darkGray
            activityInd.center = view.center
            activityInd.startAnimating()
            view.addSubview(activityInd)
            let langeuageToPost = langPost.init(language_id: selectedLang, level_lang_id: selectedGrade, user_id: userId)
            helpedFunctions.sharedInstance.postData(postData: langeuageToPost, responseData: personalResponse.self, url: languagePost) { (done) in
                if let  donePosting = done{
                    if donePosting {
                        DispatchQueue.main.async {
                            activityInd.stopAnimating()
                            activityInd.removeFromSuperview()
                            self.compOutlet.alpha = 1
                            self.addNewOutlet.alpha = 1
                            self.submitOutlate.alpha = 0
                        }
                        
                    }
                }
            }
        }else{
            
             AlertController.showAlert(self, title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "emptyField", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "allReq", comment: ""))
            
        
        }
        
        
    }
    

    @IBAction func addNewAc(_ sender: Any) {
        langPicker.reloadAllComponents()
        gradePicker.reloadAllComponents()
        self.submitOutlate.alpha = 1
        gradePicker.selectRow(0, inComponent: 0, animated: true)
        langPicker.selectRow(0, inComponent: 0, animated: true)
       
    }

    @IBAction func compToNext(_ sender: Any) {
        
    }
}
extension langVc: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == langPicker {
            return langList.count
        }
        else if pickerView == gradePicker {
            return langGradeList.count
        }
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == langPicker{
            selectedLang =  langList[row].language_id
        }
        else if pickerView == gradePicker{
            selectedGrade =  langGradeList[row].level_lang_id
        }
       
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == langPicker{
           return langList[row].language_name
        }
        else if pickerView == gradePicker{
             return langGradeList[row].level_lang_name
        }
        return ""
    }
    
    
    
    
}

