//
//  personlVC.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 2/17/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class personlVC: UIViewController {
    @IBOutlet var heightOfImageContainer: NSLayoutConstraint!
    // let bb = "https://amrwaheeed.000webhostapp.com/wazzaf-app/apis/religiondata.php"
    let relegionUrl = "http://ahmedhariedy62848.ipage.com/wazeftak/apis/religiondata.php"
    let countryUrl = "http://ahmedhariedy62848.ipage.com/wazeftak/apis/countriesData.php"
    let nationalityUrl = "http://ahmedhariedy62848.ipage.com/wazeftak/apis/nationalteData.php"
    let insertPersonal = "http://ahmedhariedy62848.ipage.com/wazeftak/apis/insertdata.php"
    var selectedCountry: String?
    var selectedRelegion: String?
    var selectedNationalty: String?
    var userImageText :String!
    @IBOutlet var tapToChosePhoto: UITapGestureRecognizer!
    @IBOutlet var userImage: UIImageView!
    @IBOutlet var imageContainerView: UIView!
    fileprivate let  keychainAccess = KeychainAccess()
    fileprivate var userId = ""
    var imgPicker = UIImagePickerController()
    var idNumIsValid = false
    @IBOutlet var birthDatePicker: UIDatePicker!
    @IBOutlet var persLabel: UILabel!
    @IBOutlet var nameField: UITextField!
    @IBOutlet var adressField: UITextField!
    @IBOutlet var phoneField: UITextField!
    @IBOutlet var mobileField: UITextField!
    @IBOutlet var idNumField: UITextField!
    @IBOutlet var mailField: UITextField!
    @IBOutlet var mariStatLabel: UILabel!
    @IBOutlet var typelabel: UILabel!
    @IBOutlet var mariStatSegm: UISegmentedControl!
    @IBOutlet var typeSegm: UISegmentedControl!
    @IBOutlet var countryName: UILabel!
    @IBOutlet var birthDateLabel: UILabel!
    // @IBOutlet var cityLabel: UILabel!
    @IBOutlet var cityField: UITextField!
    @IBOutlet var natLabel: UILabel!
    @IBOutlet var religLabel: UILabel!
    @IBOutlet var tapTwice: UITextView!
    // @IBOutlet var cityPicker: UIPickerView!
    @IBOutlet var natPicker: UIPickerView!
    @IBOutlet var religionPicker: UIPickerView!
    @IBOutlet var navTitel: UINavigationItem!
    @IBOutlet var countryPicer: UIPickerView!
 
    var strDate: String?
    let dateFormatter = DateFormatter()
    var relegList: [relData] = []
    var countryList: [countryResponse] = []
    var nationalityList: [natResponse] = []
    let arabicNumbers = [
        "٠": "0",
        "١": "1",
        "٢": "2",
        "٣": "3",
        "٤": "4",
        "٥": "5",
        "٦": "6",
        "٧": "7",
        "٨": "8",
        "٩": "9",
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        userId =  keychainAccess.getPasscode(identifier: "user_id")!
        dateFormatter.dateFormat = "yyyy-MM-dd"
        imgPicker.delegate = self
        navTitel.title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "personal", comment: "")
        tapToChosePhoto.delegate = self as? UIGestureRecognizerDelegate
        tapToChosePhoto.numberOfTapsRequired = 2
        tapTwice.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "tapTwice", comment: "")
        persLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "personal", comment: "")
        nameField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "name", comment: "")
        adressField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "address", comment: "")
        phoneField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "phone", comment: "")
        mobileField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "mobile", comment: "")
        idNumField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "idNo", comment: "")
        mailField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "email", comment: "")
        mariStatLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "marital", comment: "")
        typelabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "type", comment: "")
        mariStatSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "married", comment: ""), forSegmentAt: 0)
        mariStatSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "single", comment: ""), forSegmentAt: 1)
        typeSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "femaile", comment: ""), forSegmentAt: 0)
        typeSegm.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "male", comment: ""), forSegmentAt: 1)
        cityField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "city", comment: "")
        countryName.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "countryName", comment: "")
        religLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "religion", comment: "")
        natLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "nationality", comment: "")
        birthDateLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "dateBirth", comment: "")
        hideKeyboardWhenTappedAround()
        //typeSegm.selectedSegmentIndex = UISegmentedControl.noSegment
        helpedFunctions.sharedInstance.getData(url: nationalityUrl) { data in
            if let data = data {
                do {
                    let natJson = try JSONDecoder().decode(nationalityData.self, from: data)
                    self.nationalityList = natJson.data
                    DispatchQueue.main.async {
                        self.natPicker.reloadAllComponents()
                    }
                } catch let error as NSError {
                    print(error)
                }
            }
        }
        helpedFunctions.sharedInstance.getData(url: countryUrl) { data in
            if let data = data {
                do {
                    let countryJson = try JSONDecoder().decode(countryData.self, from: data)
                    self.countryList = countryJson.data
                   // print(self.countryList)
                    DispatchQueue.main.async {
                        self.countryPicer.reloadAllComponents()
                    }
                } catch let error as NSError {
                    print(error)
                }
            }
        }
        helpedFunctions.sharedInstance.getData(url: relegionUrl) { data in
            if let data = data {
                do {
                    let relJson = try JSONDecoder().decode(religionData.self, from: data)
                    self.relegList = relJson.data
                    DispatchQueue.main.async {
                        self.religionPicker.reloadAllComponents()
                    }
                } catch let error as NSError {
                    print(error)
                }
            }
        }
    }

    @IBAction func tapTochoseImageAc(_ sender: Any) {
        heightOfImageContainer.constant = 180
        UIView.animate(withDuration: 0.5) {
            self.tapTwice.alpha = 0.0
            self.view.layoutIfNeeded()
        }

        imgPicker.sourceType = .photoLibrary
        imgPicker.allowsEditing = true
        present(imgPicker, animated: true, completion: nil)
    }

    @IBAction func dateBirthAct(_ sender: Any) {
        strDate = dateFormatter.string(from: birthDatePicker.date)
        for (key, value) in arabicNumbers {
            strDate = strDate!.replacingOccurrences(of: key, with: value)
        }
        // print(strDate)
    }
    
    @IBAction func idNumValidation(_ sender: UITextField) {
        if sender.text != ""{
            let senderText = sender.text
            if senderText!.count == 14{
                idNumIsValid = true
            }
            else{
                AlertController.showAlert(self, title: "Error", message: "Id number must be 14")
            }
        }
    }
    
    @IBAction func uploadJsonAction(_ sender: Any) {
        if nameField.text != "" && strDate != nil && mailField.text != "" && idNumField.text != "" && adressField.text != "" && phoneField.text != "" && mobileField.text != "" && typeSegm.selectedSegmentIndex != UISegmentedControl.noSegment && mariStatSegm.selectedSegmentIndex != UISegmentedControl.noSegment && selectedNationalty != nil && selectedCountry != nil && cityField.text != "" && userImageText != nil && selectedRelegion != nil && idNumIsValid {
            let activityInd = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
            activityInd.color = UIColor.darkGray
            activityInd.center = view.center
            activityInd.startAnimating()
            view.addSubview(activityInd)
            let persData = personData.init(fullname: "\(nameField.text!)", birthday: "\(strDate!)", address: "\(adressField.text!)", email: "\(mailField.text!)", civil_id_no: "\(idNumField.text!)", telephone: "\(phoneField.text!)", mobile: "\(mobileField.text!)", gender: "\(typeSegm.titleForSegment(at: typeSegm.selectedSegmentIndex)!)", martial_status: "\(mariStatSegm.titleForSegment(at: mariStatSegm.selectedSegmentIndex)!)", nationality_id: "\(selectedNationalty!)", country_id: "\(selectedCountry!)", city_name: "\(cityField.text!)", religion_id: "\(selectedRelegion!)", user_id: userId, image_name: "\(userImageText!)")
            helpedFunctions.sharedInstance.postDataWithOutRes(postData: persData, url: insertPersonal) { (data) in
                
                if let dataRes = data {
                    do {
                        let ResJson = try JSONDecoder().decode(personalResponse.self, from: dataRes)
                        if ResJson.message == "Successfully"{
                            DispatchQueue.main.async {
                                activityInd.stopAnimating()
                                activityInd.removeFromSuperview()
                                self.performSegue(withIdentifier: "personalDone", sender: self)
                            }

                        }
                        print(ResJson)
                    }
                    catch let err as NSError{
                        print(err.localizedDescription)
                    }
                }
                
            }
        } else {
            AlertController.showAlert(self, title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "emptyField", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "allReq", comment: "")) }
    }
}



extension personlVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == natPicker {
            return nationalityList.count
        } else if pickerView == religionPicker {
            return relegList.count
        } else if pickerView == countryPicer {
            return countryList.count
        }
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == natPicker {
            selectedNationalty = nationalityList[row].nationality_id

        } else if pickerView == religionPicker {
            if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
                selectedRelegion = relegList[row].religion_id
            } else {
                selectedRelegion = relegList[row].religion_id
            }
        } else if pickerView == countryPicer {
            selectedCountry = countryList[row].country_id
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == natPicker {
            //return nationalityList[row].nationality_enNationality
            if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
                return nationalityList[row].nationality_arNationality
            } else {
                return nationalityList[row].nationality_enNationality
            }
        } else if pickerView == religionPicker {
            if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
                return relegList[row].arabic_name
            } else {
                return relegList[row].religion_name
            }
        } else if pickerView == countryPicer {
            return countryList[row].nicename
        }
        return ""
    }
}

extension personlVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let imageData = info[.originalImage] as? UIImage {
            userImage.image = imageData
           guard let imgData = imageData.pngData() else { return }
            userImageText = imgData.base64EncodedString(options: .lineLength64Characters)
        }
        dismiss(animated: true, completion: nil)
    }
}
