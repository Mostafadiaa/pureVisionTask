//
//  jobVc.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 2/19/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class jobVc: UIViewController {
    @IBOutlet var jobTabel: UITableView!
    @IBOutlet var addOutlet: UIButton!
    @IBOutlet var compOutlet: UIButton!
    @IBOutlet var comName: UITextField!
    @IBOutlet var jobTitel: UITextField!
    @IBOutlet var reason: UITextField!
    @IBOutlet var salary: UITextField!
    @IBOutlet var startDate: UIDatePicker!
    @IBOutlet var endDate: UIDatePicker!
    @IBOutlet var startLabel: UILabel!
    @IBOutlet var endLabel: UILabel!
    @IBOutlet var doneOutlet: UIButton!
    @IBOutlet var viView: UIVisualEffectView!
    @IBOutlet weak var topSpace: NSLayoutConstraint!
    
    @IBOutlet var tapToChosePhoto: UITapGestureRecognizer!
    
    fileprivate let  keychainAccess = KeychainAccess()
    fileprivate var userId = ""
    var jobStrDate: String?
    var jobEndDate: String?
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

   // var jobData: [String: [String]] = [:]
   // var jobDataKeys: [String] = []
    let insertExperianceUrl = "http://ahmedhariedy62848.ipage.com/wazeftak/apis/experianceinsertdata.php"
    var dateFormatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        userId =  keychainAccess.getPasscode(identifier: "user_id")!

       // self.salary.text = " "
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
            comName.textAlignment = .right
            jobTitel.textAlignment = .right
            reason.textAlignment = .right
            salary.textAlignment = .right
        } else {
            comName.textAlignment = .left
            jobTitel.textAlignment = .left
            reason.textAlignment = .left
            salary.textAlignment = .left
        }
       // jobDataKeys = Array(jobData.keys).sorted()
        hideKeyboardWhenTappedAround()
        title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "jobHistory", comment: "")
        addOutlet.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "add", comment: ""), for: .normal)
        compOutlet.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "continueKey", comment: ""), for: .normal)
        comName.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "comName", comment: "")
        jobTitel.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "jobTitel", comment: "")
        reason.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "reason", comment: "")
        salary.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "salary", comment: "")
        startLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "startDate", comment: "")
        endLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "endDate", comment: "")
        doneOutlet.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "Done", comment: ""), for: .normal)
    }

    @IBAction func doneAction(_ sender: Any) {
        //let count = jobDataKeys.count + 1
       
        if comName.text != "" && jobTitel.text != "" && jobStrDate != jobEndDate && reason.text != "" {
            let activityInd = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
            activityInd.color = UIColor.darkGray
            activityInd.center = view.center
            activityInd.startAnimating()
            view.addSubview(activityInd)
//            UIView.animate(withDuration: 0.5) {
//                self.viView.alpha = 0.0
//            }
           // jobData["job \(count)"] = [comName.text!, jobTitel.text!, starSelectedDate, endSelectedDate, salary.text!, reason.text!]
            //jobDataKeys.append("job \(count)")
//            let indexPath = IndexPath(row: jobDataKeys.count - 1, section: 0)
//            jobTabel.beginUpdates()
//            jobTabel.insertRows(at: [indexPath], with: .automatic)
//            jobTabel.endUpdates()
            let experianceDataPost = insertExData.init(company_name: comName.text!, job_title: jobTitel.text!, date_start: jobStrDate!, date_end: jobEndDate!, salary: salary.text ?? " ", reasonforleaving: reason.text!, user_id: userId)
            helpedFunctions.sharedInstance.postDataWithOutRes(postData: experianceDataPost, url: insertExperianceUrl) { (data) in
                if let dataRes = data {
                    do {
                        let expResJson = try JSONDecoder().decode(personalResponse.self, from: dataRes)
                        if expResJson.message == "Successfully"{
                            DispatchQueue.main.async {
                                self.topSpace.constant = 44
                                self.doneOutlet.alpha = 0
                                activityInd.stopAnimating()
                                activityInd.removeFromSuperview()
                                
                            }
                        }
                        print(expResJson)
                    }
                    catch let err as NSError{
                        print(err.localizedDescription)
                    }
                }
            }
           
        } else {
            AlertController.showAlert(self, title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "emptyField", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "allReq", comment: ""))
        }
    }

    @IBAction func addAction(_ sender: Any) {
//        UIView.animate(withDuration: 0.5) {
//            self.viView.alpha = 1.0
//        }
        self.startDate.setDate(Date(), animated: true)
        self.endDate.setDate(Date(), animated: true)
        self.jobStrDate = nil
        self.jobStrDate = nil
        comName.text = ""
        jobTitel.text = ""
        salary.text = ""
        reason.text = ""
        self.doneOutlet.alpha = 1
        view.endEditing(true)
        
        
    }

    @IBAction func compAcction(_ sender: Any) {
//        if jobDataKeys.count == 0 {
//            AlertController.showAlert(self, title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "emptyField", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "addNewElemen", comment: ""))
//        }
        
    }

    @IBAction func startAction(_ sender: Any) {
        jobStrDate = dateFormatter.string(from: startDate.date)
        if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
            for (key, value) in arabicNumbers {
                jobStrDate = jobStrDate!.replacingOccurrences(of: key, with: value)
            }
        }
    }

    @IBAction func endAction(_ sender: Any) {
        jobEndDate = dateFormatter.string(from: endDate.date)
        if LocalizationSystem.sharedInstance.getLanguage() == "ar" {
            for (key, value) in arabicNumbers {
                jobEndDate = jobEndDate!.replacingOccurrences(of: key, with: value)
            }
        }
    }
}

extension jobVc: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return jobDataKeys.count
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let jobCell = jobTabel.dequeueReusableCell(withIdentifier: "jobCell") as! jobTabelCell
//        let key = jobDataKeys[indexPath.row]
//        let arr = jobData[key]!
//        jobCell.companyName.text = arr[0]
//        jobCell.jobTitel.text = arr[1]
//        jobCell.dateWork.text = "\(LocalizationSystem.sharedInstance.localizedStringForKey(key: "from", comment: "")) \(arr[2]) \(LocalizationSystem.sharedInstance.localizedStringForKey(key: "to", comment: ""))  \(arr[3])"
//        jobCell.salary.text = arr[4]
//        jobCell.reason.text = arr[5]

        return jobCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 205
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            jobDataKeys.remove(at: indexPath.row)
//            jobTabel.beginUpdates()
//            jobTabel.deleteRows(at: [indexPath], with: .automatic)
//            jobTabel.endUpdates()
//        }
//    }
}
