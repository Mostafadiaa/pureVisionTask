//
//  educationVc.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 3/3/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class educationVc: UIViewController {
    @IBOutlet var compOutlate: UIButton!
    @IBOutlet var schoolNameField: UITextField!
    @IBOutlet var highSchool: UILabel!
    @IBOutlet var schoolYear: UITextField!
    @IBOutlet var univLabel: UILabel!
    @IBOutlet var uinNameField: UITextField!
    @IBOutlet var cFieldStudy: UITextField!
    @IBOutlet var gradYearField: UITextField!
    @IBOutlet var degreeLevel: UILabel!
    @IBOutlet var degreePicker: UIPickerView!
    @IBOutlet var gradePicker: UIPickerView!
    @IBOutlet var gradeLabel: UILabel!
    fileprivate let  keychainAccess = KeychainAccess()
    var yearIsValid = false
    let degreeUrl = "http://ahmedhariedy62848.ipage.com/wazeftak/apis/degreeleveldata.php"
    let gradeUrl =  "http://ahmedhariedy62848.ipage.com/wazeftak/apis/gradeData.php"
    let insertEdu = "http://ahmedhariedy62848.ipage.com/wazeftak/apis/educationinsertdata.php"
    var degreeList : [degreeData] = []
    var geadeList : [gradeData] = []
    var selectedDegree:String!
    var selectedGrade:String!
    fileprivate var userId = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        userId =  keychainAccess.getPasscode(identifier: "user_id")!
        hideKeyboardWhenTappedAround()
        //schoolYear
        title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "education", comment: "")
        highSchool.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "highSchool", comment: "")
        univLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "college", comment: "")
        uinNameField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "name", comment: "")

        compOutlate.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "continueKey", comment: ""), for: .normal)
        degreeLevel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "degreeLevel", comment: "")
        gradeLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "grade", comment: "")

        schoolNameField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "name", comment: "")
        cFieldStudy.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "courseName", comment: "")
        schoolYear.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "gradYear", comment: "")
        gradYearField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "gradYear", comment: "")
        helpedFunctions.sharedInstance.getData(url: degreeUrl) { (data) in
            if let degreeData = data{
                do {
                    let degreeJson = try JSONDecoder().decode(degreeArr.self, from: degreeData)
                    self.degreeList = degreeJson.data
                    //print(self.degreeList)
                    DispatchQueue.main.async {
                        self.degreePicker.reloadAllComponents()
                    }
                } catch let error as NSError {
                    print(error)
                }
            }
        }
        helpedFunctions.sharedInstance.getData(url: gradeUrl) { (data) in
            if let gradeData = data {
                do {
                    let gradeJson = try JSONDecoder().decode(gradeArr.self, from: gradeData)
                    self.geadeList = gradeJson.data
                   // print(self.geadeList)
                    DispatchQueue.main.async {
                        self.gradePicker.reloadAllComponents()
                    }
                } catch let error as NSError {
                    print(error)
                }
            }
            }
        }
    
    
    @IBAction func yearValid(_ sender: UITextField) {
        if sender.text != ""{
            let text = sender.text
            if text!.count == 4 {
                yearIsValid = true
            }
            else{
                AlertController.showAlert(self, title: "error", message: "(hint 2019)")
            }
        }
    }
    
    
        
    @IBAction func compDone(_ sender: UIButton) {
        
        if schoolNameField.text != "" && schoolYear.text != "" && uinNameField.text != "" && cFieldStudy.text != "" && gradYearField.text != "" && selectedDegree != nil && selectedGrade != nil {
            
            let activityInd = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
            activityInd.color = UIColor.darkGray
            activityInd.center = view.center
            activityInd.startAnimating()
            view.addSubview(activityInd)
           let postData =  educationInsertData.init(college_name: schoolNameField.text!, graduationyear: schoolYear.text!, university_name: uinNameField.text!, fields_study:  cFieldStudy.text!, endyear: gradYearField.text!, degree_id: selectedDegree, grade_id: selectedGrade, user_id: userId)
            helpedFunctions.sharedInstance.postData(postData: postData, responseData: personalResponse.self, url: insertEdu) { (bool) in
                
                if let done = bool {
                    if done {
                        DispatchQueue.main.async {
                            activityInd.stopAnimating()
                            activityInd.removeFromSuperview()
                            self.performSegue(withIdentifier: "okTogo", sender: self)
                        }
                    }
                }
            }
        }else {
            AlertController.showAlert(self, title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "emptyField", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "allReq", comment: "")) }
        
        
    }
    
    

}

extension educationVc: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == gradePicker {
            return geadeList.count
        } else if pickerView == degreePicker {
            return degreeList.count
        }

        return 1
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == degreePicker {
            self.selectedDegree =  degreeList[row].degree_id
        } else if pickerView == gradePicker {
          self.selectedGrade =  geadeList[row].grade_id
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == gradePicker {
            return geadeList[row].grade_name
        } else if pickerView == degreePicker {
            return degreeList[row].degree_name
        }

        return ""
    }
}
