//
//  regVc.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 3/11/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit


class regVc: UIViewController {
    let regUrl = "http://ahmedhariedy62848.ipage.com/wazeftak/apis/regist.php"
    @IBOutlet var emailField: UITextField!
    @IBOutlet var passField: UITextField!
    @IBOutlet var rePass: UITextField!
    @IBOutlet var doneOutlet: UIButton!
    @IBOutlet var userName: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "email", comment: "")
        passField.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "Pass", comment: "")
        rePass.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "rePass", comment: "")
        userName.placeholder = LocalizationSystem.sharedInstance.localizedStringForKey(key: "name", comment: "")
        doneOutlet.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "Done", comment: ""), for: .normal)
        hideKeyboardWhenTappedAround()
        
    }

    func regAct() {
        let activityInd = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
        activityInd.color = UIColor.darkGray
        activityInd.center = self.view.center
        activityInd.startAnimating()
        view.addSubview(activityInd)
        let registrationData = regData(username: userName.text!, email: emailField.text!, password: passField.text!)
        guard let urlToReg = URL(string: regUrl) else {
            return
        }
        var req = URLRequest(url: urlToReg)
        req.httpMethod = "POST"
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        req.addValue("application/json", forHTTPHeaderField: "Accept")
        do {
             let regJson = try JSONEncoder().encode(registrationData)
             req.httpBody = regJson
        }
        catch let regError as NSError{
            AlertController.showAlert(self, title: "Something Wrong", message: "\(regError.localizedDescription)")
        }
        let session = URLSession.shared
        let task = session.dataTask(with: req) { data, _, _ in
            guard let data = data else {
                return
            }
            do {
                let regJson = try JSONDecoder().decode(regResponse.self, from: data)
                if regJson.status == 200 {
                    DispatchQueue.main.async {
                        activityInd.stopAnimating()
                        activityInd.removeFromSuperview()
                    }
                    let alert = UIAlertController(title: "Welcome", message: "Has been successfully registered now please check your mail for the activation", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Go to Login", style: UIAlertAction.Style.default) {
                        _ in
                        self.dismiss(animated: true, completion: nil)
                    }
                    alert.addAction(okAction)
                    self.present(alert, animated: true, completion: nil)
                }
                else {
                    AlertController.showAlert(self, title: "Something Wrong", message: "\(regJson.message)")
                    
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
            } else {
                if CheckInternet.Connection() {
                    regAct()
                }
                else{
                    AlertController.showAlert(self, title: "Something Wrong", message: "No Internet Connection")
                }
               
            }
        } else {
            AlertController.showAlert(self, title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "emptyField", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "allReq", comment: ""))
        }
    }
}
