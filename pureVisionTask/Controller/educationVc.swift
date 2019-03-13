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
    let deg = ["Bachelor", "Master", "PHD"]
    let grade = ["Excellent", "very good", "Good", "Poor"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // degreePicker.se = deg.count
        hideKeyboardWhenTappedAround()
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
    }
}

extension educationVc: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == gradePicker {
            return grade.count
        } else if pickerView == degreePicker {
            return deg.count
        }

        return 1
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == degreePicker {
            print(deg[row])
        } else if pickerView == gradePicker {
            print(grade[row])
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == gradePicker {
            return grade[row]
        } else if pickerView == degreePicker {
            return deg[row]
        }

        return ""
    }
}
