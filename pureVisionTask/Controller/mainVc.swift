//
//  mainVc.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 2/16/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class mainVc: UIViewController {
    @IBOutlet var dd: UINavigationItem!
    @IBOutlet var signOutOtlet: UIButton!
    var changeLang = false

    override func viewDidLoad() {
        super.viewDidLoad()
        dd.title = LocalizationSystem.sharedInstance.localizedStringForKey(key: "settings", comment: "")
        signOutOtlet.setTitle(LocalizationSystem.sharedInstance.localizedStringForKey(key: "signOut", comment: ""), for: .normal)
    }

    @IBAction func engButt(_ sender: Any) {
        let alert = UIAlertController(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "needR", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "restart", comment: ""), preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            _ in
            LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            self.viewDidLoad()
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)

    }




    @IBAction func arButt(_ sender: Any) {
        let alert = UIAlertController(title: LocalizationSystem.sharedInstance.localizedStringForKey(key: "needR", comment: ""), message: LocalizationSystem.sharedInstance.localizedStringForKey(key: "restart", comment: ""), preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            _ in
            LocalizationSystem.sharedInstance.setLanguage(languageCode: "ar")
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
            self.viewDidLoad()
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}
