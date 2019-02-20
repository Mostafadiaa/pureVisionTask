//
//  thanksVc.swift
//  pureVisionTask
//
//  Created by Mostafa Diaa on 2/20/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class thanksVc: UIViewController {
    @IBOutlet weak var thanks: UILabel!
    @IBOutlet weak var reqRev: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.hidesBackButton = true;
        self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = false;
        self.navigationController!.interactivePopGestureRecognizer!.isEnabled = false;
        thanks.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "thankyou", comment: "")
        reqRev.text = LocalizationSystem.sharedInstance.localizedStringForKey(key: "thanks", comment: "")
        // Do any additional setup after loading the view.
    }
    


}
