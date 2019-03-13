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
    var test = false
    @IBOutlet var compOutlate: UIButton!

    var currentTappedTextField: UITextField?
    override func viewDidLoad() {
        super.viewDidLoad()

        title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "OnlinePresence", comment: "")
        hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        compOutlate.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "continueKey", comment: ""), for: .normal)
    }

    @IBAction func beginT(_ sender: Any) {
        test = true
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
}
