//
//  jobVc.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 2/19/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class jobVc: UIViewController {

    @IBOutlet weak var jobTabel: UITableView!
    @IBOutlet weak var addOutlet: UIButton!
    @IBOutlet weak var compOutlet: UIButton!
    @IBOutlet weak var comName: UITextField!
    @IBOutlet weak var jobTitel: UITextField!
    @IBOutlet weak var reason: UITextField!
    @IBOutlet weak var salary: UITextField!
    @IBOutlet weak var startDate: UIDatePicker!
    @IBOutlet weak var endDate: UIDatePicker!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var endLabel: UILabel!
    @IBOutlet weak var doneOutlet: UIButton!
    @IBOutlet weak var viView: UIVisualEffectView!
    
     var jobData : [String:[String]] = [:]
     var jobDataKeys: [String] = []
     var dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         dateFormatter.dateFormat = "dd MMM yyyy"
        jobDataKeys = Array(jobData.keys).sorted()
        hideKeyboardWhenTappedAround()
        self.title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "jobHistory", comment: "")
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
      
        let count = jobDataKeys.count + 1
        let starSelectedDate = dateFormatter.string(from: startDate.date)
        let endSelectedDate = dateFormatter.string(from: endDate.date)
        if comName.text != "" && jobTitel.text != "" && starSelectedDate != endSelectedDate && salary.text != "" && reason.text != ""
        {
            UIView.animate(withDuration: 0.5) {
                self.viView.alpha = 0.0
            }
            jobData["job \(count)"] = [comName.text!,jobTitel.text!,starSelectedDate,endSelectedDate,salary.text!,reason.text!]
            jobDataKeys.append("job \(count)")
            let indexPath = IndexPath(row: jobDataKeys.count - 1, section: 0)
            jobTabel.beginUpdates()
            jobTabel.insertRows(at: [indexPath], with:.automatic )
            jobTabel.endUpdates()
        }
        else{
             AlertController.showAlert(self, title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "emptyField", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "allReq", comment: ""))
        }
        
    
    }
    
    @IBAction func addAction(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.viView.alpha = 1.0
        }
    }
    

    @IBAction func compAcction(_ sender: Any) {
        if jobDataKeys.count == 0 {
            AlertController.showAlert(self, title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "emptyField", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "addNewElemen", comment: ""))

            
        }
    }
    
}
extension jobVc:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobDataKeys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let jobCell = jobTabel.dequeueReusableCell(withIdentifier: "jobCell") as! jobTabelCell
        let key = jobDataKeys[indexPath.row]
        let arr = jobData[key]!
        jobCell.companyName.text = arr[0]
        jobCell.jobTitel.text = arr[1]
        jobCell.dateWork.text = "\(LocalizationSystem.sharedInstance.localizedStringForKey(key: "from", comment: "")) \(arr[2]) \(LocalizationSystem.sharedInstance.localizedStringForKey(key: "to", comment: ""))  \(arr[3])"
        jobCell.salary.text = arr[4]
        jobCell.reason.text = arr[5]
        
        return jobCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 205
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            jobDataKeys.remove(at: indexPath.row)
            jobTabel.beginUpdates()
            jobTabel.deleteRows(at: [indexPath], with: .automatic)
            jobTabel.endUpdates()
        }
    }
    
    
}
