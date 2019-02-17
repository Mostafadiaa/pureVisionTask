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
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
