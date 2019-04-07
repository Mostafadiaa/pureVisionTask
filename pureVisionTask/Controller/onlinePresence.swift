//
//  onlinePresence.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 3/5/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class onlinePresence: UIViewController {
    @IBOutlet var linkedInField: UITextField!
    @IBOutlet var githubField: UITextField!
    @IBOutlet var instagramField: UITextField!
    @IBOutlet var behanceField: UITextField!
    @IBOutlet var facebookField: UITextField!
    @IBOutlet var otherField: UITextField!
    @IBOutlet var websiteField: UITextField!
    @IBOutlet var blogField: UITextField!
    @IBOutlet var stackOverFlowField: UITextField!
    @IBOutlet var youTubeField: UITextField!
    @IBOutlet var otherUnderBar: UIProgressView!
    @IBOutlet var webSiteUnderBar: UIProgressView!
    @IBOutlet var blogUnderBar: UIProgressView!
    @IBOutlet var youtUnderBar: UIProgressView!
    @IBOutlet var stackUnderBar: UIProgressView!
    @IBOutlet var gitUnderBar: UIProgressView!
    @IBOutlet var instaUnderBar: UIProgressView!
    @IBOutlet var behanceUnderBar: UIProgressView!
    @IBOutlet var facebookUnderBar: UIProgressView!
    @IBOutlet var linkedUnderBar: UIProgressView!
    var linkedInFieldValid = false
    var githubFieldValid = false
    var instagramFieldValid = false
    var behanceFieldValid = false
    var facebookFieldValid = false
    var otherFieldValid = false
    var websiteFieldValid = false
    var blogFieldValid = false
    var stackOverFlowFieldValid = false
    var youTubeFieldValid = false
    fileprivate let keychainAccess = KeychainAccess()
    fileprivate var userId = ""
    let insertUrl = "http://ahmedhariedy62848.ipage.com/wazeftak/apis/onlinelinksdata.php"
    // var linke
    var test = false
    @IBOutlet var compOutlate: UIButton!
    let image = UIImage(named: "error")
    var currentTappedTextField: UITextField?
    override func viewDidLoad() {
        super.viewDidLoad()
        userId = keychainAccess.getPasscode(identifier: "user_id")!
        title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "OnlinePresence", comment: "")
        hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        compOutlate.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "continueKey", comment: ""), for: .normal)
    }

    @IBAction func beginT(_ sender: Any) {
        test = true
    }

    func isValidUrl(url: String) -> Bool {
        let urlRegEx = "^(https?://)?(www\\.)?([-a-z0-9]{1,63}\\.)*?[a-z0-9][-a-z0-9]{0,61}[a-z0-9]\\.[a-z]{2,6}(/[-\\w@\\+\\.~#\\?&/=%]*)?$"
        let urlTest = NSPredicate(format: "SELF MATCHES %@", urlRegEx)
        let result = urlTest.evaluate(with: url)
        return result
    }

    @objc func keyboardWillShow(notification: NSNotification) {
        if test {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
                if view.frame.origin.y == 0 {
                    view.frame.origin.y -= keyboardSize.height
                }
            }
            test = false
        }
    }

//
    @objc func keyboardWillHide(notification: NSNotification) {
        test = false
        if view.frame.origin.y != 0 {
            view.frame.origin.y = 0
        }
    }

    @IBAction func compAcction(_ sender: UIButton) {
        if linkedInFieldValid || facebookFieldValid || githubFieldValid || behanceFieldValid || stackOverFlowFieldValid || instagramFieldValid || youTubeFieldValid || blogFieldValid || websiteFieldValid || otherFieldValid {
            let activityInd = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.whiteLarge)
            activityInd.color = UIColor.darkGray
            activityInd.center = view.center
            activityInd.startAnimating()
            view.addSubview(activityInd)
             let linksPostData = linksData.init(linkedin: linkedInField.text ?? " ", facebook: facebookField.text ?? " ", behance: behanceField.text ?? " ", instgram: instagramField.text ?? " ", github: githubField.text ?? " ", stack_overview: stackOverFlowField.text ?? " ", youtube: youTubeField.text ?? " ", blog: blogField.text ?? " ", website: websiteField.text ?? " ", others: otherField.text ?? " ", user_id: userId)
            helpedFunctions.sharedInstance.postDataWithOutRes(postData: linksPostData, url: insertUrl) { data in
                if let data = data {
                    do {
                        let insLinksJson = try JSONDecoder().decode(personalResponse.self, from: data)
                        if insLinksJson.message == "Successfully" {
                            DispatchQueue.main.async {
                                activityInd.stopAnimating()
                                activityInd.removeFromSuperview()
                                self.performSegue(withIdentifier: "goToEmploymentData", sender: self)
                            }
                        }
                    } catch let err as NSError {
                        print(err.localizedDescription)
                    }
                }
            }
        }
    }

    @IBAction func testValidation(_ sender: UITextField) {
        if sender.text != "" {
            if !isValidUrl(url: sender.text!) {
                if sender == linkedInField {
                    linkedInFieldValid = false
                    linkedUnderBar.alpha = 1
                }
                if sender == githubField {
                    githubFieldValid = false
                    behanceUnderBar.alpha = 1
                }
                if sender == instagramField {
                    instagramFieldValid = false
                    stackUnderBar.alpha = 1
                }
                if sender == behanceField {
                    behanceFieldValid = false
                    instaUnderBar.alpha = 1
                }
                if sender == facebookField {
                    facebookFieldValid = false
                    facebookUnderBar.alpha = 1
                }
                if sender == otherField {
                    otherFieldValid = false
                    otherUnderBar.alpha = 1
                }
                if sender == websiteField {
                    websiteFieldValid = false
                    webSiteUnderBar.alpha = 1
                }
                if sender == blogField {
                    blogFieldValid = false
                    blogUnderBar.alpha = 1
                }
                if sender == stackOverFlowField {
                    stackOverFlowFieldValid = false
                    gitUnderBar.alpha = 1
                }
                if sender == youTubeField {
                    youTubeFieldValid = false
                    youtUnderBar.alpha = 1
                }
            } else {
                // sender.rightView?.alpha = 0
                if sender == linkedInField {
                    linkedInFieldValid = true
                    linkedUnderBar.alpha = 0
                }
                if sender == githubField {
                    githubFieldValid = true
                    behanceUnderBar.alpha = 0
                }
                if sender == instagramField {
                    instagramFieldValid = true
                    stackUnderBar.alpha = 0
                }
                if sender == behanceField {
                    behanceFieldValid = true
                    instaUnderBar.alpha = 0
                }
                if sender == facebookField {
                    facebookFieldValid = true
                    facebookUnderBar.alpha = 0
                }
                if sender == otherField {
                    otherFieldValid = true
                    otherUnderBar.alpha = 0
                }
                if sender == websiteField {
                    websiteFieldValid = true
                    webSiteUnderBar.alpha = 0
                }
                if sender == blogField {
                    blogFieldValid = true
                    blogUnderBar.alpha = 0
                }
                if sender == stackOverFlowField {
                    stackOverFlowFieldValid = true
                    gitUnderBar.alpha = 0
                }
                if sender == youTubeField {
                    youTubeFieldValid = true
                    youtUnderBar.alpha = 0
                }
            }
        }
    }
}
