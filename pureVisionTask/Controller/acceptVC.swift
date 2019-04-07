//
//  acceptVC.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 2/20/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class acceptVC: UIViewController {
    @IBOutlet var currentCarrer: UILabel!
    @IBOutlet var desierdJopPicker: UIPickerView!
    @IBOutlet var expSalary: UITextField!
    @IBOutlet var cvGoogleDrive: UITextField!
    @IBOutlet var desierdJob: UILabel!
    @IBOutlet var afterFive: UITextField!
    @IBOutlet var acceptOutlet: UIButton!
    @IBOutlet var carrerLevel: UIPickerView!
    @IBOutlet weak var doYouSmoke: UILabel!
    @IBOutlet weak var driveLiceince: UILabel!
    @IBOutlet weak var smokeSegm: UISegmentedControl!
    @IBOutlet weak var licSegm: UISegmentedControl!
    
    var cvIsValid = false
    let positionUrl = "http://ahmedhariedy62848.ipage.com/wazeftak/apis/positiondata.php"
    let careerUrl = "http://ahmedhariedy62848.ipage.com/wazeftak/apis/careerlevelData.php"
    let insertEmployUrl = "http://ahmedhariedy62848.ipage.com/wazeftak/apis/employmentdatainsert.php"
    fileprivate let  keychainAccess = KeychainAccess()
    fileprivate var userId = ""
    var positionList: [postionsData] = []
    var careerList: [careerLevelData] = []
    var selectedCarer :String!
    var selectedPosition:String!
    var selectedSmokeSegm :String!
    var selectedLicenceSegm :String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        userId =  keychainAccess.getPasscode(identifier: "user_id")!
        
        title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "jobInfo", comment: "")
        desierdJob.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "desirdJob", comment: "")
        doYouSmoke.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "smoke", comment: "")
        driveLiceince.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "driveLicLabel", comment: "")
        expSalary.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "expSalary", comment: "")
        afterFive.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "afterFive", comment: "")
        acceptOutlet.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "acceptOutlet", comment: ""), for: .normal)
        currentCarrer.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "currerLevel", comment: "")
        smokeSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "yes", comment: ""), forSegmentAt:  1)
        smokeSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "no", comment: ""), forSegmentAt:  0)
        licSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "yes", comment: ""), forSegmentAt:  1)
        licSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "no", comment: ""), forSegmentAt:  0)
        
        helpedFunctions.sharedInstance.getData(url: positionUrl) { (data) in
            if let data = data {
                do {
                    let json = try JSONDecoder().decode(postitionDatArr.self, from: data)
                    self.positionList = json.data
                    DispatchQueue.main.async {
                        self.desierdJopPicker.reloadAllComponents()
                    }
                }
                catch let err as NSError{
                    print(err.localizedDescription)
                }
            }
        }
        helpedFunctions.sharedInstance.getData(url: careerUrl) { (data) in
            if let data = data {
                do {
                    let json = try JSONDecoder().decode(carrelLevelDataArr.self, from: data)
                    self.careerList = json.data
                    DispatchQueue.main.async {
                        self.carrerLevel.reloadAllComponents()
                    }
                }
                catch let err as NSError{
                    print(err.localizedDescription)
                }
            }
        }
    }
    
    func isValidUrl(url: String) -> Bool {
        let urlRegEx = "^(https?://)?(www\\.)?([-a-z0-9]{1,63}\\.)*?[a-z0-9][-a-z0-9]{0,61}[a-z0-9]\\.[a-z]{2,6}(/[-\\w@\\+\\.~#\\?&/=%]*)?$"
        let urlTest = NSPredicate(format: "SELF MATCHES %@", urlRegEx)
        let result = urlTest.evaluate(with: url)
        return result
    }
    
    @IBAction func segmAction(_ sender: UISegmentedControl) {
        if sender == smokeSegm {
            if smokeSegm.selectedSegmentIndex == 0 {
                selectedSmokeSegm = "No"
            }
            else{
                selectedSmokeSegm = "Yes"
            }
            
        }
        if sender == licSegm {
            if smokeSegm.selectedSegmentIndex == 0 {
                selectedLicenceSegm = "No"
            }
            else{
                selectedLicenceSegm = "Yes"
            }
            
        }
        
    }
    
    @IBAction func cvUrlValiditaion(_ sender: UITextField) {
        if cvGoogleDrive.text != ""
        {
           cvIsValid =  isValidUrl(url: cvGoogleDrive.text!)
        }
    }
    @IBAction func acceptAction(_ sender: Any) {
        if selectedPosition != nil && selectedCarer != nil && selectedSmokeSegm != nil && selectedLicenceSegm != nil && cvIsValid && expSalary.text != "" && afterFive.text != "" && cvGoogleDrive.text != ""{
            let activityInd = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
            activityInd.color = UIColor.darkGray
            activityInd.center = view.center
            activityInd.startAnimating()
            view.addSubview(activityInd)
            let employDataPost = employmentData.init(salary: expSalary.text!, smoke: selectedSmokeSegm, license_drive: selectedLicenceSegm, linkcv: cvGoogleDrive.text!, youafterfive: afterFive.text!, position_id: selectedPosition, career_level_id: selectedCarer, user_id: userId)
            helpedFunctions.sharedInstance.postDataWithOutRes(postData: employDataPost, url: insertEmployUrl) { (data) in
                if let dataEmp = data{
                    do {
                        let empJson = try JSONDecoder().decode(personalResponse.self, from: dataEmp)
                       // print(empJson)
                        if empJson.message == "Successfully"{
                            DispatchQueue.main.async {
                                activityInd.stopAnimating()
                                activityInd.removeFromSuperview()
                                if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
                                    let thanksVc = self.storyboard?.instantiateViewController(withIdentifier: "thanksVc") as! thanksVc
                                    self.present(thanksVc, animated: true)
                                } else {
                                    self.performSegue(withIdentifier: "showExam", sender: self)
                                }
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
            if cvIsValid {
                AlertController.showAlert(self, title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "emptyField", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "allReq", comment: ""))
            }
            else{
                AlertController.showAlert(self, title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "emptyField", comment: ""), message: "\(LocalizationSystem.sharedInstance.localizedStringForKey(key: "allReq", comment: "")) link not valid " )
            }
            
        }
        
        
        
    }
}

extension acceptVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == desierdJopPicker {
            return positionList.count
        } else if pickerView == carrerLevel {
            return careerList.count
        }
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == desierdJopPicker {
            selectedPosition = positionList[row].position_id

        } else if pickerView == carrerLevel {
            selectedCarer = careerList[row].career_level_id

        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == desierdJopPicker {
            return positionList[row].position_name
        } else if pickerView == carrerLevel {
            return careerList[row].career_name
        }
        return ""
    }
}
