//
//  loginVc.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 2/17/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class loginVc: UIViewController {
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passField: UITextField!
    @IBOutlet var logButt: UIButton!
    @IBOutlet var signUpButt: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "email", comment: "")
        passField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Pass", comment: "")
        logButt.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "logIn", comment: ""), for: .normal)
        signUpButt.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "signUp", comment: ""), for: .normal)
        hideKeyboardWhenTappedAround()
        if Locale.current.languageCode == "ar" {
           // LocalizationSystem.sharedInstance.setLanguage(languageCode: "ar")
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
           // let appDlg = UIApplication.shared.delegate as? AppDelegate
          //  appDlg?.window?.rootViewController = self
           // emailField.textAlignment = .right
           // passField.textAlignment = .right
        }
        else if  Locale.current.languageCode == "en" {
           // LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
           // let appDlg = UIApplication.shared.delegate as? AppDelegate
          //  appDlg?.window?.rootViewController = self
         //   emailField.textAlignment = .left
         //   passField.textAlignment = .left
        }

        }
    //}

    @IBAction func logButtAc(_ sender: Any) {
        if emailField.text == "diaa@test.com" && passField.text == "1234567"{
            print("done")
        }
    }

    @IBAction func signUpButtAcc(_ sender: Any) {
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
//        let toolBar = UIToolbar()
//        toolBar.sizeToFit()
//        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(UIViewController.dismissKeyboard))
//        toolBar.setItems([doneButton], animated: false)
//        toolBar.isUserInteractionEnabled = true
        
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
extension UITextField{
    
    @IBInspectable var doneAccessory: Bool{
        get{
            return self.doneAccessory
        }
        set (hasDone) {
            if hasDone{
                addDoneButtonOnKeyboard()
            }
        }
    }
    
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction() {
        self.resignFirstResponder()
    }
    
}
