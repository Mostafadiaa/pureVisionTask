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
    @IBOutlet weak var qualName: UISegmentedControl!
    @IBOutlet weak var schoolNameField: UITextField!
    @IBOutlet weak var courseNameField: UITextField!
    @IBOutlet weak var locationNameField: UITextField!
    @IBOutlet weak var numOfYearsField: UITextField!
    @IBOutlet weak var gradYearField: UITextField!
    @IBOutlet weak var doneOutlet: UIButton!
    @IBOutlet weak var addOutlet: UIButton!
    @IBOutlet weak var segmQual: UISegmentedControl!
    @IBOutlet weak var comPlete: UIButton!
    
    
    
 //  @IBOutlet weak var xView: UIView!
   // var startCgange = false
    @IBOutlet weak var pickerC: UIPickerView!
    
@IBOutlet var fiView: UIVisualEffectView!
    var qData : [String:[String]] = [:]
    var qDataKeys: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "education", comment: "")
        qDataKeys = Array(qData.keys).sorted()
            segmQual.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "highSchool", comment: ""), forSegmentAt: 0)
        segmQual.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "college", comment: ""), forSegmentAt: 1)
        segmQual.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "other", comment: ""), forSegmentAt: 2)
        
        schoolNameField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "name", comment: "")
           courseNameField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "courseName", comment: "")
        locationNameField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "courselocation", comment: "")
        numOfYearsField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "numOfYears", comment: "")
        gradYearField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "gradYear", comment: "")
        doneOutlet.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "Done", comment: ""), for: .normal)
        addOutlet.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "add", comment: ""), for: .normal)
        comPlete.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "continueKey", comment: ""), for: .normal)
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
        if schoolNameField.text != "" && courseNameField.text != "" && numOfYearsField.text != "" && gradYearField.text != "" &&  locationNameField.text != "" &&  self.qualName.selectedSegmentIndex != UISegmentedControl.noSegment{
            UIView.animate(withDuration: 0.5) {
                self.fiView.alpha = 0.0
            }
            let count = qDataKeys.count + 1
            guard let title = qualName.titleForSegment(at: qualName.selectedSegmentIndex) else {
                return
            }
            self.qualName.selectedSegmentIndex = UISegmentedControl.noSegment
            qData["Qualification \(count)"] = [title,schoolNameField.text!,courseNameField.text!,locationNameField.text!,numOfYearsField.text!,gradYearField.text!]
            qDataKeys.append("Qualification \(count)")
            let indexPath = IndexPath(row: qDataKeys.count - 1, section: 0)
            eduTabel.beginUpdates()
            eduTabel.insertRows(at: [indexPath], with:.automatic )
            eduTabel.endUpdates()
            schoolNameField.text = ""
            courseNameField.text = ""
            numOfYearsField.text = ""
            gradYearField.text = ""
            locationNameField.text = ""
            view.endEditing(true)
        }
        
        else{
           AlertController.showAlert(self, title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "emptyField", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "allReq", comment: ""))
        }
        
    }
    
    @IBAction func completeAction(_ sender: Any) {
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
        eduCell?.certLabe.text = arr[0]
        eduCell?.schoolName.text = arr[1]
        eduCell?.courseLabel.text = arr[2]
        eduCell?.locationLabel.text = arr[3]
        eduCell?.yearsNumLabel.text = arr[4]
        eduCell?.gradYearLabel.text = arr[5]
        
        
       // eduCell?.courseLabel.text = x["key2"]
//        eduCell?.certLabe.text = x["key1"] //x[y[indexPath.row]]
        return eduCell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 205
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
