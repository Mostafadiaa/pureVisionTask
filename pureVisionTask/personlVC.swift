//
//  personlVC.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 2/17/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class personlVC: UIViewController {
    
    @IBOutlet var tapToChosePhoto: UITapGestureRecognizer!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var contAcc: UIButton!
   // @IBOutlet weak var choseBut: UIButton!
   // @IBOutlet weak var appliNO: UILabel!
    @IBOutlet weak var persLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var adressField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var mobileField: UITextField!
    @IBOutlet weak var idNumField: UITextField!
    @IBOutlet weak var mailField: UITextField!
    @IBOutlet weak var mariStatLabel: UILabel!
    @IBOutlet weak var typelabel: UILabel!
    @IBOutlet weak var mariStatSegm: UISegmentedControl!
    @IBOutlet weak var typeSegm: UISegmentedControl!
    @IBOutlet weak var validUpLabel: UILabel!
    @IBOutlet weak var birthDateLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var natLabel: UILabel!
    @IBOutlet weak var religLabel: UILabel!
    @IBOutlet weak var tapTwice: UITextView!
    @IBOutlet weak var cityPicker: UIPickerView!
    @IBOutlet weak var natPicker: UIPickerView!
    @IBOutlet weak var religionPicker: UIPickerView!
    @IBOutlet weak var navTitel: UINavigationItem!
    
    
    
    var cityNames = ["Giza","Cairo","Maadi"]
    var natNames = ["Egyptian","Saudi","American","Canadian"]
    var religionNames = ["Christian","Muslim","Other"]
    
    //var tapAlready = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navTitel.title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "personal", comment: "")
       // self.title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "personal", comment: "")
        tapToChosePhoto.delegate = self as? UIGestureRecognizerDelegate
        tapToChosePhoto.numberOfTapsRequired = 2
     //   contAcc.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "continueKey", comment: ""), for: .normal)
      //  choseBut.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "choseBut", comment: ""), for: .normal)
       // appliNO.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "ApplicationNo", comment: "")
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
         cityLabel.text  = LocalizationSystem.sharedInstance.localizedStringForKey(key: "city", comment: "")
         validUpLabel.text  = LocalizationSystem.sharedInstance.localizedStringForKey(key: "validTo", comment: "")
         religLabel.text  = LocalizationSystem.sharedInstance.localizedStringForKey(key: "religion", comment: "")
         natLabel.text  = LocalizationSystem.sharedInstance.localizedStringForKey(key: "nationality", comment: "")
        birthDateLabel.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "dateBirth", comment: "")
        hideKeyboardWhenTappedAround()
        
    }
    

    @IBAction func tapTochoseImageAc(_ sender: Any) {
        print("hehhehehe")
        UIView.animate(withDuration: 0.5) {
            self.tapTwice.alpha = 0.0
        }
        
       
        
    }
    
}
extension personlVC:UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {

        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == cityPicker{
             return cityNames.count
        }
        else if pickerView == natPicker {
            return natNames.count
        }
        else if pickerView == religionPicker {
            return religionNames.count
        }
       return 1
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == cityPicker{
            print(cityNames[row])
        }
        else if pickerView == natPicker {
            print(natNames[row])
        }
        else if pickerView == religionPicker {
            print(religionNames[row])
        }
       
       
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        if pickerView == cityPicker{
            return cityNames[row]
        }
        else if pickerView == natPicker {
            return natNames[row]
        }
        else if pickerView == religionPicker {
            return religionNames[row]
        }
        return ""
    }
    
    
}
