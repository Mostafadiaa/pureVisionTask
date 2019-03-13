//
//  personlVC.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 2/17/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit



class personlVC: UIViewController {
    //let bb = "https://amrwaheeed.000webhostapp.com/wazzaf-app/apis/religiondata.php"
    let bb = "http://amrwahed2.000webhostapp.com/wazzaf-app/apis/religiondata.php"
    
    @IBOutlet var tapToChosePhoto: UITapGestureRecognizer!
    @IBOutlet var userImage: UIImageView!
    var imgPicker = UIImagePickerController()
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
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var natLabel: UILabel!
    @IBOutlet var religLabel: UILabel!
    @IBOutlet var tapTwice: UITextView!
    @IBOutlet var cityPicker: UIPickerView!
    @IBOutlet var natPicker: UIPickerView!
    @IBOutlet var religionPicker: UIPickerView!
    @IBOutlet var navTitel: UINavigationItem!
    @IBOutlet var countryPicer: UIPickerView!

    var countryNames = ["Egypt", "KSA", "London"]
    var cityNames = ["Giza", "Cairo", "Maadi"]
    var natNames = ["Egyptian", "Saudi", "American", "Canadian"]
    //var religionNames = ["Christian", "Muslim", "Other"]
    var strDate: String?
    let dateFormatter = DateFormatter()
    var relegList:[relData] = []
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
        getRelegion()
        dateFormatter.dateFormat = "dd/MM/yyyy"
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
        cityLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "city", comment: "")
        countryName.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "countryName", comment: "")
        religLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "religion", comment: "")
        natLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "nationality", comment: "")
        birthDateLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "dateBirth", comment: "")
        hideKeyboardWhenTappedAround()
    }

    @IBAction func tapTochoseImageAc(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.tapTwice.alpha = 0.0
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
    }

    @IBAction func testJsonAction(_ sender: Any) {
        
    }

    func getRelegion() {
        guard let relData = URL(string: bb) else {
            return
        }
        var urlRequest = URLRequest(url: relData)
        urlRequest.httpMethod = "GET"
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) { data, _, _ in
            guard let data = data else {
                return
            }
            do {
                //   let user = try? newJSONDecoder().decode(User.self, from: jsonData)
                let relJson = try JSONDecoder().decode(religionData.self, from: data)
                self.relegList = relJson.data
                //self.relegList = relJson
                DispatchQueue.main.async {
                    self.religionPicker.reloadAllComponents()
                }
            } catch let error as NSError {
                print(error)
            }
        }

        task.resume()
    }
}

extension personlVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == cityPicker {
            return cityNames.count
        } else if pickerView == natPicker {
            return natNames.count
        } else if pickerView == religionPicker {
            return relegList.count
           // return religionNames.count
        } else if pickerView == countryPicer {
            return countryNames.count
        }
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == cityPicker {
            print(cityNames[row])
        } else if pickerView == natPicker {
            print(natNames[row])
        } else if pickerView == religionPicker {
            if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
                print(relegList[row].religion_id)
            } else {
                print(relegList[row].religion_id)
            }
        } else if pickerView == countryPicer {
            print(countryNames[row])
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == cityPicker {
            return cityNames[row]
        } else if pickerView == natPicker {
            return natNames[row]
        } else if pickerView == religionPicker {
            if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
                return relegList[row].arabic_name
            } else {
                return relegList[row].religion_name
            }
        } else if pickerView == countryPicer {
            return countryNames[row]
        }
        return ""
    }
}

extension personlVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let imageData = info[.originalImage] as? UIImage {
            userImage.image = imageData
        }
        dismiss(animated: true, completion: nil)
    }
}
