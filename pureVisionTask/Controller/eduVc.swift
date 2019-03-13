//
//  eduVc.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 2/18/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class eduVc: UIViewController {
    @IBOutlet var eduTabel: UITableView!
    @IBOutlet var satrtDateLabel: UILabel!
    @IBOutlet var endDateLabel: UILabel!
    @IBOutlet var courseTopicField: UITextField!
    @IBOutlet var organizationNameField: UITextField!
    @IBOutlet var startDatePicker: UIDatePicker!
    @IBOutlet var endDatePicker: UIDatePicker!
    @IBOutlet var doneOutlet: UIButton!
    @IBOutlet var addOutlet: UIButton!
    @IBOutlet var comPlete: UIButton!
    var eduStrDate: String?
    var eduEndDate: String?
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
    var dateFormatter = DateFormatter()

    @IBOutlet var fiView: UIVisualEffectView!
    var qData: [String: [String]] = [:]
    var qDataKeys: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
            courseTopicField.textAlignment = .right
            organizationNameField.textAlignment = .right
        } else {
            courseTopicField.textAlignment = .left
            organizationNameField.textAlignment = .left
        }
        title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "coures", comment: "")
        qDataKeys = Array(qData.keys).sorted()

        courseTopicField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "courseName", comment: "")
        organizationNameField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "courselocation", comment: "")
        doneOutlet.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "Done", comment: ""), for: .normal)
        addOutlet.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "add", comment: ""), for: .normal)
        comPlete.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "continueKey", comment: ""), for: .normal)
        satrtDateLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "startDate", comment: "")
        endDateLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "endDate", comment: "")

        hideKeyboardWhenTappedAround()
    }

    @IBAction func testActo(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.fiView.alpha = 1.0
        }
    }

    @IBAction func doneCer(_ sender: Any) {
        guard let starSelectedDate = eduStrDate else {
            return
        }
        guard let endSelectedDate = eduEndDate else {
            return
        }

        if courseTopicField.text != "" && organizationNameField.text != "" && starSelectedDate != endSelectedDate {
            UIView.animate(withDuration: 0.5) {
                self.fiView.alpha = 0.0
            }
            let count = qDataKeys.count + 1
            qData["Qualification \(count)"] = [courseTopicField.text!, organizationNameField.text!, starSelectedDate, endSelectedDate]
            qDataKeys.append("Qualification \(count)")
            let indexPath = IndexPath(row: qDataKeys.count - 1, section: 0)
            eduTabel.beginUpdates()
            eduTabel.insertRows(at: [indexPath], with: .automatic)
            eduTabel.endUpdates()
            courseTopicField.text = ""
            organizationNameField.text = ""
            view.endEditing(true)
        } else {
            AlertController.showAlert(self, title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "emptyField", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "allReq", comment: ""))
        }
    }

    @IBAction func completeAction(_ sender: Any) {
        if qDataKeys.count == 0 {
            AlertController.showAlert(self, title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "emptyField", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "addNewElemen", comment: ""))
        }
    }

    @IBAction func startAction(_ sender: Any) {
        eduStrDate = dateFormatter.string(from: startDatePicker.date)
        if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
            for (key, value) in arabicNumbers {
                eduStrDate = eduStrDate!.replacingOccurrences(of: key, with: value)
            }
            print(eduStrDate as Any)
        }
    }

    @IBAction func endAction(_ sender: Any) {
        eduEndDate = dateFormatter.string(from: endDatePicker.date)
        if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
            for (key, value) in arabicNumbers {
                eduEndDate = eduEndDate!.replacingOccurrences(of: key, with: value)
            }
            print(eduEndDate ?? "dd")
        }
    }
}

extension eduVc: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return qDataKeys.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let eduCell = eduTabel.dequeueReusableCell(withIdentifier: "eduCell") as? eduCellClass
        let key = qDataKeys[indexPath.row]
        let arr = qData[key]!
        print(arr)
        eduCell?.courseTopic.text = arr[0]
        eduCell?.organizationName.text = arr[1]
        eduCell?.startToEndDate.text = "\(LocalizationSystem.sharedInstance.localizedStringForKey(key: "from", comment: "")) \(arr[2]) \(LocalizationSystem.sharedInstance.localizedStringForKey(key: "to", comment: "")) \(arr[3])"
        return eduCell!
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 117
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            qDataKeys.remove(at: indexPath.row)
            eduTabel.beginUpdates()
            eduTabel.deleteRows(at: [indexPath], with: .automatic)
            eduTabel.endUpdates()
        }
    }
}
