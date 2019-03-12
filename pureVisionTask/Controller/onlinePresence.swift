//
//  onlinePresence.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 3/5/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class onlinePresence: UIViewController {
    @IBOutlet weak var linkedInField: UITextField!
    @IBOutlet weak var githubField: UITextField!
    @IBOutlet weak var instagramField: UITextField!
    @IBOutlet weak var behanceField: UITextField!
    @IBOutlet weak var facebookField: UITextField!
    @IBOutlet weak var otherField: UITextField!
    @IBOutlet weak var websiteField: UITextField!
    @IBOutlet weak var blogField: UITextField!
    @IBOutlet weak var stackOverFlowField: UITextField!
    @IBOutlet weak var youTubeField: UITextField!
     var test = false
    @IBOutlet weak var compOutlate: UIButton!
    
var currentTappedTextField : UITextField?
    override func viewDidLoad() {
        super.viewDidLoad()

       self.title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "OnlinePresence", comment: "")
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
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
        test = false
    }
    }
//
    @objc func keyboardWillHide(notification: NSNotification) {
        test = false
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }


    
    

    

}

