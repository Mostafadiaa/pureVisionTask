//
//  regVc.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 3/11/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class regVc: UIViewController {
    let regUrl = "https://amrwaheeed.000webhostapp.com/wazzaf-app/apis/register.php"
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var rePass: UITextField!
    @IBOutlet weak var doneOutlet: UIButton!
    @IBOutlet weak var userName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "email", comment: "")
        passField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Pass", comment: "")
        rePass.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "rePass", comment: "")
        userName.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "name", comment: "")
        doneOutlet.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "Done", comment: ""), for: .normal)
        hideKeyboardWhenTappedAround()
    }
    
    func regAct(){
        let postString = "username=\(userName.text!)&email=\(emailField.text!)&password=\(passField.text!)"
        guard let urlToReg = URL(string: regUrl) else {
            return
        }
        var req = URLRequest(url: urlToReg)
        req.httpMethod = "POST"
        req.httpBody = postString.data(using: .utf8)
        let session = URLSession.shared
        let task = session.dataTask(with: req) { (data, response, err) in
            guard let data = data else {
                return
            }
            do {
                let responsehh = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject]
                //print()
                if responsehh!["message"]! as! String == "User created" {
                    let alert = UIAlertController(title: "Welcome", message: "Has been successfully registered now please check your mail for the activation", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Go to Login", style: UIAlertAction.Style.default) {
                        _ in
                        self.dismiss(animated: true, completion: nil)
                    }
                    alert.addAction(okAction)
                    self.present(alert, animated: true, completion: nil)
                }
                else {
                    AlertController.showAlert(self, title: "Something Wrong", message: "\(responsehh!["message"]!)")
                    //print(responsehh!["message"]!)
                }
            } catch let error as NSError {
                AlertController.showAlert(self, title: "Something Wrong", message: "\(error.localizedDescription)")
            }
            
            
        }
        task.resume()
    }

    
    @IBAction func doneAction(_ sender: Any) {
        if emailField.text != "" && passField.text != "" && rePass.text != "" {
            guard let passtext = passField.text else {
                return
            }
                if passtext.count < 8 || passtext != rePass.text! {
                    AlertController.showAlert(self, title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "emptyField", comment: ""), message: "Password and Confirm Password does't match or the password less than eight chaacter")
                }
                else {
                    regAct()
                }
            
        }
        else {
             AlertController.showAlert(self, title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "emptyField", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "allReq", comment: ""))
        }
        
    }
    
}
