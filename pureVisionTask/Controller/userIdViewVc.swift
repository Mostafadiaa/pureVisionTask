//
//  userIdViewVc.swift
//  pureVisionTask
//
//  Created by Pure Vision on 4/7/19.
//  Copyright © 2019 Mostafa Diaa. All rights reserved.
//

import UIKit

class userIdViewVc: UIViewController {
    @IBOutlet weak var userId: UILabel!
    
    var userIdData = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userId.text  = "userIdData + \(userIdData)"
    }
    

    
}
