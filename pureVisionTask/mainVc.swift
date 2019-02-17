//
//  mainVc.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 2/16/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class mainVc: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func engButt(_ sender: Any) {
            LocalizationSystem.sharedInstance.setLanguage(languageCode: "en")
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
            viewDidLoad()
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "vcW") as! ViewController
            let appDlg = UIApplication.shared.delegate as? AppDelegate
            appDlg?.window?.rootViewController = vc
            self.dismiss(animated: true, completion: nil)
            present(vc,animated: true)
        
    }
    
    
    @IBAction func arButt(_ sender: Any) {
        LocalizationSystem.sharedInstance.setLanguage(languageCode: "ar")
        UIView.appearance().semanticContentAttribute = .forceRightToLeft
        viewDidLoad()
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "vcW") as! ViewController
        let appDlg = UIApplication.shared.delegate as? AppDelegate
        appDlg?.window?.rootViewController = vc
        self.dismiss(animated: true, completion: nil)
        present(vc,animated: true)
        }
    
    

}
