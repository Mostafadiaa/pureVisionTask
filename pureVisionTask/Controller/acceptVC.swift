//
//  acceptVC.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 2/20/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class acceptVC: UIViewController {
    var desierdJopData = ["PHP Developer", "Andorid Develper", "BackEnd Developer"]
    var currentLevel = ["entry level", "senior", "junior"]
    @IBOutlet var currentCarrer: UILabel!
    @IBOutlet var desierdJopPicker: UIPickerView!
    @IBOutlet var expSalary: UITextField!
    @IBOutlet var desierdJob: UILabel!
    @IBOutlet var afterFive: UITextField!
    @IBOutlet var acceptOutlet: UIButton!
    @IBOutlet var carrerLevel: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "jobInfo", comment: "")
        desierdJob.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "desirdJob", comment: "")
        expSalary.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "expSalary", comment: "")
        afterFive.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "afterFive", comment: "")
        acceptOutlet.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "acceptOutlet", comment: ""), for: .normal)
        currentCarrer.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "currerLevel", comment: "")
    }

    @IBAction func acceptAction(_ sender: Any) {
        if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
            let thanksVc = storyboard?.instantiateViewController(withIdentifier: "thanksVc") as! thanksVc
            present(thanksVc, animated: true)
        } else {
            performSegue(withIdentifier: "showExam", sender: self)
        }
    }
}

extension acceptVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == desierdJopPicker {
            return desierdJopData.count
        } else if pickerView == carrerLevel {
            return currentLevel.count
        }
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == desierdJopPicker {
            print(desierdJopData[row])
        } else if pickerView == carrerLevel {
            print(currentLevel[row])
        }
        // print(desierdJopData[row])
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == desierdJopPicker {
            return desierdJopData[row]
        } else if pickerView == carrerLevel {
            return currentLevel[row]
        }
        // return desierdJopData[row]
        return ""
    }
}
