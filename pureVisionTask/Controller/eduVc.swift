//
//  eduVc.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 2/18/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class eduVc: UIViewController {
    
  //  @IBOutlet weak var eduTabel: UITableView!
    //  @IBOutlet weak var xTop: NSLayoutConstraint!
    @IBOutlet weak var eduTabel: UITableView!
    
    @IBOutlet weak var satrtDateLabel: UILabel!
    @IBOutlet weak var endDateLabel: UILabel!
    @IBOutlet weak var courseTopicField: UITextField!
    @IBOutlet weak var organizationNameField: UITextField!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    @IBOutlet weak var doneOutlet: UIButton!
    @IBOutlet weak var addOutlet: UIButton!
    @IBOutlet weak var comPlete: UIButton!
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
        "٩": "9"
    ]
     var dateFormatter = DateFormatter()
    
 //  @IBOutlet weak var xView: UIView!
   // var startCgange = false
    //@IBOutlet weak var pickerC: UIPickerView!
    
@IBOutlet var fiView: UIVisualEffectView!
    var qData : [String:[String]] = [:]
    var qDataKeys: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        if LocalizationSystem.sharedInstance.getLanguage() == "ar"
        {
            courseTopicField.textAlignment = .right
            organizationNameField.textAlignment = .right
           
        }
        else{
            courseTopicField.textAlignment = .left
            organizationNameField.textAlignment = .left
           
        }
        self.title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "coures", comment: "")
        qDataKeys = Array(qData.keys).sorted()
        
        courseTopicField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "courseName", comment: "")
        organizationNameField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "courselocation", comment: "")
       // startDateField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "startDate", comment: "")
      //  endDateField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "endDate", comment: "")
        doneOutlet.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "Done", comment: ""), for: .normal)
        addOutlet.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "add", comment: ""), for: .normal)
        comPlete.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "continueKey", comment: ""), for: .normal)
        satrtDateLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "startDate", comment: "")
        endDateLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "endDate", comment: "")
        
        hideKeyboardWhenTappedAround()
       
        }
    
      // view.addSubview(xView)
       //xView.center = view.center
        //NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        //NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
       // view.addSubview(fiView)
       // fiView.center = view.center

        // Do any additional setup after loading the view.

//    @objc func keyboardWillShow(notification: NSNotification) {
//       // xTop.isActive = true
//        if  let keyBoard = ((notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue) {
//            if startCgange {
//                if self.fiView.frame.origin.y == 0 {
//                    self.fiView.frame.origin.y -= keyBoard.height
//                    startCgange = false
//                }
//            }
//        }
//    }

//    @objc func keyboardWillHide(notification: NSNotification) {
//        if self.fiView.frame.origin.y != 0 {
//            self.fiView.frame.origin.y = 0
//        }
//
//    }
    @IBAction func testActo(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            self.fiView.alpha = 1.0
        }
  
        
        
        
        
    }
    
    @IBAction func doneCer(_ sender: Any) {
        //let starSelectedDate = dateFormatter.string(from: startDatePicker.date)
        //let endSelectedDate = dateFormatter.string(from: endDatePicker.date)
        guard let starSelectedDate = eduStrDate else {
            return
        }
        guard let endSelectedDate = eduEndDate else {
            return
        }

        if courseTopicField.text != "" && organizationNameField.text != ""  && starSelectedDate != endSelectedDate {
            UIView.animate(withDuration: 0.5) {
                self.fiView.alpha = 0.0
            }
            let count = qDataKeys.count + 1
//            guard let title = qualName.titleForSegment(at: qualName.selectedSegmentIndex) else {
//                return
//            }
            //self.qualName.selectedSegmentIndex = UISegmentedControl.noSegment
            qData["Qualification \(count)"] = [courseTopicField.text!,organizationNameField.text!,starSelectedDate,endSelectedDate]
            qDataKeys.append("Qualification \(count)")
            let indexPath = IndexPath(row: qDataKeys.count - 1, section: 0)
            eduTabel.beginUpdates()
            eduTabel.insertRows(at: [indexPath], with:.automatic )
            eduTabel.endUpdates()
            courseTopicField.text = ""
            organizationNameField.text = ""
            view.endEditing(true)
        }
        
        else{
           AlertController.showAlert(self, title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "emptyField", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "allReq", comment: ""))
        }
        
    }
    
    @IBAction func completeAction(_ sender: Any) {
        if qDataKeys.count == 0{
             AlertController.showAlert(self, title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "emptyField", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "addNewElemen", comment: ""))
        }
    }
    
    
    @IBAction func startAction(_ sender: Any) {
        eduStrDate = dateFormatter.string(from: startDatePicker.date)
        if LocalizationSystem.sharedInstance.getLanguage() == "ar"{
        for (key,value) in arabicNumbers {
            eduStrDate = eduStrDate!.replacingOccurrences(of: key, with: value)
        }
        print(eduStrDate as Any)
        }
    }
    @IBAction func endAction(_ sender: Any) {
        eduEndDate = dateFormatter.string(from: endDatePicker.date)
        if LocalizationSystem.sharedInstance.getLanguage() == "ar"{
        for (key,value) in arabicNumbers {
            eduEndDate = eduEndDate!.replacingOccurrences(of: key, with: value)
        }
            print(eduEndDate ?? "dd")
            
        }
    }
    
//    @IBAction func startEdit(_ sender: Any) {
//        startCgange = true
//    }
    
    
    
}
extension eduVc:UITableViewDelegate,UITableViewDataSource{
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
       // eduCell?.certLabe.text = arr[0]
      //  eduCell?.schoolName.text = arr[1]
       // eduCell?.courseLabel.text = arr[2]
      //  eduCell?.locationLabel.text = arr[3]
      //  eduCell?.yearsNumLabel.text = arr[4]
      //  eduCell?.gradYearLabel.text = arr[5]
        
        
       // eduCell?.courseLabel.text = x["key2"]
//        eduCell?.certLabe.text = x["key1"] //x[y[indexPath.row]]
        return eduCell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 117
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            qDataKeys.remove(at: indexPath.row)
            eduTabel.beginUpdates()
            eduTabel.deleteRows(at: [indexPath], with: .automatic)
            eduTabel.endUpdates()
        }
    }

}
