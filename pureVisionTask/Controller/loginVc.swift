//
//  loginVc.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 2/17/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

struct loginData:Codable{
    var userName = String()
    var passWord = String()
}

class loginVc: UIViewController {
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passField: UITextField!
    @IBOutlet var logButt: UIButton!
    @IBOutlet var signUpButt: UIButton!
    let loginUrl = "https://amrwaheeed.000webhostapp.com/wazzaf-app/apis/login.php"
   // let userName = "amr.waheed00@outlook.com"
    //let password = "01095202651*Aa"
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
    
    func loginfunc(){
        guard let urlToLogin = URL(string: loginUrl) else {
            return
        }
        var req = URLRequest(url: urlToLogin)
        req.httpMethod = "POST"
        let postString = "email=\(emailField.text!)&password=\(passField.text!)"
        req.httpBody = postString.data(using: .utf8)
        let session = URLSession.shared
        let task = session.dataTask(with: req) { (data, response, err) in
            guard let data = data else {
                return
            }
            do {
                let responsehh = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject]
               //print(responsehh)
                if responsehh!["status"]! as! String == "2" {
                    if responsehh!["type"]! as! String == "3" {
                       self.dismiss(animated: true, completion: nil)
                       self.performSegue(withIdentifier: "access", sender: self)
                        
                    }
                    else if responsehh!["type"]! as! String == "2" {
                     print("company")
                    }
                    else if responsehh!["type"]! as! String == "1" {
                        print("admin")
                    }
                }
                else{
                     AlertController.showAlert(self, title: "Something Wrong", message: "please check your mail for the activation")
                }
                
            } catch let error as NSError {
                print(error)
            }
            
            
        }
        task.resume()
    }

    @IBAction func logButtAc(_ sender: Any) {
        if emailField.text == "" || passField.text == ""{
            AlertController.showAlert(self, title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "emptyField", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "allReq", comment: ""))
        }else{
            loginfunc()
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
        let done: UIBarButtonItem = UIBarButtonItem(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "Done", comment: ""), style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        self.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction() {
        self.resignFirstResponder()
    }
    
}
