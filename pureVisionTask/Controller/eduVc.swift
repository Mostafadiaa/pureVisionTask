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
    @IBOutlet weak var topOutlet: NSLayoutConstraint!
    
    var eduStrDate: String?
    var eduEndDate: String?
    fileprivate let  keychainAccess = KeychainAccess()
    fileprivate var userId = ""
    let insertCourse = "http://ahmedhariedy62848.ipage.com/wazeftak/apis/couresinsertdata.php"
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
         userId =  keychainAccess.getPasscode(identifier: "user_id")!
        dateFormatter.dateFormat = "yyyy-MM-dd"
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
//        UIView.animate(withDuration: 0.5) {
//            self.fiView.alpha = 1.0
//        }
        self.doneOutlet.alpha = 1
        self.courseTopicField.text = ""
        self.organizationNameField.text = ""
        eduStrDate = nil
        eduEndDate = nil
        self.endDatePicker.setDate(Date(), animated: true)
        self.startDatePicker.setDate(Date(), animated: true)
        
        
    }

    @IBAction func doneCer(_ sender: Any) {
        
        guard let starSelectedDate = eduStrDate else {
            return
        }
        guard let endSelectedDate = eduEndDate else {
            return
        }
        print(starSelectedDate,endSelectedDate)
        if courseTopicField.text != "" && organizationNameField.text != "" && starSelectedDate != endSelectedDate {
            let activityInd = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
            activityInd.color = UIColor.darkGray
            activityInd.center = view.center
            activityInd.startAnimating()
            view.addSubview(activityInd)
            let courseData = insertCourseData.init(course_name: courseTopicField.text!, organization_name: organizationNameField.text!, start_date: starSelectedDate, end_date: endSelectedDate, user_id: userId)
            helpedFunctions.sharedInstance.postDataWithOutRes(postData: courseData, url: insertCourse) { (data) in
                if let dataRes = data {
                    do {
                    let insertCourseResJson = try JSONDecoder().decode(personalResponse.self, from: dataRes)
                        if insertCourseResJson.message == "Successfully"{
                            DispatchQueue.main.async {
                                self.comPlete.alpha = 1
                                activityInd.stopAnimating()
                                activityInd.removeFromSuperview()
                                self.topOutlet.constant = 44
                                self.doneOutlet.alpha = 0
                            }
                        }
                        print(insertCourseResJson)
                }
                    catch let err as NSError{
                        print(err.localizedDescription)
                    }
                }
            }
//            UIView.animate(withDuration: 0.5) {
//                self.fiView.alpha = 0.0
//            }
//            let count = qDataKeys.count + 1
//            qData["Qualification \(count)"] = [courseTopicField.text!, organizationNameField.text!, starSelectedDate, endSelectedDate]
//            qDataKeys.append("Qualification \(count)")
//            let indexPath = IndexPath(row: qDataKeys.count - 1, section: 0)
//            eduTabel.beginUpdates()
//            eduTabel.insertRows(at: [indexPath], with: .automatic)
//            eduTabel.endUpdates()
//            courseTopicField.text = ""
//            organizationNameField.text = ""
//            view.endEditing(true)
        } else {
            AlertController.showAlert(self, title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "emptyField", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "allReq", comment: ""))
        }
    }

    @IBAction func completeAction(_ sender: Any) {
        self.performSegue(withIdentifier: "okDone", sender: self)
        
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
